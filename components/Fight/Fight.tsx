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
import { secondsToTimeFormat } from "../utils/date";
import { Switch } from "../ui/switch";

interface Props {
  fight: TFight;
}

const stats: (keyof TFighter)[] = ["height", "weight", "age", "reach"];

const Fight = ({ fight }: Props) => {
  const [statsMode, setStatsMode] = useState<"fighter" | "fight">();
  const [showFighterStats, setShowFighterStats] = useState(false);

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

        {hasWinner && fight.status && (
          <div className="flex-center flex-col my-2 justify-center sm:mb-4">
            <div className="flex items-center space-x-2">
              <span className="font-medium sm:hidden">{fight.status.name}</span>
              <h2 className="hidden sm:block">{fight.status.name}</h2>
              {fight.status.target && (
                <>
                  <span className="sm:hidden font-medium">
                    {" "}
                    -{" "}
                    {fight.status.target.charAt(0).toUpperCase() +
                      fight.status.target.slice(1)}
                  </span>
                  <h2 className="hidden sm:block">
                    {" "}
                    -{" "}
                    {fight.status.target.charAt(0).toUpperCase() +
                      fight.status.target.slice(1)}
                  </h2>
                </>
              )}
            </div>
            {!fight.status.name.includes("Decision") && (
              <div className="flex font-light text-muted-foreground space-x-2">
                <span>{fight.status.round} round</span>
                <span> - </span>
                <span>{secondsToTimeFormat(fight.status.clock)}</span>
              </div>
            )}
          </div>
        )}

        <div className="flex w-full justify-around sm:items-center gap-4 mb-2">
          <Fighter
            fighter={fight.fighterA}
            stats={showFighterStats && fight.stats?.fighterA}
            winner={fight.winner && fight.winner === "A"}
            className="text-center justify-center w-1/3 sm:w-2/5"
          />
          <span className="hidden sm:flex-center">VS</span>
          <div className="flex flex-col sm:hidden text-center justify-evenly text-sm">
            {hasWinner && (
              <div className="flex">
                {fight.winner === "A" && (
                  <ArrowLeft className="w-6 h-6 text-green-700 mx-auto" />
                )}
                <Crown className="w-6 h-6 text-green-700 mx-auto" />
                {fight.winner === "B" && (
                  <ArrowRight className="w-6 h-6 text-green-700 mx-auto" />
                )}
              </div>
            )}
            <div className="flex-center flex-col space-y-1">
              <span className="">body hits</span>
              <Switch
                checked={showFighterStats}
                onCheckedChange={setShowFighterStats}
              />
            </div>
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
          </div>
          <Fighter
            fighter={fight.fighterB}
            stats={showFighterStats && fight.stats?.fighterB}
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
