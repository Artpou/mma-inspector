import { CircleHelp } from "lucide-react";

import { cn } from "@/lib/utils";
import { TFighter } from "@/types";

import { inchesToCm, inchesToFeet, poundToKg } from "../../app/utils/metrics";
import { TooltipWrapper } from "../ui/tooltip";

interface FightersStatProps {
  classname?: string;
  fighterA: TFighter;
  fighterB: TFighter;
  isAdvanced?: boolean;
  stat: string;
}

export const FightFightersStats = ({
  fighterA,
  fighterB,
  stat,
  classname,
  isAdvanced = false,
}: FightersStatProps) => {
  const label = (value) => {
    if (value !== 0 && !value) return "-";
    if (stat === "weight") return poundToKg(Number(value)) + " kg";
    if (stat === "height") return inchesToCm(Number(value)) + " cm";
    if (stat === "reach") return inchesToCm(Number(value)) + " cm";
    if (
      stat === "strikeAccuracy" ||
      stat === "takedownAccuracy" ||
      stat === "koPercentage"
    )
      return value + "%";
    return value;
  };

  const subLabel = (value) => {
    if (!value && !isAdvanced) return "-";
    if (stat === "weight") return value + " lbs";
    if (stat === "height") return inchesToFeet(Number(value));
    if (stat === "reach") return value + '"';
    return;
  };

  const FighterStat = (fighter) => {
    const value = isAdvanced ? fighter.stats?.[stat]?.value : fighter[stat];

    return (
      <div className="flex flex-col">
        <span>{label(value)}</span>
        <span className="hidden sm:block font-light text-muted-foreground">
          {subLabel(value)}
        </span>
      </div>
    );
  };

  const statsCompare = (fighterA, fighterB) => {
    const statA = isAdvanced ? fighterA.stats?.[stat] : fighterA[stat];
    const statB = isAdvanced ? fighterB.stats?.[stat] : fighterB[stat];

    if (statA === statB) return "=";
    return fighterA[stat] < fighterB[stat] ? "<" : ">";
  };

  const statLabel = (stat) => {
    if (!isAdvanced) return stat;

    switch (stat) {
      case "strikeAccuracy":
        return "Striking Accuracy";
      case "koPercentage":
        return "KO Percentage";
      case "takedownAccuracy":
        return "Takedown Accuracy";
      case "takedownAvg":
        return "Takedown Avg";
      case "submissionAvg":
        return "Submission Avg";
      default:
        return stat;
    }
  };

  const statShortLabel = (stat) => {
    if (!isAdvanced) return stat;

    switch (stat) {
      case "strikeAccuracy":
        return "Strike Acc.";
      case "koPercentage":
        return "KO %";
      case "takedownAccuracy":
        return "TD Acc.";
      case "takedownAvg":
        return "TD Avg.";
      case "submissionAvg":
        return "Sub Avg.";
      default:
        return stat;
    }
  };

  const statDescription = (stat) => {
    switch (stat) {
      case "strikeAccuracy":
        return "Percentage of hits compared to total strikes thrown";
      case "koPercentage":
        return "Percentage of wins by KO compared to total wins";
      case "takedownAccuracy":
        return "Percentage of successful takedowns compared to total takedown attempts";
      case "takedownAvg":
        return "Average takedowns per 15 minutes";
      case "submissionAvg":
        return "Average submissions per 15 minutes";
      default:
        return stat;
    }
  };

  return (
    <div className={cn("flex items-center", classname)}>
      <span>{FighterStat(fighterA)}</span>
      <div className="flex flex-col uppercase text-center font-light">
        <div className="flex-center">
          <span className="hidden sm:block">{statLabel(stat)}</span>
          <span className="block sm:hidden">{statShortLabel(stat)}</span>
          {isAdvanced && (
            <TooltipWrapper
              label={statDescription(stat)}
              className="hidden sm:block"
            >
              <CircleHelp className="w-4 h-4 ml-1 text-muted-foreground" />
            </TooltipWrapper>
          )}
        </div>
        <span className="hidden sm:block text-muted-foreground text-xs">
          {statsCompare(fighterA, fighterB)}
        </span>
      </div>
      <span className="text-right">{FighterStat(fighterB)}</span>
    </div>
  );
};

export default FightFightersStats;
