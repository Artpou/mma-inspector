"use client";

import React, { useEffect, useRef } from "react";
import { useQuery } from "react-query";

import dynamic from "next/dynamic";
import Image from "next/image";
import { useRouter, useSearchParams } from "next/navigation";

import { ArrowLeft } from "lucide-react";

import { fetchEvent, fetchFights } from "@/app/query";
import { flagEmoji } from "@/app/utils/string";
import CalendarLink from "@/components/CalendarLink";
import ScrollList from "@/components/ScrollList";
import { Button } from "@/components/ui/button";
import { Skeleton } from "@/components/ui/skeleton";
import { Tabs, TabsList, TabsTrigger } from "@/components/ui/tabs";

const Darkmode = dynamic(() => import("@/components/Darkmode"), { ssr: false });

const STALE_TIME = 1000 * 60 * 2;

const EventLoader = () => (
  <div className="flex flex-col">
    {Array.from({ length: 10 }).map((_, key) => (
      <Skeleton key={key} className="flex m-6 h-[350px] sm:h-[500px]" />
    ))}
  </div>
);

const Fight = dynamic(() => import("@/components/Fight/Fight"), {
  loading: () => <EventLoader />,
});

export default function EventPage({ params }) {
  const router = useRouter();
  const searchParams = useSearchParams();
  const [scrollIndex, setScrollIndex] = React.useState(
    Number(searchParams.get("index") || "-1")
  );

  const { eventId } = params;
  const scrollToRef = useRef(null);

  const [display, setDisplay] = React.useState<"advanced" | "simple">(
    "advanced"
  );

  const switchDisplay = () => {
    const newDisplay = display === "simple" ? "advanced" : "simple";
    localStorage?.setItem("display", newDisplay);
    setDisplay(newDisplay);
  };

  const { data: event, isFetching: eventFetching } = useQuery({
    queryFn: async () => fetchEvent(eventId),
    queryKey: ["event", eventId],
    refetchOnWindowFocus: false,
    staleTime: STALE_TIME,
  });

  const { data: fights, isFetching: fightsFetching } = useQuery({
    queryFn: async () => fetchFights(eventId),
    queryKey: ["fights", eventId],
    refetchOnWindowFocus: false,
    staleTime: STALE_TIME,
  });

  useEffect(() => {
    const timeout = setTimeout(() => {
      console.log("🚀 ~ timeout ~ scrollIndex:", scrollIndex);
      if (!!fights && !!scrollToRef.current && scrollIndex >= 0) {
        scrollToRef.current.scrollIntoView({
          behavior: "smooth",
          block: "start",
        });
      }
    }, 500);

    return () => clearTimeout(timeout);
  }, [scrollIndex, fights]);

  useEffect(() => {
    if (typeof localStorage === "undefined") return;
    setDisplay(
      localStorage?.getItem("display") === "simple" ? "simple" : "advanced"
    );
  }, []);

  return (
    <>
      <div className="fixed top-0 flex items-center border space-x-2 z-20 bg-card p-2 w-full">
        <Button size="sm" onClick={() => router.push("/")}>
          <ArrowLeft className="mr-2" size={16} />
          <span>Back</span>
        </Button>
        <Tabs value={display} onValueChange={switchDisplay}>
          <TabsList>
            <TabsTrigger value="advanced">Advanced</TabsTrigger>
            <TabsTrigger value="simple">Simple</TabsTrigger>
          </TabsList>
        </Tabs>
        <div className="flex-center w-full space-x-2 justify-between">
          {new Date(event?.date) > new Date() ? (
            <CalendarLink event={event} />
          ) : (
            <div />
          )}
          <Darkmode />
        </div>
      </div>
      <div className="bg-card mt-[72px] border rounded-lg shadow-lg py-4 mx-4">
        {!fightsFetching || !eventFetching ? (
          <div className="flex flex-col">
            <div className="flex-center flex-col mt-2 mb-4">
              <Image
                width={56}
                height={56}
                src={`/organization/${event?.organization}.png`}
                alt={event?.title}
                className="mb-2"
              />
              <h2 className="font-bold sm:text-2xl">{event?.title}</h2>
              <span className="text-muted-foreground">
                {new Date(event?.date).toLocaleString()}
              </span>
              {!!event && (!!event.country || !!event.city) && (
                <div className="flex items-center mt-1">
                  <span className="font-normal text-sm text-muted-foreground">
                    {flagEmoji(event.country)} {event.city}, {event.country}
                  </span>
                </div>
              )}
            </div>
            <ScrollList
              label={fights?.map((fight) => String(fight.matchNumber)) || []}
              onClick={setScrollIndex}
            >
              {!!fights ? (
                fights?.map((fight, key) => (
                  <div key={key} className="relative">
                    {key === +scrollIndex && (
                      <div className="absolute top-[-60px]" ref={scrollToRef} />
                    )}
                    <Fight fight={fight} display={display} />
                  </div>
                ))
              ) : (
                <EventLoader />
              )}
            </ScrollList>
          </div>
        ) : (
          <div className="flex flex-col items-center">
            <Skeleton className="mt-2 mb-4 w-80 h-36" />
            <div className="w-full">
              <EventLoader />
            </div>
          </div>
        )}
      </div>
    </>
  );
}
