"use client";

import {
  ORGANIZATIONS,
  Organization,
  Schedule,
  isOrganization,
  isSchedule,
} from "@/types";
import { useState } from "react";
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
import { usePathname, useRouter, useSearchParams } from "next/navigation";
import dynamic from "next/dynamic";
import { Button } from "@/components/ui/button";
import {
  useInfiniteQuery,
  useMutation,
  useQuery,
  useQueryClient,
} from "react-query";
import { getFights } from "./query/getFights";
import { getCountryCode } from "countries-list";

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

  const { data, isFetching } = useQuery({
    queryKey: ["events", organization, schedule],
    queryFn: async () => {
      return await getEvents({
        organization,
        schedule,
        index,
      });
    },
    enabled: !!organization && !!schedule,
    refetchOnWindowFocus: false,
  });

  const { mutate: nextPage } = useMutation(
    () => getEvents({ organization, schedule, index: index + 1 }),
    {
      onSuccess: (newData) => {
        queryClient.setQueryData(
          ["events", organization, schedule],
          (oldData: Event[]) => [...(oldData || []), ...newData]
        );
        setIndex((prev) => prev + 1);
      },
    }
  );

  const { mutate: loadFight } = useMutation({
    mutationFn: async (id: string) => {
      return await getFights({
        id: data[id].id,
        organization: data[id].organization,
      });
    },
    onSuccess: (newData, id) => {
      queryClient.setQueryData(
        ["events", organization, schedule],
        (oldData: Event[]) => {
          console.log("setting fights for event", oldData);
          const newEvents = [...oldData];
          newEvents[id].fights = newData;
          return newEvents;
        }
      );
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

  const flagSrc = (country: string) => {
    const formattedCountry = country
      .replace("USA", "United States")
      .replace("England", "United Kingdom");

    let isoCountry = getCountryCode(formattedCountry);
    if (isoCountry !== false) {
      return `https://flagcdn.com/16x12/${isoCountry.toLowerCase()}.png`;
    }
    return;
  };

  return (
    <main className="flex flex-col p-4">
      <ScrollButton />
      <div className="flex space-x-2">
        <Select value={organization} onValueChange={handleOrganizationChange}>
          <SelectTrigger className="mb-2 w-48">
            <SelectValue />
          </SelectTrigger>
          <SelectContent>
            {ORGANIZATIONS.map((org) => (
              <SelectItem key={org} value={org}>
                {org.toUpperCase()}
              </SelectItem>
            ))}
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
        {isFetching ? (
          Array.from({ length: 10 }).map((_, index) => (
            <Skeleton key={index} className="w-full h-24 mb-4" />
          ))
        ) : (
          <Accordion
            className="flex flex-col items-center w-full"
            type="single"
            collapsible
            onValueChange={(value) => {
              if (!!value && !data[value].fights) {
                console.log("loading fights for event", data[value].id);
                loadFight(value);
              }
            }}
          >
            {data.map((event, index) => (
              <AccordionItem
                className="bg-white rounded-lg shadow-md w-full max-w-7xl mb-4"
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
                        {event.country && (
                          <Image
                            width={16}
                            height={12}
                            className="mr-1"
                            alt={event.country}
                            src={flagSrc(event.country)}
                          />
                        )}
                        <span className="truncate font-normal text-sm text-muted-foreground">
                          {event.city}, {event.country}
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
      {!isFetching && data.length === (index + 1) * 10 && (
        <Button
          size="lg"
          className="flex-center self-center"
          onClick={() => nextPage()}
        >
          Load more
        </Button>
      )}
    </main>
  );
}
