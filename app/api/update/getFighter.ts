import { Fighter } from "@prisma/client";

import { CORE_URL } from "./constants";

export async function getFighter(id: string): Promise<Fighter> {
  const fighterData = await fetch(`${CORE_URL}/athletes/${id}`);
  const fighter = await fighterData.json();
  const recordsData = await fetch(`${CORE_URL}/athletes/${id}/records`);
  const records = await recordsData.json();

  return {
    id: fighter.id,
    createdAt: new Date(),
    updatedAt: new Date(),
    name: fighter.fullName,
    shortName: fighter.shortName,
    firstName: fighter.firstName,
    lastName: fighter.lastName,
    nickname: fighter.nickname,
    age: fighter.age,
    record: records.items?.[0]?.summary,
    flag: fighter.flag?.href,
    weight: fighter.weight,
    height: fighter.height,
    reach: fighter.reach,
    color: {
      primary: fighter?.citizenshipCountry?.color,
      secondary: fighter?.citizenshipCountry?.alternateColor,
    },
    stats: undefined,
    images: {
      left: fighter.images?.[0]?.href,
      right: fighter.images?.[1]?.href,
      profil: `https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/${fighter.id}.png`,
    },
  };
}
