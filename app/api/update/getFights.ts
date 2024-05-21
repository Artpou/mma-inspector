import { Fight } from "@prisma/client";

import { clearLink } from "@/app/utils/string";

import { ExtendedEvent } from "./getEvents";

type ExtendedFight = Fight & {
  fightersId: string[];
};

export async function getFights(
  event: ExtendedEvent,
  existingFights: Fight[] = []
): Promise<ExtendedFight[]> {
  const { id } = event;

  const newFights = event.competitions.filter((fight) => {
    const find = existingFights.find((f) => f.id === fight.id);

    return !find || find.updatedAt < new Date(fight.updatedAt);
  });

  const datas = await newFights.map(async (fight) => {
    const type =
      fight.types?.length > 0 ? fight.types[0].text : fight.type?.text;

    const data: ExtendedFight = {
      id: fight.id,
      eventId: id,
      fightersId: fight.competitors.map((c) => c.id),
      winnerId: fight.competitors.find((c) => c.winner)?.id,
      createdAt: new Date(),
      description: fight.description
        ?.replace(/\b\d+-\b/g, "")
        .replace(")", " min)")
        .replace("Rnd", "Round"),
      matchNumber: fight.matchNumber,
      stats: undefined,
      status: undefined,
      titleShot: type?.includes("Title") || false,
      type,
      updatedAt: new Date(fight.lastUpdated),
      weight: fight.weight?.text,
    };

    const hasStats =
      !!fight.competitors[0]?.statistics?.["$ref"] &&
      !!fight.competitors[1]?.statistics?.["$ref"];

    if (!!data.winnerId && hasStats) {
      const fighter1StatsData = await fetch(
        clearLink(fight.competitors[0].statistics["$ref"])
      );
      const fighter1Stats = (await fighter1StatsData.json()).splits
        .categories[0].stats;

      const fighter2StatsData = await fetch(
        clearLink(fight.competitors[1].statistics["$ref"])
      );
      const fighter2Stats = (await fighter2StatsData.json()).splits
        .categories[0].stats;

      const getData = (stats: any[], name) =>
        stats.find((stat) => stat.name === name)?.value || 0;

      const getPartStrikes = (stats: any[], part: "Head" | "Body" | "Leg") =>
        stats
          .filter(
            (stat) => stat.name.includes(part) && stat.name.includes("Landed")
          )
          .reduce((acc, stat) => {
            return acc + stat.value;
          }, 0);

      data.stats = {};

      data.stats.fighterA = {
        bodyStrikes: getPartStrikes(fighter1Stats, "Body"),
        controlTime: getData(fighter1Stats, "timeInControl"),
        headStrikes: getPartStrikes(fighter1Stats, "Head"),
        ko: getData(fighter1Stats, "knockDowns"),
        legStrikes: getPartStrikes(fighter1Stats, "Leg"),
        significantStrikes: getData(fighter1Stats, "sigStrikesLanded"),
        significantStrikesAttempted: getData(
          fighter1Stats,
          "sigStrikesAttempted"
        ),
        strikes: getData(fighter1Stats, "totalStrikesLanded"),
        strikesAttempted: getData(fighter1Stats, "totalStrikesAttempted"),
        submissions: getData(fighter1Stats, "submissions"),
        takedowns: getData(fighter1Stats, "takedownsLanded"),
      };

      data.stats.fighterB = {
        bodyStrikes: getPartStrikes(fighter2Stats, "Body"),
        controlTime: getData(fighter2Stats, "timeInControl"),
        headStrikes: getPartStrikes(fighter2Stats, "Head"),
        ko: getData(fighter2Stats, "knockDowns"),
        legStrikes: getPartStrikes(fighter2Stats, "Leg"),
        significantStrikes: getData(fighter2Stats, "sigStrikesLanded"),
        significantStrikesAttempted: getData(
          fighter2Stats,
          "sigStrikesAttempted"
        ),
        strikes: getData(fighter2Stats, "totalStrikesLanded"),
        strikesAttempted: getData(fighter2Stats, "totalStrikesAttempted"),
        submissions: getData(fighter2Stats, "submissions"),
        takedowns: getData(fighter2Stats, "takedownsLanded"),
      };
    }

    if (!fight.status) return data;

    const responseStatus = await fetch(clearLink(fight.status["$ref"]));
    const status = await responseStatus.json();

    data.status = {
      clock: status.clock,
      name: status.result?.displayName,
      round: status.period,
      shortName: status.result?.shortDisplayName,
      target: status.result?.target?.name,
    };

    return data;
  });

  return await Promise.all(datas);
}
