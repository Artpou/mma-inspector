import { cn } from "@/lib/utils";
import { TFighter } from "@/types";

interface FighterOddsProps {
  classname?: string;
  fighter: TFighter;
}

const FighterOdds = ({ fighter, classname }: FighterOddsProps) => {
  const odds = fighter.odds;

  if (!odds || !odds.length) return null;

  const getBarValue = (value: number) => {
    return ((1 - (value + 1000) / 2000) * 100).toFixed(0);
  };

  return (
    <div className={cn("flex flex-col space-y-2 items-center", classname)}>
      <div
        className="w-20 h-2 rounded"
        style={{
          background:
            "linear-gradient(to right, #15803d " +
            getBarValue(odds[0].value) +
            "%, #b91c1c " +
            getBarValue(odds[0].value) +
            "%)",
        }}
      ></div>
      <span className="">
        <span
          className={cn(
            "font-medium",
            odds[0].favorite ? "text-green-700" : "text-red-700"
          )}
        >
          {odds[0].value}
        </span>{" "}
        {odds[0].favorite ? "Favorite" : "Underdog"}
      </span>
    </div>
  );
};

export default FighterOdds;
