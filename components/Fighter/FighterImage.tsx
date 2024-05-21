import Image from "next/image";

import unknownFighterLeft from "@/public/fighter-unknown-left.png";
import unknownFighterRight from "@/public/fighter-unknown-right.png";

import { cn } from "@/lib/utils";
import { TFight, TFighter } from "@/types";

import { Badge } from "../ui/badge";

interface FighterImageProps {
  classname?: string;
  display?: "advanced" | "simple";
  fighter: TFighter;
  height?: number;
  position?: "left" | "right";
  stats?: any;
  width?: number;
}

export const FighterImage = ({
  classname,
  display = "advanced",
  fighter,
  height = 300,
  position = "left",
  stats,
  width = 150,
}: FighterImageProps) => (
  <div
    className={cn(
      "flex justify-center space-x-8",
      position === "left" && "flex-row-reverse",
      display === "simple" && "items-center"
    )}
  >
    <Image
      className={cn(
        "h-fit w-150 max-h-[450px] object-contain",
        position === "left" ? "animate-left-appear" : "animate-right-appear",
        classname
      )}
      src={
        display === "advanced"
          ? position === "left"
            ? fighter.images?.left ||
              fighter.images?.right ||
              unknownFighterLeft
            : fighter.images?.right ||
              fighter.images?.left ||
              unknownFighterRight
          : fighter.images.profil
      }
      width={width}
      height={height}
      alt={fighter.name}
    />
    {!!stats && (
      <div className="hidden xl:flex flex-col h-full items-center font-medium w-16 max-h-[460px] space-y-1">
        <div className="flex flex-col items-center pt-2 h-1/4 rounded-full">
          <Badge className="mb-1">head</Badge>
          {stats.headStrikes}
        </div>
        <div className="flex flex-col items-center h-1/4 rounded-full">
          <Badge className="mb-1">body</Badge>
          {stats.bodyStrikes}
        </div>
        <div className="flex flex-col items-center h-1/4 rounded-full">
          <Badge className="mb-1">leg</Badge>
          {stats.legStrikes}
        </div>
      </div>
    )}
    {/* <div
      className="absolute top-0 w-28 h-28 rounded-full"
      style={{
        background: `radial-gradient(circle, rgba(255,50,28,0.9) 0%, rgba(0,0,0,0) 70%)`,
      }}
    />
    <div
      className="absolute bottom-[60%] w-28 h-28 rounded-full"
      style={{
        background: `radial-gradient(circle, rgba(255,50,28,0.8) 0%, rgba(0,0,0,0) 70%)`,
      }}
    />
    <div
      className="absolute bottom-28 w-28 h-28 rounded-full"
      style={{
        background: `radial-gradient(circle, rgba(255,50,28,0.6) 0%, rgba(0,0,0,0) 70%)`,
      }}
    /> */}
  </div>
);
