import { cn } from "@/lib/utils";

import Image from "next/image";
import FighterOdds from "./FighterOdds";
import { Crown } from "lucide-react";
import { TFight, TFighter } from "@/types";
import { Badge } from "../ui/badge";

interface TitleProps {
  fighter: TFighter;
  stats?: TFight["stats"]["fighterA"];
  winner?: boolean;
  className?: string;
}

export const Fighter = ({ fighter, winner, className, stats }: TitleProps) => {
  const recordSplit = !!fighter.record && fighter.record.split("-");

  const openFighter = () =>
    window.open(
      `https://www.espn.com/mma/fighter/_/id/${fighter.id}`,
      "_blank"
    );

  const Flag = ({ className }: { className?: string }) => (
    <Image
      width={20}
      height={16}
      src={fighter.flag}
      alt={fighter.name}
      className={cn("w-auto max-w-6", className)}
    />
  );

  if (stats) {
    return (
      <div className="flex flex-col space-y-2">
        <div className="flex flex-col items-center rounded-full">
          <Badge className="mb-1">head</Badge>
          {stats.headStrikes || 0}
        </div>
        <div className="flex flex-col items-center rounded-full">
          <Badge className="mb-1">body</Badge>
          {stats.bodyStrikes || 0}
        </div>
        <div className="flex flex-col items-center rounded-full">
          <Badge className="mb-1">leg</Badge>
          {stats.legStrikes || 0}
        </div>
      </div>
    );
  }

  return (
    <div className={cn("flex gap-2 px-0 h-full items-center mb-2", className)}>
      <div className="flex flex-col h-full">
        <h2
          className="hidden sm:flex items-center hover:underline cursor-pointer"
          onClick={openFighter}
        >
          {winner === true && <Crown className="w-6 h-6 text-green-700 mr-2" />}
          <span className="block lg:hidden">
            {fighter.shortName || fighter.name}
          </span>
          <span className="hidden lg:block">{fighter.name}</span>
          {fighter.flag && <Flag className="ml-2" />}
        </h2>
        <div
          className="flex-center flex-col sm:hidden hover:underline cursor-pointer"
          onClick={openFighter}
        >
          <div className="relative">
            <Image
              width={80}
              height={80}
              alt={fighter.name}
              src={fighter.images?.profil}
              className={cn(
                "rounded-full w-16 h-16 object-cover border mb-2",
                winner === true
                  ? "border-green-700 border-2"
                  : winner === false && "filter grayscale"
              )}
            />
            {fighter.flag && <Flag className="absolute bottom-0 right-0" />}
          </div>

          <span className="font-medium text-lg leading-tight">
            {fighter.firstName}
          </span>
          <span className="font-medium text-lg leading-tight">
            {fighter.lastName}
          </span>
        </div>
        <span className="hidden sm:block text-muted-foreground">
          {fighter.nickname || "-"}
        </span>
        {!!recordSplit && (
          <span>
            <span className="text-green-700">{recordSplit[0]}</span>
            <span className="text-muted-foreground"> - </span>
            <span className="text-red-700">{recordSplit[1]}</span>
            <span className="text-muted-foreground"> - </span>
            <span>{recordSplit[2]}</span>
          </span>
        )}
        <div className="hidden md:block">
          <FighterOdds fighter={fighter} classname="mt-4" />
        </div>
      </div>
    </div>
  );
};

export default Fighter;
