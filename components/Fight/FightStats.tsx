import { FightStats, Fighter } from "@/types";
import { cn } from "@/lib/utils";
import { inchesToCm, inchesToFeet, poundToKg } from "../utils/metrics";

import { TooltipWrapper } from "../ui/tooltip";
import { CircleHelp } from "lucide-react";

interface FightersStatProps {
  statsA: Partial<FightStats>;
  statsB: Partial<FightStats>;
  classname?: string;
}

export const FightFightersStats = ({
  statsA,
  statsB,
  classname,
}: FightersStatProps) => {
  const defaultStats = statsB;

  const Bar = ({ value1, value2 }) => {
    const total = value1 + value2;
    const percent1 = (value1 / total) * 100;

    return (
      <div
        className={cn(
          "relative w-full h-1 rounded-full bg-muted-foreground",
          statsB?.winner && "bg-green-700",
          total === 0 && "bg-muted"
        )}
      >
        <div
          className={cn(
            "absolute h-full rounded-full bg-muted-foreground",
            statsA?.winner && "bg-green-700"
          )}
          style={{ width: `${percent1}%` }}
        />
      </div>
    );
  };

  const getStat = (stats: typeof defaultStats, key: string) => {
    if (key === "strikes")
      return `${stats?.[key]} (${(
        (stats.strikes / stats.strikesAttempted) *
        100
      ).toFixed(0)}%)`;
    if (key === "significantStrikes")
      return `${stats?.[key]} (${(
        (stats.significantStrikes / stats.significantStrikesAttempted) *
        100
      ).toFixed(0)}%)`;
    if (key === "controlTime") return stats?.[key] + " s";
    return String(stats?.[key] || 0);
  };

  return (
    <div className={cn("flex flex-col space-y-3 md:mx-10 mb-4", classname)}>
      {Object.keys(defaultStats).map((key) => {
        if (
          key === "winner" ||
          key.includes("Attempted") ||
          key.includes("leg") ||
          key.includes("body") ||
          key.includes("head")
        )
          return null;

        return (
          <div key={key} className="flex flex-col sm:space-y-1 w-full">
            <div key={key} className="flex justify-between">
              <span className="font-medium mx-2">{getStat(statsA, key)}</span>
              <span className="uppercase font-light">{key}</span>
              <span className="font-medium mx-2">{getStat(statsB, key)}</span>
            </div>
            <Bar value1={statsA?.[key] || 0} value2={statsB?.[key] || 0} />
          </div>
        );
      })}
    </div>
  );
};

export default FightFightersStats;
