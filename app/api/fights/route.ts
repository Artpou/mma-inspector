import prisma from "@/lib/prisma";
import { TFight } from "@/types";
import { NextRequest, NextResponse } from "next/server";

export async function GET(
  request: NextRequest
): Promise<NextResponse<TFight[]>> {
  const event = request.nextUrl.searchParams.get("event");

  if (!event) {
    throw new Error("Event not found");
  }

  const data = await prisma.fight.findMany({
    where: { eventId: event },
    include: {
      winner: true,
      fighters: {
        include: {
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
