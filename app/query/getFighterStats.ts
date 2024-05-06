import { CORE_URL } from "./constants";
import type { Stats } from "@/types";

export async function getFighterStats({ id }): Promise<Stats> {
  const statisticsData = await fetch(`${CORE_URL}/athletes/${id}/statistics`);
  const statistics = await statisticsData.json();

  const data = statistics.splits?.categories?.[0]?.stats;

  if (!data) return;

  const getStat = (name: string) => data.find((stat) => stat.name === name);

  return {
    strikeAccuracy: getStat("strikeAccuracy"),
    koPercentage: getStat("koPercentage"),
    takedownAccuracy: getStat("takedownAccuracy"),
    takedownAvg: getStat("takedownAvg"),
    submissionAvg: getStat("submissionAvg"),
  };
}
