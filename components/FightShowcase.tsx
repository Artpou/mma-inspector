import { Fight, Event } from "@/types";
import { useState, useEffect } from "react";
import Image from "next/image";
import { Badge } from "./ui/badge";

type Props = {
  event: Event;
  fight: Fight;
};

const FightShowcase = ({ event, fight }: Props) => {
  const [timeUntilFight, setTimeUntilFight] = useState("");

  const missing0 = (value: number) => {
    return value < 10 ? `0${value}` : value;
  };

  useEffect(() => {
    const calculateTimeUntilFight = () => {
      const fightTime = new Date(event.date);
      const currentTime = new Date();

      if (fightTime < currentTime) {
        setTimeUntilFight("Event finish");
        return;
      }

      const timeDifference = fightTime.valueOf() - currentTime.valueOf();
      // create a new date object to store the time difference
      const time = new Date(timeDifference);

      const days = time.getUTCDate() - 1;
      const hours = missing0(time.getUTCHours());
      const minutes = missing0(time.getUTCMinutes());
      const seconds = missing0(time.getUTCSeconds());

      // display 00:00:00:00 format
      setTimeUntilFight(
        `${days > 0 ? `${days}D ` : ""}${hours}:${minutes}:${seconds}`
      );
    };

    calculateTimeUntilFight();
    const interval = setInterval(calculateTimeUntilFight, 1000);

    return () => {
      clearInterval(interval);
    };
  }, [event.date]);

  return (
    <div
      className="dark bg-card text-foreground relative flex items-center text-center flex-col min-h-[330px]"
      style={{
        background: `linear-gradient(135deg, ${fight.fighterA.color.primary} 0%, rgb(0,0,0) 50%, ${fight.fighterB.color.primary} 100%)`,
      }}
    >
      <Image
        width={56}
        height={56}
        src={`/organization/${event.organization}.png`}
        alt={event.title}
        className="mt-6"
      />
      <h2 className="z-10 text-4xl font-bold uppercase">{event.title}</h2>
      <span className="z-10 font-medium mb-2">
        {event.description ||
          fight.fighterA.shortName + " vs " + fight.fighterB.shortName}
      </span>
      <Badge className="z-10 mb-6">{event.titleCategory}</Badge>
      {!!timeUntilFight && (
        <span className="text-2xl z-10 font-mono font-bold">
          {timeUntilFight}
        </span>
      )}
      <div className="absolute bottom-0 flex w-full justify-around">
        <div className="flex">
          <Image
            src={fight.fighterA.images.profil}
            alt={event.title}
            width={300}
            height={300}
            className="object-cover"
          />
        </div>
        <div className="flex">
          <Image
            src={fight.fighterB.images.profil}
            alt={event.title}
            width={300}
            height={300}
            className="object-cover"
          />
        </div>
      </div>
    </div>
  );
};

export default FightShowcase;
