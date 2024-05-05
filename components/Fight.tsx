import {
  FighterImage,
  FighterOdds,
  FighterTitle,
  FightersStat,
} from "./Fighter";
import { Fight as FightType, Fighter, Stats } from "@/types";
import Image from "next/image";
import BeltPng from "@/public/belt.png";
import { Separator } from "./ui/separator";
import { Button } from "./ui/button";
import { getFighterStats } from "@/app/query/getFighterStats";
import { useState } from "react";
import { merge } from "@/components/utils/array";

interface Props {
  fight: FightType;
}

const stats: (keyof Fighter)[] = ["height", "weight", "age", "reach"];

const Fight = ({ fight: fightProps }: Props) => {
  const [fight, setFight] = useState<FightType>(fightProps);
  const [loading, setLoading] = useState(false);
  const [statsOpen, setStatsOpen] = useState(false);

  const advancedStats = merge(
    Object.keys(fight.fighterA?.stats || {}),
    Object.keys(fight.fighterB?.stats || {})
  );

  const openStats = async () => {
    setLoading(true);
    fight.fighterA.stats = await getFighterStats({ id: fight.fighterA.id });
    fight.fighterB.stats = await getFighterStats({ id: fight.fighterB.id });
    setFight({ ...fight });
    setLoading(false);
    setStatsOpen(true);
  };

  return (
    <div className="flex justify-evenly sm:min-h-[300px]">
      <FighterImage
        fighter={fight.fighterA}
        classname="hidden sm:flex object-contain"
      />

      <div className="flex flex-col w-full max-w-2xl mx-4">
        {fight.titleShot && (
          <Image
            src={BeltPng}
            alt="Belt"
            width={64}
            height={64}
            className="self-center"
          />
        )}
        <div className="flex-center space-x-4 mb-2 w-auto">
          <Separator className="hidden sm:block w-1/3" />
          <div className="flex flex-col items-center">
            <span className="text-center">{fight.type}</span>
            <span className="font-light text-muted-foreground">
              {fight.description}
            </span>
          </div>
          <Separator className="hidden sm:block w-1/3" />
        </div>
        <div className="grid grid-cols-5 items-baseline sm:items-center gap-4 mb-2">
          <FighterTitle
            fighter={fight.fighterA}
            className="text-center justify-center col-span-2"
          />
          <span className="flex-center">VS</span>
          <FighterTitle
            fighter={fight.fighterB}
            className="text-center justify-center col-span-2"
          />
        </div>

        <div className="flex flex-col space-y-2 w-full px-4 mb-4">
          {stats.map((key) => (
            <FightersStat
              key={key}
              stat={key}
              fighterA={fight.fighterA}
              fighterB={fight.fighterB}
              classname="w-full justify-between"
            />
          ))}
          {advancedStats.map((key) => (
            <FightersStat
              key={key}
              stat={key}
              isAdvanced
              fighterA={fight.fighterA}
              fighterB={fight.fighterB}
              classname="w-full justify-between"
            />
          ))}
        </div>
        {!statsOpen && (
          <Button
            size="sm"
            className="w-fit self-center"
            onClick={openStats}
            loading={loading}
          >
            Load advanced stats
          </Button>
        )}
      </div>

      <FighterImage
        fighter={fight.fighterB}
        position="right"
        classname="hidden sm:flex"
      />
    </div>
  );
};

export default Fight;
