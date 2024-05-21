import { NextRequest, NextResponse } from "next/server";

import { sleep } from "@/app/utils/time";
import prisma from "@/lib/prisma";

import getEvents from "./getEvents";
import { getFighter } from "./getFighter";
import { getFights } from "./getFights";
import { getOdd } from "./getOdd";

export async function GET(request: NextRequest) {
  const data = await getEvents();
  const force = request.nextUrl.searchParams.get("force");

  const existingEvent = await prisma.event.findMany({
    select: { id: true, updatedAt: true },
    where: {
      id: { in: data.map((event) => event.id) },
    },
  });

  const { create, needUpdate } = data.reduce(
    (acc, event) => {
      const find = existingEvent.find((e) => e.id === event.id);

      if (!find) {
        acc.create.push(event);
      } else if (find.updatedAt < event.updatedAt) {
        event.needsUpdate = true;
        acc.needUpdate.push(event);
      }

      return acc;
    },
    { create: [], needUpdate: [] }
  );

  await prisma.event.createMany({
    data: create,
    skipDuplicates: true,
  });

  await prisma.$transaction(async (tx) => {
    for (const update of needUpdate) {
      await tx.event.update({
        data: update,
        where: { id: update.id },
      });
    }
  });

  const events = await prisma.event.findMany({
    where: { needsUpdate: true },
  });

  await sleep(500);

  events.map(async (event) => {
    const fights = await getFights(event);

    fights.map(async (fight) => {
      const { fightersId, ...fightData } = fight;

      for (const fighterId of fightersId) {
        const fighter = await getFighter(fighterId);

        await prisma.fighter.upsert({
          create: fighter,
          update: fighter,
          where: { id: fighter.id },
        });
      }

      await prisma.fight.upsert({
        create: fightData,
        update: fightData,
        where: { id: fight.id },
      });

      for (const fighterId of fightersId) {
        const relationExists = await prisma.fightsOnFighters.findMany({
          select: { id: true },
          where: {
            fighterId: fighterId,
            fightId: fight.id,
          },
        });

        if (relationExists.length === 0) {
          await prisma.fightsOnFighters.create({
            data: {
              fighterId: fighterId,
              fightId: fight.id,
            },
          });
        }
      }

      const odds = await getOdd(event, fight);

      for (const odd of odds) {
        const oddExists = await prisma.odd.findFirst({
          where: { fighterId: odd.fighterId, fightId: odd.fightId },
        });

        if (oddExists) {
          await prisma.odd.updateMany({
            data: odd,
            where: { fighterId: odd.fighterId, fightId: odd.fightId },
          });
        } else {
          await prisma.odd.create({
            data: odd,
          });
        }
      }
    });
  });

  await prisma.event.updateMany({
    data: { needsUpdate: false },
    where: {
      id: { in: events.map((event) => event.id) },
    },
  });

  return NextResponse.json({
    count: events.length,
    events: events.map((event) => ({
      id: event.id,
      title: event.title,
    })),
  });
}
