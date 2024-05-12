import { useState, useEffect } from "react";
import Image from "next/image";
import { Badge } from "../ui/badge";
import { TEvent, TFight } from "@/types";
import { cn } from "@/lib/utils";
import Countdown from "../Countdown";
import Loader from "../Loader";
import texture from "@/public/texture.png";
import { useSearchParams } from "next/navigation";
import Link from "next/link";
import { BellRing, ChevronLeft, ChevronRight } from "lucide-react";
import unknownProfile from "@/public/fighter-unkown-profil.png";
import { Button } from "../ui/button";

type Props = {
  event: TEvent;
  fights: TFight[];
  loadFights: () => void;
};

const FightShowcase = ({ event, fights, loadFights }: Props) => {
  const searchParams = useSearchParams();
  const isPastEvent = searchParams.get("schedule") === "past";

  const [index, setIndex] = useState(0);
  const [errorIndexsA, setErrorIndexsA] = useState([]);
  const [errorIndexsB, setErrorIndexsB] = useState([]);

  const fight = fights[index];
  const havePrevious = index > 0;
  const haveNext = index === 0 || index < fights.length - 1;

  useEffect(() => {
    setIndex(0);
  }, [event]);

  function format(value: string, addedHours = 0) {
    if (!value) return;
    const date = new Date(value);
    date.setHours(date.getHours() + addedHours + 2);

    return date.toISOString().replace(/[-:]/g, "").slice(0, -5);
  }

  return (
    <>
      <div
        className="dark bg-card text-foreground relative flex-center text-center flex-col min-h-[280px] sm:min-h-[370px] pb-8 pt-6"
        style={{ backgroundImage: `url(${texture.src})` }}
      >
        <div
          className="absolute top-0 left-0 w-full h-full bg-black opacity-25"
          style={{
            background: `linear-gradient(105deg, ${
              fight?.winner === "B"
                ? "#a1a1aa"
                : fight?.fighterA.color.primary || "rgba(0, 0, 0, 0)"
            } 0%, rgba(0, 0, 0, 0) 50%, ${
              fight?.winner === "A"
                ? "#a1a1aa"
                : fight?.fighterB.color.primary || "rgba(0, 0, 0, 0)"
            } 100%)`,
          }}
        />
        {fight && event ? (
          <>
            <Image
              width={56}
              height={56}
              src={`/organization/${event.organization}.png`}
              alt={event.title}
              className="hidden sm:block w-20 h-20 mb-2 brightness-0 invert"
            />
            <span className="z-10 uppercase">{event.title}</span>
            <h2 className="z-10 text-2xl sm:text-4xl font-bold uppercase mb-2">
              {fight.fighterA.lastName + " vs. " + fight.fighterB.lastName}
            </h2>
            <Badge className="z-10 bg-foreground text-card">{fight.type}</Badge>
            {!!fight.fighterA.odds?.[0]?.value &&
            !!fight.fighterB.odds?.[0]?.value ? (
              <span className="text-xs mt-1">
                {fight.fighterA.odds?.[0]?.value}
                {" / "}
                {fight.fighterB.odds?.[0]?.value}
              </span>
            ) : (
              <div className="h-5" />
            )}
            <div className=" mb-10" />
            <div className="hidden sm:block">
              <Countdown date={event.date} className="font-medium" />
            </div>

            <div className="z-10 flex-center justify-between absolute h-full w-full left-0">
              <ChevronLeft
                className={cn(
                  "w-12 mt-6 mx-2 cursor-pointer h-full",
                  havePrevious ? "hover:scale-125" : "opacity-0 cursor-default"
                )}
                onClick={(e) => {
                  loadFights();
                  havePrevious && setIndex((prev) => prev - 1);
                }}
              />
              <Link
                href={`/events/${event?.id}?index=${index}`}
                scroll={false}
                className=" w-full h-full"
              />
              <ChevronRight
                className={cn(
                  "w-12 mt-6 mx-2 cursor-pointer h-full",
                  haveNext ? "hover:scale-125" : "opacity-0 cursor-default"
                )}
                onClick={(e) => {
                  loadFights();
                  haveNext && setIndex((prev) => prev + 1);
                }}
              />
            </div>

            <div className="absolute bottom-0 flex w-full justify-around">
              <div className="flex">
                <Image
                  src={
                    errorIndexsA.includes(index)
                      ? unknownProfile.src
                      : fight.fighterA.images.profil
                  }
                  alt={event.title}
                  width={300}
                  height={300}
                  className={cn("", {
                    "filter grayscale": fight.winner === "B",
                  })}
                  onError={() => {
                    setErrorIndexsA((prev) => [...prev, index]);
                  }}
                  priority
                />
              </div>
              <div className="flex">
                <Image
                  src={
                    errorIndexsB.includes(index)
                      ? unknownProfile.src
                      : fight.fighterB.images.profil
                  }
                  alt={event.title}
                  width={300}
                  height={300}
                  className={cn("", {
                    "filter grayscale": fight.winner === "A",
                  })}
                  onError={() => {
                    setErrorIndexsB((prev) => [...prev, index]);
                  }}
                  priority
                />
              </div>
            </div>
          </>
        ) : (
          <div className="flex-center mt-7 sm:mt-0 w-full h-full">
            <Loader />
          </div>
        )}
      </div>
      {fight && event ? (
        <div className="sm:hidden">
          <Countdown
            date={event.date}
            className="text-white bg-black rounded-none"
          >
            <Link
              href={`https://calendar.google.com/calendar/r/eventedit?dates=${format(
                event.date
              )}/${format(event.date, 3)}&text=${event.title}&details=${
                event.description
              }`}
              target="_blank"
            >
              <Button size="sm">
                <BellRing size={16} />
              </Button>
            </Link>
          </Countdown>
        </div>
      ) : (
        <div
          className={cn(
            "dark sm:hidden w-full bg-card h-14",
            isPastEvent && "hidden"
          )}
          style={{ backgroundImage: `url(${texture.src})` }}
        />
      )}
    </>
  );
};

export default FightShowcase;
