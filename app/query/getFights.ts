import { Fight, Fighter, Odd } from "@/types";
import { CORE_URL } from "./constants";
import { getFighter } from "./getFighter";

export async function getFights({
  id,
  organization = "ufc",
  onlyTitle = false,
}): Promise<Fight[]> {
  const eventsData = await fetch(
    `${CORE_URL}/leagues/${organization}/events/${id}`
  );
  const events = await eventsData.json();

  const eventIsFinished = new Date(events.date) < new Date();

  const competitions = onlyTitle
    ? [events.competitions[events.competitions.length - 1]]
    : events.competitions;

  const fights = await competitions.reverse().map(async (fight) => {
    const fighter1: Fighter = await getFighter({
      id: fight.competitors[0].id,
    });
    const fighter2: Fighter = await getFighter({
      id: fight.competitors[1].id,
    });

    if (fight.odds) {
      const oddsData = await fetch(fight.odds["$ref"]);
      const odds = await oddsData.json();

      const { homeOdds, awayOdds } = odds.items.reduce(
        (acc: { homeOdds: Odd[]; awayOdds: Odd[] }, item) => {
          acc.homeOdds.push({
            provider: item?.provider.name,
            priority: item?.provider.priority,
            favorite: item?.homeAthleteOdds.favorite,
            value: item?.homeAthleteOdds.moneyLine,
          });
          acc.awayOdds.push({
            provider: item?.provider.name,
            priority: item?.provider.priority,
            favorite: item?.awayAthleteOdds.favorite,
            value: item?.awayAthleteOdds.moneyLine,
          });
          return acc;
        },
        { homeOdds: [], awayOdds: [] }
      );

      if (
        odds.items[0]?.homeAthleteOdds.athlete["$ref"].includes(fighter1.id)
      ) {
        fighter1.odds = homeOdds;
        fighter2.odds = awayOdds;
      } else {
        fighter1.odds = awayOdds;
        fighter2.odds = homeOdds;
      }
    }

    const type =
      fight.types?.length > 0 ? fight.types[0].text : fight.type?.text;

    const data: Fight = {
      id: fight.id,
      type,
      description: fight.description
        ?.replace(/\b\d+-\b/g, "")
        .replace(")", " min)")
        .replace("Rnd", "Round"),
      titleShot: type?.includes("Title") || false,
      weight: fight.weight?.text,
      fighterA: fighter1,
      fighterB: fighter2,
    };

    const hasStats =
      !!fight.competitors[0]?.statistics?.["$ref"] &&
      !!fight.competitors[1]?.statistics?.["$ref"];

    if (eventIsFinished) {
      data.stats = {
        fighterA: {
          winner: fight.competitors[0].winner,
        },
        fighterB: {
          winner: fight.competitors[1].winner,
        },
      };
    }

    if (eventIsFinished && hasStats) {
      const fighter1StatsData = await fetch(
        fight.competitors[0].statistics["$ref"]
      );
      const fighter1Stats = (await fighter1StatsData.json()).splits
        .categories[0].stats;

      const fighter2StatsData = await fetch(
        fight.competitors[1].statistics["$ref"]
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

      data.stats.fighterA = {
        ...data.stats.fighterA,
        ko: getData(fighter1Stats, "knockDowns"),
        strikes: getData(fighter1Stats, "totalStrikesLanded"),
        strikesAttempted: getData(fighter1Stats, "totalStrikesAttempted"),
        significantStrikes: getData(fighter1Stats, "sigStrikesLanded"),
        significantStrikesAttempted: getData(
          fighter1Stats,
          "sigStrikesAttempted"
        ),
        controlTime: getData(fighter1Stats, "timeInControl"),
        takedowns: getData(fighter1Stats, "takedownsLanded"),
        submissions: getData(fighter1Stats, "submissions"),
        bodyStrikes: getPartStrikes(fighter1Stats, "Body"),
        legStrikes: getPartStrikes(fighter1Stats, "Leg"),
        headStrikes: getPartStrikes(fighter1Stats, "Head"),
      };

      data.stats.fighterB = {
        ...data.stats.fighterB,
        ko: getData(fighter2Stats, "knockDowns"),
        strikes: getData(fighter2Stats, "totalStrikesLanded"),
        strikesAttempted: getData(fighter2Stats, "totalStrikesAttempted"),
        significantStrikes: getData(fighter2Stats, "sigStrikesLanded"),
        significantStrikesAttempted: getData(
          fighter2Stats,
          "sigStrikesAttempted"
        ),
        controlTime: getData(fighter2Stats, "timeInControl"),
        takedowns: getData(fighter2Stats, "takedownsLanded"),
        submissions: getData(fighter2Stats, "submissions"),
        bodyStrikes: getPartStrikes(fighter2Stats, "Body"),
        legStrikes: getPartStrikes(fighter2Stats, "Leg"),
        headStrikes: getPartStrikes(fighter2Stats, "Head"),
      };
    }
    return data;
  });

  return await Promise.all(fights);
}
