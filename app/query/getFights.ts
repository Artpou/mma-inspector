import { Fight, Fighter, Odd } from "@/types";
import { CORE_URL } from "./constants";
import { getFighter } from "./getFighter";

export async function getFights({
  id,
  organization = "ufc",
}): Promise<Fight[]> {
  const eventsData = await fetch(
    `${CORE_URL}/leagues/${organization}/events/${id}`
  );
  const events = await eventsData.json();

  const fights = await events.competitions
    .map(async (fight) => {
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

      return {
        id: fight.id,
        type,
        description: fight.description
          ?.replace(/\b\d+-\b/g, "")
          .replace(")", " min)")
          .replace("Rnd", "Round"),
        titleShot: type?.includes("Title") || false,
        fighterA: fighter1,
        fighterB: fighter2,
      };
    })
    .reverse();

  return await Promise.all(fights);
}
