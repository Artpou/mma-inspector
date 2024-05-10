import { cn } from "@/lib/utils";
import { TFight } from "@/types";

interface FightersStatProps {
  fight: TFight;
  classname?: string;
}

export const FightFightersStats = ({ fight, classname }: FightersStatProps) => {
  const Bar = ({ value1, value2 }) => {
    const total = value1 + value2;
    const percent1 = (value1 / total) * 100;

    return (
      <div
        className={cn(
          "relative w-full h-1 rounded-full bg-slate-300",
          fight.winner === "B" && "bg-green-700",
          total === 0 && "bg-muted"
        )}
      >
        <div
          className={cn(
            "absolute h-full rounded-full bg-slate-300",
            fight.winner === "A" && "bg-green-700"
          )}
          style={{ width: `${percent1}%` }}
        />
      </div>
    );
  };

  const getStat = (stats: typeof fight.stats.fighterA, key: string) => {
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
      {Object.keys(fight.stats.fighterA).map((key) => {
        if (
          key === "winner" ||
          key.includes("Attempted") ||
          key.includes("leg") ||
          key.includes("body") ||
          key.includes("head") ||
          (fight.stats.fighterA[key] === 0 && fight.stats.fighterB[key] === 0)
        )
          return null;

        return (
          <div key={key} className="flex flex-col sm:space-y-1 w-full">
            <div key={key} className="flex justify-between">
              <span className="font-medium mx-2">
                {getStat(fight.stats.fighterA, key)}
              </span>
              <span className="uppercase font-light">{key}</span>
              <span className="font-medium mx-2">
                {getStat(fight.stats.fighterB, key)}
              </span>
            </div>
            <Bar
              value1={fight.stats.fighterA?.[key] || 0}
              value2={fight.stats.fighterB?.[key] || 0}
            />
          </div>
        );
      })}
    </div>
  );
};

export default FightFightersStats;
