import { CORE_URL } from "./constants";
import type { Fighter } from "@/types";

export async function getFighter({ id }): Promise<Fighter> {
  const fighterData = await fetch(`${CORE_URL}/athletes/${id}`);
  const fighter = await fighterData.json();
  const recordsData = await fetch(`${CORE_URL}/athletes/${id}/records`);
  const records = await recordsData.json();

  return {
    id: fighter.id,
    name: fighter.fullName,
    shortName: fighter.shortName,
    firstName: fighter.firstName,
    lastName: fighter.lastName,
    nickname: fighter.nickname,
    age: fighter.age,
    record: records.items.length > 0 && records.items[0]?.summary,
    flag: fighter.flag?.href,
    weight: fighter.weight,
    height: fighter.height,
    reach: fighter.reach,
    mainStyle: fighter.style?.length > 0 && fighter.style[0].text,
    images: {
      left: fighter.images?.length > 0 && fighter.images[0].href,
      right: fighter.images?.length > 1 && fighter.images[1].href,
    },
  };
}
