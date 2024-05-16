import { Badge } from "@/components/ui/badge";
import Image from "next/image";

import { TEvent } from "@/types";
import { getCountryCode, getEmojiFlag } from "countries-list";
import dynamic from "next/dynamic";
import { ChevronRight } from "lucide-react";
import { cn } from "@/lib/utils";
import Link from "next/link";
import { flagEmoji } from "../../app/utils/string";

type Props = {
  event: TEvent;
  className?: string;
};

function EventItem({ event, className }: Props) {
  const formattedDate = (value: string) => {
    return new Date(value).toLocaleDateString("en-US", {
      month: "long",
      day: "numeric",
    });
  };

  const formattedHours = (value: string) => {
    return new Date(value).toLocaleTimeString("en-US", {
      hour: "numeric",
      minute: "numeric",
    });
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

  return (
    <Link
      href={`/events/${event.id}`}
      className={cn(
        "flex w-full border-b bg-card rounded-lg shadow-md mb-4 p-2 pl-4 cursor-pointer",
        className
      )}
      scroll={false}
    >
      <Image
        width={56}
        height={56}
        src={`/organization/${event.organization}.png`}
        alt={event.title}
        className="hidden sm:block mr-4 rounded-sm object-contain"
      />
      <div className="flex justify-between items-center w-full min-h-24 py-2">
        <div className="flex flex-col w-3/5 items-start">
          <span className="text-lg font-medium text-start">{event.title}</span>
          {!!event.description && (
            <span className="sm:font-normal text-sm">{event.description}</span>
          )}
          <span className="mt-1 text-xs font-normal">
            {event.titleCategory}
          </span>
          {(!!event.country || !!event.city) && (
            <div className="flex items-center mt-1">
              <span className="font-normal text-sm text-muted-foreground">
                {flagEmoji(event.country)} {event.city}, {event.country}
              </span>
            </div>
          )}
        </div>

        <div className="flex-center w-2/5 sm:w-fit justify-end sm:px-4 min-w-28 sm:min-w-fit">
          <div className="flex-center flex-col space-y-1 mr-4">
            <Badge className={dateColor(inHowManyDays(event.date))}>
              {inHowManyDays(event.date)}
            </Badge>
            <span className="font-medium text-sm">
              {formattedDate(event.date)}
            </span>
            <span className="mt-1 text-xs sm:font-normal">
              {formattedHours(event.date)}
            </span>
          </div>
          <ChevronRight className="w-4 h-4 sm:block mr-2" />
        </div>
      </div>
    </Link>
  );
}

export default EventItem;
