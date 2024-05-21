import { Fighter } from "@prisma/client";

import { CORE_URL } from "./constants";

export async function getFighter(id: string): Promise<Fighter> {
  const fighterData = await fetch(`${CORE_URL}/athletes/${id}`);
  const fighter = await fighterData.json();
  const recordsData = await fetch(`${CORE_URL}/athletes/${id}/records`);
  const records = await recordsData.json();

  return {
    id: fighter.id,
    age: fighter.age,
    color: {
      primary: fighter?.citizenshipCountry?.color,
      secondary: fighter?.citizenshipCountry?.alternateColor,
    },
    createdAt: new Date(),
    firstName: fighter.firstName,
    flag: fighter.flag?.href,
    height: fighter.height,
    images: {
      left: fighter.images?.[0]?.href,
      profil: `https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/${fighter.id}.png`,
      right: fighter.images?.[1]?.href,
    },
    lastName: fighter.lastName,
    name: fighter.fullName,
    nickname: fighter.nickname,
    reach: fighter.reach,
    record: records.items?.[0]?.summary,
    shortName: fighter.shortName,
    stats: undefined,
    updatedAt: new Date(),
    weight: fighter.weight,
  };
}
