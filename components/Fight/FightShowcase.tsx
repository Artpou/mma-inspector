import { useState, useEffect } from "react";
import Image from "next/image";
import { Badge } from "../ui/badge";
import { TEvent, TFight } from "@/types";
import { cn } from "@/lib/utils";
import Countdown from "../Countdown";
import Loader from "../Loader";

type Props = {
  event: TEvent;
  fight: TFight;
};

const FightShowcase = ({ event, fight }: Props) => {
  return (
    <div
      className="dark bg-card text-foreground relative flex-center text-center flex-col min-h-[280px] sm:min-h-[370px] pb-8 pt-16"
      style={{
        background: `linear-gradient(105deg, ${
          fight?.winner === "B"
            ? "#a1a1aa"
            : fight?.fighterA.color.primary || "#000"
        } 20%, rgb(0,0,0) 50%, ${
          fight?.winner === "A"
            ? "#a1a1aa"
            : fight?.fighterB.color.primary || "#000"
        } 80%)`,
      }}
    >
      {fight && event ? (
        <>
          <Image
            width={56}
            height={56}
            src={`/organization/${event.organization}.png`}
            alt={event.title}
            className="hidden sm:block mb-2"
          />
          <h2 className="z-10 text-4xl max-w-[500px] font-bold uppercase">
            {event.title}
          </h2>
          <span className="z-10 font-medium mb-2">
            {event.description ||
              fight.fighterA.shortName + " vs " + fight.fighterB.shortName}
          </span>
          <Badge className="z-10 mb-6">{event.titleCategory}</Badge>
          <Countdown date={event.date} />
          <div className="absolute bottom-0 flex w-full justify-around">
            <div className="flex">
              <Image
                src={fight.fighterA.images.profil}
                alt={event.title}
                width={300}
                height={300}
                className={cn("", {
                  "filter grayscale": fight.winner === "B",
                })}
                priority
              />
            </div>
            <div className="flex">
              <Image
                src={fight.fighterB.images.profil}
                alt={event.title}
                width={300}
                height={300}
                className={cn("", {
                  "filter grayscale": fight.winner === "A",
                })}
                priority
              />
            </div>
          </div>
        </>
      ) : (
        <div className="flex-center w-full h-full">
          <Loader />
        </div>
      )}
    </div>
  );
};

export default FightShowcase;
