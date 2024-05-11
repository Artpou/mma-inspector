import {
  AccordionContent,
  AccordionItem,
  AccordionTrigger,
} from "@/components/ui/accordion";
import { Badge } from "@/components/ui/badge";
import Image from "next/image";

import Loader from "@/components/Loader";
import { TEvent, TFight } from "@/types";
import { getCountryCode, getEmojiFlag } from "countries-list";
import dynamic from "next/dynamic";

const Fight = dynamic(() => import("@/components/Fight/Fight"));

type Props = {
  event: TEvent;
  fights: TFight[];
  index: number;
  isFetching: boolean;
};

function EventItem({ index, event, fights, isFetching }: Props) {
  const formattedDate = (value: string) => {
    const date = new Date(value);
    return `${date.toLocaleDateString()} ${date
      .toLocaleTimeString()
      .slice(0, -3)}`;
  };

  const inHowManyDays = (date: string) => {
    const today = new Date();
    const eventDate = new Date(date);

    const diffTime = eventDate.getTime() - today.getTime();
    const diffDays = Math.floor(diffTime / (1000 * 60 * 60 * 24));
    if (diffDays === 0) return "Today";
    if (diffDays === 1) return "Tomorrow";
    if (diffDays < 0) return "Past";
    return diffDays + " days";
  };

  const dateColor = (day: string) => {
    if (day === "Today" || day === "Tomorrow") return "bg-destructive";
    if (day === "Past") return "bg-muted-foreground";
    return;
  };

  const flagEmoji = (country: string) => {
    if (!country) return "";

    const formattedCountry = country
      .replace("USA", "United States")
      .replace("England", "United Kingdom");

    let isoCountry = getCountryCode(formattedCountry);
    return isoCountry !== false ? getEmojiFlag(isoCountry) : "";
  };

  return (
    <AccordionItem
      className="bg-card rounded-lg shadow-md w-full max-w-7xl mb-4"
      key={index}
      value={"" + index}
    >
      <AccordionTrigger className="px-4">
        <Image
          width={56}
          height={56}
          src={`/organization/${event.organization}.png`}
          alt={event.title}
          className="hidden sm:block mr-4 rounded-sm"
        />
        <div className="flex justify-between items-center w-full min-h-24 py-2">
          <div className="flex flex-col items-start">
            <span className="text-lg text-start mb-1">{event.title}</span>
            {!!event.description && (
              <div className="flex items-center">
                <span className="flex sm:font-normal text-sm">
                  {event.description}
                </span>
                {!!event.titleCategory && (
                  <Badge className="ml-2 hidden sm:block">
                    {event.titleCategory}
                  </Badge>
                )}
              </div>
            )}
            <span className="block sm:hidden mt-0 text-xs font-normal">
              {event.titleCategory}
            </span>
            <div className="flex items-center mt-1">
              <span className="truncate font-normal text-sm text-muted-foreground">
                {flagEmoji(event.country)} {event.city}, {event.country}
              </span>
            </div>
          </div>
          <div className="flex flex-col space-y-1 items-center sm:items-end px-4 min-w-28 sm:min-w-fit">
            <Badge className={dateColor(inHowManyDays(event.date))}>
              {inHowManyDays(event.date)}
            </Badge>
            <span className="hidden sm:block">{formattedDate(event.date)}</span>
            <span className="font-normal text-sm">
              {event.fightsNumber} fight
              {event.fightsNumber > 1 && "s"}
            </span>
          </div>
        </div>
      </AccordionTrigger>
      <AccordionContent className="sm:px-4">
        {fights &&
          fights.map((fight, key) => (
            <div key={key} className="py-6 px-2">
              <Fight fight={fight} />
            </div>
          ))}
        {isFetching && <Loader />}
      </AccordionContent>
    </AccordionItem>
  );
}

export default EventItem;
