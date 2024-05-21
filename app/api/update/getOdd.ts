import { Event, Fight, Odd } from "@prisma/client";

import { CORE_URL } from "./constants";

type ExtendedOdd = Omit<Odd, "id">;

export async function getOdd(
  event: Event,
  fight: Fight
): Promise<ExtendedOdd[]> {
  const oddsData = await fetch(
    `${CORE_URL}/leagues/${event.organization}/events/${event.id}/competitions/${fight.id}/odds`
  );
  const odds = await oddsData.json();
  const oddsArray = odds?.items || [];

  const getFighterId = (url: string) => {
    // get only the last part of the url and only numbers
    return url.split("/").pop().replace(/\D/g, "");
  };

  const { awayOdds = [], homeOdds = [] } = oddsArray.reduce(
    (acc: { homeOdds: ExtendedOdd[]; awayOdds: ExtendedOdd[] }, item) => {
      acc.homeOdds.push({
        fighterId: getFighterId(item?.homeAthleteOdds.athlete["$ref"]),
        fightId: fight.id,
        createdAt: new Date(),
        favorite: item?.homeAthleteOdds.favorite,
        priority: item?.provider.priority,
        provider: item?.provider.name,
        updatedAt: new Date(),
        value: item?.homeAthleteOdds.moneyLine || 0,
      });
      acc.awayOdds.push({
        fighterId: getFighterId(item?.awayAthleteOdds.athlete["$ref"]),
        fightId: fight.id,
        createdAt: new Date(),
        favorite: item?.awayAthleteOdds.favorite,
        priority: item?.provider.priority,
        provider: item?.provider.name,
        updatedAt: new Date(),
        value: item?.awayAthleteOdds.moneyLine || 0,
      });
      return acc;
    },
    { awayOdds: [], homeOdds: [] }
  ) || { awayOdds: [], homeOdds: [] };

  return [...homeOdds, ...awayOdds];
}
