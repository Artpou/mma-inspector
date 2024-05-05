import {
  FighterImage,
  FighterOdds,
  FighterTitle,
  FightersStat,
} from "./Fighter";
import { Fight as FightType, Fighter } from "@/types";
import Image from "next/image";
import BeltPng from "@/public/belt.png";
import { Separator } from "./ui/separator";

interface Props {
  fight: FightType;
}

const stats: (keyof Fighter)[] = ["height", "weight", "age", "reach"];

const Fight = ({ fight }: Props) => {
  console.log("🚀 ~ FightCard ~ event:", fight.fighterA.odds);

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
          <span className="flex justify-center items-center">VS</span>
          <FighterTitle
            fighter={fight.fighterB}
            className="text-center justify-center col-span-2"
          />
        </div>

        <div className="flex flex-col space-y-2 justify-between w-full mb-4">
          {stats.map((key) => (
            <FightersStat
              key={key}
              stat={key}
              fighterA={fight.fighterA}
              fighterB={fight.fighterB}
              classname="w-full justify-between"
            />
          ))}
        </div>

        <div className="grid grid-cols-5 items-center">
          <a
            className="col-span-2 font-medium text-center"
            href={`https://www.espn.com/mma/fighter/_/id/${fight.fighterA.id}`}
          >
            view full profile
          </a>
          <div />
          <a
            className="col-span-2 font-medium text-center"
            href={`https://www.espn.com/mma/fighter/_/id/${fight.fighterB.id}`}
          >
            view full profile
          </a>
        </div>
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
