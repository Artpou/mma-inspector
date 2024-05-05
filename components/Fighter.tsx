import { Fighter } from "@/types";
import { CardDescription, CardHeader, CardTitle } from "./ui/card";
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
    className={classname}
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
  stat: keyof Fighter;
  classname?: string;
}

export const FightersStat = ({
  fighterA,
  fighterB,
  stat,
  classname,
}: FightersStatProps) => {
  const label = (value) => {
    if (!value) return "-";
    if (stat === "weight") return poundToKg(Number(value)) + " kg";
    if (stat === "height") return inchesToCm(Number(value)) + " cm";
    if (stat === "reach") return inchesToCm(Number(value)) + " cm";
    return value;
  };

  const subLabel = (value) => {
    if (!value) return "-";
    if (stat === "weight") return value + " lbs";
    if (stat === "height") return inchesToFeet(Number(value));
    if (stat === "reach") return value + '"';
    return;
  };

  const FighterStat = (fighter) => (
    <div className="flex flex-col">
      <span>{label(fighter[stat])}</span>
      <span className="font-light text-muted-foreground">
        {subLabel(fighter[stat])}
      </span>
    </div>
  );

  return (
    <div className={cn("grid grid-cols-3 items-center", classname)}>
      <span>{FighterStat(fighterA)}</span>
      <div className="flex flex-col uppercase text-center font-light">
        <span>{stat}</span>
        <span className="text-muted-foreground text-xs">
          {typeof fighterA[stat] === "number" && fighterA[stat] > fighterB[stat]
            ? ">"
            : "<"}
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

  return (
    <div className={cn("flex gap-2 px-0 items-center mb-2", className)}>
      <div className={cn("flex flex-col")}>
        <h2 className="hidden sm:flex items-center">
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
        <div className="flex-center flex-col sm:hidden">
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
