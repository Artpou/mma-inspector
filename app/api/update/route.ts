import { NextRequest, NextResponse } from "next/server";

import { sleep } from "@/app/utils/time";
import prisma from "@/lib/prisma";

import getEvents, { ExtendedEvent } from "./getEvents";
import { getFighter } from "./getFighter";
import { getFights } from "./getFights";
import { getOdd } from "./getOdd";

const FORCE_UPDATE = [];

export async function GET(_request: NextRequest) {
  const data = await getEvents();

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
      } else if (FORCE_UPDATE.includes(event.id)) {
        event.needsUpdate = true;
        acc.needUpdate.push(event);
      }

      return acc;
    },
    { create: [] as ExtendedEvent[], needUpdate: [] as ExtendedEvent[] }
  );

  if (create.length === 0 && needUpdate.length === 0) {
    return NextResponse.json({ message: "No new events" });
  }

  await prisma.event.createMany({
    data: create.map((event) => {
      delete event.competitions;
      return event;
    }),
    skipDuplicates: true,
  });

  await prisma.$transaction(async (tx) => {
    for (const update of needUpdate) {
      const { competitions: _competitions, ...updatedEvent } = update;
      await tx.event.update({
        data: updatedEvent,
        where: { id: update.id },
      });
    }
  });

  const events = [...create, ...needUpdate];

  await sleep(200);

  events.map(async (event) => {
    const fights = await getFights(event);
    await sleep(100);

    await prisma.fight.deleteMany({
      where: { eventId: event.id },
    });

    fights.map(async (fight) => {
      const { fightersId, ...fightData } = fight;

      await prisma.fight.create({
        data: { ...fightData },
      });

      for (const fighterId of fightersId) {
        const fighter = await getFighter(fighterId);

        await prisma.fighter.upsert({
          create: fighter,
          update: fighter,
          where: { id: fighter.id },
        });
      }

      for (const fighterId of fightersId) {
        await prisma.fightsOnFighters.create({
          data: {
            fighterId: fighterId,
            fightId: fight.id,
          },
        });
      }

      const odds = await getOdd(event, fight);
      await prisma.odd.createMany({
        data: odds,
      });
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
