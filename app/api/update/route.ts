import { NextRequest, NextResponse } from "next/server";
import getEvents from "./getEvents";
import prisma from "@/lib/prisma";
import { getFights } from "./getFights";
import { Fight } from "@prisma/client";
import { getFighter } from "./getFighter";
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
        where: { id: update.id },
        data: update,
      });
    }
  });

  const events = await prisma.event.findMany({
    where: { needsUpdate: true },
  });

  for (const event of events) {
    const fights = await getFights(event);

    console.log(
      "💾 FIGHT",
      event.id,
      ":",
      event.title,
      "nbFights: ",
      fights.length
    );

    // remove old fights to avoid conflict
    await prisma.fightsOnFighters.deleteMany({
      where: { fight: { eventId: event.id } },
    });
    await prisma.fight.deleteMany({
      where: { eventId: event.id },
    });

    for (const fight of fights) {
      const { fightersId, ...fightData } = fight;

      await prisma.$transaction(async (tx) => {
        for (const fighterId of fightersId) {
          const fighter = await getFighter(fighterId);

          await tx.fighter.upsert({
            where: { id: fighter.id },
            update: fighter,
            create: fighter,
          });
        }
      });

      await prisma.fight.create({
        data: fightData,
      });

      await prisma.$transaction(async (tx) => {
        for (const fighterId of fightersId) {
          const relationExists = await tx.fightsOnFighters.findMany({
            select: { id: true },
            where: {
              fighterId: fighterId,
              fightId: fight.id,
            },
          });

          if (relationExists.length === 0) {
            await tx.fightsOnFighters.create({
              data: {
                fighterId: fighterId,
                fightId: fight.id,
              },
            });
          }
        }
      });

      const odds = await getOdd(event, fight);

      await prisma.$transaction(async (tx) => {
        for (const odd of odds) {
          const oddExists = await tx.odd.findFirst({
            where: { fighterId: odd.fighterId },
          });

          if (oddExists) {
            await tx.odd.updateMany({
              where: { fighterId: odd.fighterId },
              data: odd,
            });
          } else {
            await tx.odd.create({
              data: odd,
            });
          }
        }
      });
    }
  }

  await prisma.event.updateMany({
    where: {
      id: { in: events.map((event) => event.id) },
    },
    data: { needsUpdate: false },
  });

  return NextResponse.json({
    count: events.length,
    events: events.map((event) => ({
      id: event.id,
      title: event.title,
    })),
  });
}
