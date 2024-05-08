"use client";

import { TEvent, TFight, isOrganization, isSchedule } from "@/types";
import { useState } from "react";
import {
  Accordion,
  AccordionContent,
  AccordionItem,
  AccordionTrigger,
} from "@/components/ui/accordion";
import { Skeleton } from "@/components/ui/skeleton";
import { Badge } from "@/components/ui/badge";
import Image from "next/image";

import Loader from "@/components/Loader";
import { usePathname, useRouter, useSearchParams } from "next/navigation";
import dynamic from "next/dynamic";
import { Button } from "@/components/ui/button";
import { useMutation, useQuery, useQueryClient } from "react-query";
import { getCountryCode, getEmojiFlag } from "countries-list";
import Header from "./Header";
import FightShowcase from "@/components/Fight/FightShowcase";

const Fight = dynamic(() => import("@/components/Fight/Fight"));

const ScrollButton = dynamic(() => import("@/components/ScrollButton"), {
  ssr: false,
});

export default function Home() {
  const searchParams = useSearchParams();
  const pathname = usePathname();
  const { replace } = useRouter();
  const queryClient = useQueryClient();

  const organization = isOrganization(searchParams.get("organization"))
    ? searchParams.get("organization")
    : "all";
  const schedule = isSchedule(searchParams.get("schedule"))
    ? searchParams.get("schedule")
    : "upcoming";

  const [index, setIndex] = useState(0);
  const [events, setEvents] = useState<TEvent[]>([]);
  const [mainFights, setMainFights] = useState<
    {
      organization: string;
      schedule: string;
      fight: TFight;
    }[]
  >([]);

  const mainFight = mainFights.find(
    (mainFight) =>
      mainFight.organization === organization && mainFight.schedule === schedule
  );

  const { isFetching } = useQuery({
    queryKey: ["events", organization, schedule],
    queryFn: async () => {
      const response = await fetch(
        `/api/events?organization=${organization}&schedule=${schedule}&page=${index}`
      );
      const events: TEvent[] = await response.json();

      if (!mainFight) {
        const newMainFightResponse = await fetch(
          `/api/fights?event=${events[0].id}`
        );
        const newMainFight: TFight[] = await newMainFightResponse.json();

        setMainFights((prev) => [
          ...prev,
          { organization, schedule, fight: newMainFight[0] },
        ]);
      }

      setEvents(events);
    },
    staleTime: 1000 * 60 * 2,
    enabled: !!organization && !!schedule,
    refetchOnWindowFocus: false,
  });

  const { mutate: nextPage, isLoading } = useMutation(async () => {
    const response = await fetch(
      `/api/events?organization=${organization}&schedule=${schedule}&page=${
        index + 1
      }`
    );
    const newEvents: TEvent[] = await response.json();

    setEvents((prev) => [...prev, ...newEvents]);
  });

  const { mutate: loadFight } = useMutation({
    mutationFn: async (id: string) => {
      if (events[id].fights) return;

      const response = await fetch(`/api/fights?event=${events?.[id]?.id}`);
      const fights = await response.json();

      setEvents((prev) => {
        const newEvents = [...prev];
        if (newEvents[id]) newEvents[id].fights = fights;
        return newEvents;
      });
    },
  });

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

  const handleOrganizationChange = (value: string) => {
    if (isOrganization(value)) {
      setIndex(0);
      const params = new URLSearchParams(searchParams);
      params.set("organization", value);
      replace(`${pathname}?${params.toString()}`);
    }
  };

  const handleScheduleChange = (value: string) => {
    if (isSchedule(value)) {
      setIndex(0);
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

  const flagEmoji = (country: string) => {
    if (!country) return "";

    const formattedCountry = country
      .replace("USA", "United States")
      .replace("England", "United Kingdom");

    let isoCountry = getCountryCode(formattedCountry);
    return isoCountry !== false ? getEmojiFlag(isoCountry) : "";
  };

  return (
    <main className="flex flex-col">
      <ScrollButton />

      <Header
        organization={organization}
        schedule={schedule}
        handleOrganizationChange={handleOrganizationChange}
        handleScheduleChange={handleScheduleChange}
      />

      {!!events?.[0] && !!mainFight ? (
        <FightShowcase fight={mainFight.fight} event={events[0]} />
      ) : (
        <div className="h-12" />
      )}

      <div className="flex flex-col w-full items-center p-4">
        {isFetching ? (
          Array.from({ length: 10 }).map((_, index) => (
            <Skeleton key={index} className="w-full max-w-7xl h-24 mb-4" />
          ))
        ) : (
          <Accordion
            className="flex flex-col items-center w-full"
            type="single"
            collapsible
            onValueChange={(value) => {
              if (!!value && !events[value].fights) {
                loadFight(value);
              }
            }}
          >
            {!!events &&
              events.map((event, index) => (
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
                        <span className="text-lg text-start mb-1">
                          {event.title}
                        </span>
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
                            {flagEmoji(event.country)} {event.city},{" "}
                            {event.country}
                          </span>
                        </div>
                      </div>
                      <div className="flex flex-col space-y-1 items-center sm:items-end px-4 min-w-28 sm:min-w-fit">
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
                    {event.fights ? (
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
      {!isFetching && events?.length === (index + 1) * 10 && (
        <Button
          size="lg"
          className="flex-center self-center"
          onClick={() => nextPage()}
          loading={isLoading}
        >
          Load more
        </Button>
      )}
    </main>
  );
}
