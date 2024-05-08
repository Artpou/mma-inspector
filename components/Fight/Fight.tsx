import Image from "next/image";
import BeltPng from "@/public/belt.png";
import { Separator } from "../ui/separator";
import { Button } from "../ui/button";
import { useEffect, useState } from "react";
import { merge } from "@/components/utils/array";
import FightFightersStats from "./FightFightersStats";
import { FighterImage } from "../Fighter/FighterImage";
import Fighter from "../Fighter/Fighter";
import { cn } from "@/lib/utils";
import { Tabs, TabsTrigger } from "../ui/tabs";
import { TabsList } from "@radix-ui/react-tabs";
import FightStats from "./FightStats";
import { ArrowLeft, ArrowRight, Crown } from "lucide-react";
import { TFight, TFighter } from "@/types";

interface Props {
  fight: TFight;
}

const stats: (keyof TFighter)[] = ["height", "weight", "age", "reach"];

const Fight = ({ fight }: Props) => {
  const [statsMode, setStatsMode] = useState<"fighter" | "fight">();

  const fighterAOdds = fight.fighterA.odds?.[0]?.value;
  const fighterBOdds = fight.fighterB.odds?.[0]?.value;

  const haveStats = !!fight.stats;
  const hasWinner = !!fight.winner;

  const advancedStats = merge(
    Object.keys(fight.fighterA?.stats || {}),
    Object.keys(fight.fighterB?.stats || {})
  );

  useEffect(() => {
    if (!statsMode) setStatsMode(haveStats ? "fight" : "fighter");
  }, [fight, statsMode, haveStats]);

  return (
    <div className="flex justify-evenly sm:min-h-[300px]">
      <FighterImage
        fighter={fight.fighterA}
        classname={cn(
          "hidden sm:flex",
          fight.winner === "B" && "filter grayscale"
        )}
        stats={fight.stats?.fighterB}
      />

      <div className="flex flex-col w-full max-w-2xl mx-4">
        {fight.titleShot && (
          <Image
            src={BeltPng}
            alt="Belt"
            width={48}
            height={48}
            className="self-center"
          />
        )}
        <div className="flex-center space-x-4 mb-2 w-auto">
          <Separator
            className={cn(
              "w-1/4",
              fight.winner === "A" && "bg-green-700 h-[2px]"
            )}
          />
          <div className="flex flex-col items-center">
            <span className="text-center sm:min-w-40">{fight.type}</span>
            <span className="font-light text-muted-foreground">
              {fight.description}
            </span>
          </div>
          <Separator
            className={cn(
              "w-1/4",
              fight.winner === "B" && "bg-green-700 h-[2px]"
            )}
          />
        </div>
        <div className="flex w-full justify-around sm:items-center gap-4 mb-2">
          <Fighter
            fighter={fight.fighterA}
            winner={fight.winner && fight.winner === "A"}
            className="text-center justify-center w-1/3 sm:w-2/5"
          />
          <span className="hidden sm:flex-center">VS</span>
          <div className="flex flex-col sm:hidden text-center justify-center text-sm">
            <div>
              <span
                className={fighterAOdds < 0 ? "text-green-700" : "text-red-700"}
              >
                {fighterAOdds}
              </span>
              <span>{!!fighterAOdds && !!fighterBOdds ? " / " : "VS"}</span>
              <span
                className={fighterBOdds < 0 ? "text-green-700" : "text-red-700"}
              >
                {fighterBOdds}
              </span>
            </div>
            {hasWinner && (
              <div className="flex">
                {fight.winner === "A" && (
                  <ArrowLeft className="w-6 h-6 mt-4 text-green-700 mx-auto" />
                )}
                <Crown className="w-6 h-6 mt-4 text-green-700 mx-auto" />
                {fight.winner === "B" && (
                  <ArrowRight className="w-6 h-6 mt-4 text-green-700 mx-auto" />
                )}
              </div>
            )}
          </div>
          <Fighter
            fighter={fight.fighterB}
            winner={fight.winner && fight.winner === "B"}
            className="text-center justify-center w-1/3 sm:w-2/5"
          />
        </div>

        {!!fight?.stats && haveStats && (
          <div className="flex w-full justify-center">
            <Tabs
              value={statsMode || "fighter"}
              onValueChange={(value) =>
                setStatsMode(value as "fight" | "fighter")
              }
            >
              <TabsList className="mb-2 p-1 rounded-md bg-background">
                <TabsTrigger value="fight">fight</TabsTrigger>
                <TabsTrigger value="fighter">fighter</TabsTrigger>
              </TabsList>
            </Tabs>
          </div>
        )}

        {statsMode === "fight" ? (
          <FightStats fight={fight} />
        ) : (
          <div className="flex flex-col space-y-2 w-full md:px-10 px-4 mb-4">
            {stats.map((key) => (
              <FightFightersStats
                key={key}
                stat={key}
                fighterA={fight.fighterA}
                fighterB={fight.fighterB}
                classname="w-full justify-between"
              />
            ))}
            {advancedStats.map((key) => (
              <FightFightersStats
                key={key}
                stat={key}
                isAdvanced
                fighterA={fight.fighterA}
                fighterB={fight.fighterB}
                classname="w-full justify-between"
              />
            ))}
          </div>
        )}
      </div>

      <FighterImage
        fighter={fight.fighterB}
        position="right"
        classname={cn(
          "hidden sm:flex",
          fight.winner === "A" && "filter grayscale"
        )}
        stats={fight.stats?.fighterA}
      />
    </div>
  );
};

export default Fight;
