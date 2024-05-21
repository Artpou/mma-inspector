import { Event, Fight, Odd } from "@prisma/client";

import { CORE_URL } from "./constants";

export async function getOdd(event: Event, fight: Fight): Promise<Odd[]> {
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
    (acc: { homeOdds: Odd[]; awayOdds: Odd[] }, item) => {
      acc.homeOdds.push({
        fighterId: getFighterId(item?.homeAthleteOdds.athlete["$ref"]),
        fightId: fight.id,
        favorite: item?.homeAthleteOdds.favorite,
        priority: item?.provider.priority,
        provider: item?.provider.name,
        value: item?.homeAthleteOdds.moneyLine || 0,
      });
      acc.awayOdds.push({
        fighterId: getFighterId(item?.awayAthleteOdds.athlete["$ref"]),
        fightId: fight.id,
        favorite: item?.awayAthleteOdds.favorite,
        priority: item?.provider.priority,
        provider: item?.provider.name,
        value: item?.awayAthleteOdds.moneyLine || 0,
      });
      return acc;
    },
    { awayOdds: [], homeOdds: [] }
  ) || { awayOdds: [], homeOdds: [] };

  return [...homeOdds, ...awayOdds];
}
