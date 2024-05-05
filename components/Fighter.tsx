import { Fighter } from "@/types";
import { cn } from "@/lib/utils";
import { inchesToCm, inchesToFeet, poundToKg } from "./utils/metrics";

import Image from "next/image";

import unknownFighterLeft from "@/public/fighter-unknown-left.png";
import unknownFighterRight from "@/public/fighter-unknown-right.png";

interface FighterOddsProps {
  fighter: Fighter;
  classname?: string;
}

export const FighterOdds = ({ fighter, classname }: FighterOddsProps) => {
  const odds = fighter.odds;

  if (!odds) return null;

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

interface FighterImageProps {
  fighter: Fighter;
  classname?: string;
  position?: "left" | "right";
  width?: number;
  height?: number;
}

export const FighterImage = ({
  fighter,
  classname,
  position = "left",
  width = 150,
  height = 300,
}: FighterImageProps) => (
  <Image
    className={cn("max-h-[450px]", classname)}
    src={
      position === "left"
        ? fighter.images?.left || fighter.images?.right || unknownFighterLeft
        : fighter.images?.right || fighter.images?.left || unknownFighterRight
    }
    width={width}
    height={height}
    alt={fighter.name}
  />
);

interface FightersStatProps {
  fighterA: Fighter;
  fighterB: Fighter;
  stat: string;
  isAdvanced?: boolean;
  classname?: string;
}

export const FightersStat = ({
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

    if (stat === "submissionAvg") console.log("mm", value);

    return (
      <div className="flex flex-col">
        <span>{label(value)}</span>
        <span className="font-light text-muted-foreground">
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

  return (
    <div className={cn("grid grid-cols-3 items-center", classname)}>
      <span>{FighterStat(fighterA)}</span>
      <div className="flex flex-col uppercase text-center font-light">
        <span className="hidden sm:block">{statLabel(stat)}</span>
        <span className="block sm:hidden">{statShortLabel(stat)}</span>
        <span className="text-muted-foreground text-xs">
          {statsCompare(fighterA, fighterB)}
        </span>
      </div>
      <span className="text-right">{FighterStat(fighterB)}</span>
    </div>
  );
};

interface TitleProps {
  fighter: Fighter;
  children?: JSX.Element;
  className?: string;
}

export const FighterTitle = ({ fighter, children, className }: TitleProps) => {
  const recordSplit = !!fighter.record && fighter.record.split("-");

  const openFighter = () =>
    window.open(
      `https://www.espn.com/mma/fighter/_/id/${fighter.id}`,
      "_blank"
    );

  return (
    <div className={cn("flex gap-2 px-0 h-full items-center mb-2", className)}>
      <div className="flex flex-col h-full">
        <h2
          className="hidden sm:flex items-center hover:underline cursor-pointer"
          onClick={openFighter}
        >
          <span className="block lg:hidden">
            {fighter.shortName || fighter.name}
          </span>
          <span className="hidden lg:block">{fighter.name}</span>
          {fighter.flag && (
            <Image
              width={20}
              height={16}
              src={fighter.flag}
              alt={fighter.name}
              className="ml-2"
            />
          )}
        </h2>
        <div
          className="flex-center flex-col sm:hidden hover:underline cursor-pointer"
          onClick={openFighter}
        >
          <FighterImage
            fighter={fighter}
            height={200}
            width={125}
            classname="sm:hidden h-20 w-20 border border-muted rounded-full object-none object-top"
          />
          <h2>{fighter.firstName}</h2>
          <h2>{fighter.lastName}</h2>
        </div>
        <span className="text-muted-foreground">{fighter.nickname || "-"}</span>
        {!!recordSplit && (
          <span>
            <span className="text-green-700">{recordSplit[0]}</span>
            <span className="text-muted-foreground"> - </span>
            <span className="text-red-700">{recordSplit[1]}</span>
            <span className="text-muted-foreground"> - </span>
            <span>{recordSplit[2]}</span>
          </span>
        )}
        <FighterOdds fighter={fighter} classname="mt-4" />
      </div>
    </div>
  );
};
