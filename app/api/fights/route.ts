import { NextRequest, NextResponse } from "next/server";

import prisma from "@/lib/prisma";
import { TFight } from "@/types";

export async function GET(
  request: NextRequest
): Promise<NextResponse<TFight[]>> {
  const eventId = request.nextUrl.searchParams.get("event");
  const onlyMain = request.nextUrl.searchParams.get("onlyMain") === "true";

  if (!eventId) {
    throw new Error("Event not found");
  }

  const data = await prisma.fight.findMany({
    where: onlyMain ? { eventId, matchNumber: 1 } : { eventId },
    include: {
      winner: {
        select: {
          id: true,
        },
      },
      fighters: {
        select: {
          fighterId: true,
          fighter: {
            include: {
              odds: true,
            },
          },
        },
      },
    },
    orderBy: {
      matchNumber: "asc",
    },
  });

  let endDat = performance.now();

  const fights = data.map((fight) => {
    const more = {
      fighterA: fight.fighters[0].fighter,
      fighterB: fight.fighters[1].fighter,
      winner: !!fight.winner
        ? fight.winner.id === fight.fighters[0].fighterId
          ? "A"
          : "B"
        : null,
    };

    delete fight.fighters;
    delete fight.winner;

    return {
      ...fight,
      ...more,
      winner: more.winner as "A" | "B" | null,
      stats: fight.stats as any,
    };
  });

  // @ts-ignore
  return NextResponse.json(fights);
}
