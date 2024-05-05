"use client";

import {
  Organization,
  Schedule,
  isOrganization,
  isSchedule,
  type Event,
} from "@/types";
import { useEffect, useState } from "react";
import {
  Accordion,
  AccordionContent,
  AccordionItem,
  AccordionTrigger,
} from "@/components/ui/accordion";
import {
  Select,
  SelectTrigger,
  SelectContent,
  SelectItem,
  SelectValue,
} from "@/components/ui/select";
import { Skeleton } from "@/components/ui/skeleton";
import { Badge } from "@/components/ui/badge";
import { getEvents } from "@/app/query/getEvents";
import Fight from "@/components/Fight";
import Image from "next/image";

import Loader from "@/components/Loader";
import { getFights } from "./query/getFights";
import { usePathname, useRouter, useSearchParams } from "next/navigation";

export default function Home() {
  const searchParams = useSearchParams();
  const pathname = usePathname();
  const { replace } = useRouter();

  const organizationParam = searchParams.get("organization");
  const scheduleParam = searchParams.get("schedule");

  const [events, setEvents] = useState<Event[]>([]);
  const [organization, setOrganization] = useState<Organization>(
    isOrganization(organizationParam) ? organizationParam : "ufc"
  );
  const [schedule, setSchedule] = useState<Schedule>(
    isSchedule(scheduleParam) ? scheduleParam : "upcoming"
  );
  const [loading, setLoading] = useState(false);

  const formattedDate = (value: string) => {
    const date = new Date(value);
    return `${date.toLocaleDateString()} ${date
      .toLocaleTimeString()
      .slice(0, -3)}`;
  };

  useEffect(() => {
    const fetchData = async () => {
      setLoading(true);
      const data = await getEvents({ organization, schedule });
      setEvents(data);
      setLoading(false);
    };

    if (organization && schedule) fetchData();
  }, [organization, schedule]);

  const handleOpenEvent = async (index) => {
    if (!index) return;

    const newEvents = [...events];
    if (!!newEvents[index].fights) return;

    newEvents[index].fights = await getFights({
      id: newEvents[index].id,
      organization,
    });

    setEvents(newEvents);
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

  const handleOrganizationChange = (value: string) => {
    if (isOrganization(value)) {
      setOrganization(value);
      const params = new URLSearchParams(searchParams);
      params.set("organization", value);
      replace(`${pathname}?${params.toString()}`);
    }
  };

  const handleScheduleChange = (value: string) => {
    if (isSchedule(value)) {
      setSchedule(value);
      const params = new URLSearchParams(searchParams);
      params.set("schedule", value);
      replace(`${pathname}?${params.toString()}`);
    }
  };

  const dateColor = (day: string) => {
    if (day === "Today" || day === "Tomorrow") return "bg-destructive";
    if (day === "Past") return "bg-muted-foreground";
    return;
  };

  const flagSrc = (country: string) => {
    let formattedCountry = country ? country.slice(0, 2).toLowerCase() : "";
    if (country === "England") formattedCountry = "gb";
    if (country === "United Arab Emirates") formattedCountry = "ae";
    if (country === "Ireland") formattedCountry = "ie";
    if (country === "Mexico") formattedCountry = "mx";
    return `https://flagcdn.com/16x12/${formattedCountry}.png`;
  };

  return (
    <main className="p-4">
      <div className="flex space-x-2">
        <Select value={organization} onValueChange={handleOrganizationChange}>
          <SelectTrigger className="mb-2 w-48">
            <SelectValue />
          </SelectTrigger>
          <SelectContent>
            <SelectItem value="ufc">UFC</SelectItem>
            <SelectItem value="pfl">PFL</SelectItem>
            <SelectItem value="bellator">Bellator</SelectItem>
          </SelectContent>
        </Select>
        <Select value={schedule} onValueChange={handleScheduleChange}>
          <SelectTrigger className="mb-2 w-48">
            <SelectValue defaultValue="upcoming" />
          </SelectTrigger>
          <SelectContent>
            <SelectItem value="upcoming">Upcoming</SelectItem>
            <SelectItem value="past">Past</SelectItem>
          </SelectContent>
        </Select>
      </div>

      <div className="flex flex-col w-full items-center">
        {loading ? (
          Array.from({ length: 10 }).map((_, index) => (
            <Skeleton key={index} className="w-full h-24 mb-4" />
          ))
        ) : (
          <Accordion
            className="flex flex-col items-center w-full"
            type="single"
            collapsible
            onValueChange={handleOpenEvent}
          >
            {events.map((event, index) => (
              <AccordionItem
                className="bg-white rounded-lg shadow-md w-full max-w-7xl mb-4"
                key={index}
                value={"" + index}
              >
                <AccordionTrigger className="px-4">
                  <Image
                    width={56}
                    height={56}
                    src={event.logo}
                    alt={event.title}
                    className="mr-4 hidden sm:block"
                  />
                  <div className="flex justify-between items-center w-full min-h-24 py-2">
                    <div className="flex flex-col items-start">
                      <span className="text-lg mb-1">{event.title}</span>
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
                        <Image
                          width={16}
                          height={12}
                          className="mr-1"
                          alt={event.country}
                          src={flagSrc(event.country)}
                        />
                        <span className="truncate font-normal text-sm text-muted-foreground">
                          {event.city}, {event.country}
                        </span>
                      </div>
                    </div>
                    <div className="flex flex-col space-y-1 items-center sm:items-end px-4">
                      <Badge className={dateColor(inHowManyDays(event.date))}>
                        {inHowManyDays(event.date)}
                      </Badge>
                      <span className="hidden sm:block">
                        {formattedDate(event.date)}
                      </span>
                      <span className="font-normal text-sm">
                        {event.fightsNumber} fight
                        {event.fightsNumber > 1 && "s"}
                      </span>
                    </div>
                  </div>
                </AccordionTrigger>
                <AccordionContent className="sm:px-4">
                  {!!event.fights ? (
                    event.fights.map((fight, index) => (
                      <div key={index} className="py-6 px-2">
                        <Fight fight={fight} />
                      </div>
                    ))
                  ) : (
                    <Loader />
                  )}
                </AccordionContent>
              </AccordionItem>
            ))}
          </Accordion>
        )}
      </div>
    </main>
  );
}
