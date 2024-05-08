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

  const { homeOdds = [], awayOdds = [] } = oddsArray.reduce(
    (acc: { homeOdds: ExtendedOdd[]; awayOdds: ExtendedOdd[] }, item) => {
      acc.homeOdds.push({
        provider: item?.provider.name,
        priority: item?.provider.priority,
        favorite: item?.homeAthleteOdds.favorite,
        value: item?.homeAthleteOdds.moneyLine || 0,
        fighterId: getFighterId(item?.homeAthleteOdds.athlete["$ref"]),
        fightId: fight.id,
        createdAt: new Date(),
        updatedAt: new Date(),
      });
      acc.awayOdds.push({
        provider: item?.provider.name,
        priority: item?.provider.priority,
        favorite: item?.awayAthleteOdds.favorite,
        value: item?.awayAthleteOdds.moneyLine || 0,
        fighterId: getFighterId(item?.awayAthleteOdds.athlete["$ref"]),
        fightId: fight.id,
        createdAt: new Date(),
        updatedAt: new Date(),
      });
      return acc;
    },
    { homeOdds: [], awayOdds: [] }
  ) || { homeOdds: [], awayOdds: [] };

  return [...homeOdds, ...awayOdds];
}
