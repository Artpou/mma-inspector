"use client";

import { fetchEvent, fetchFights } from "@/app/query";
import CalendarLink from "@/components/CalendarLink";
import Fight from "@/components/Fight/Fight";
import Loader from "@/components/Loader";
import ScrollList from "@/components/ScrollList";
import { Button } from "@/components/ui/button";
import { Tabs, TabsList, TabsTrigger } from "@/components/ui/tabs";
import { flagEmoji } from "@/app/utils/string";
import { ArrowLeft } from "lucide-react";
import dynamic from "next/dynamic";
import Image from "next/image";
import { useRouter, useSearchParams } from "next/navigation";
import React, { useEffect, useRef } from "react";
import { useQuery } from "react-query";

const Darkmode = dynamic(() => import("@/components/Darkmode"), { ssr: false });

const STALE_TIME = 1000 * 60 * 2;

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
    queryKey: ["event", eventId],
    queryFn: async () => fetchEvent(eventId),
    staleTime: STALE_TIME,
    refetchOnWindowFocus: false,
  });

  const { data: fights, isFetching: fightsFetching } = useQuery({
    queryKey: ["fights", eventId],
    queryFn: async () => fetchFights(eventId),
    staleTime: STALE_TIME,
    refetchOnWindowFocus: false,
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
              {fights &&
                fights?.map((fight, key) => (
                  <div key={key} className="relative">
                    {key === +scrollIndex && (
                      <div
                        className="absolute w-2 h-2 top-[-60px]"
                        ref={scrollToRef}
                      />
                    )}
                    <Fight fight={fight} display={display} />
                  </div>
                ))}
            </ScrollList>
          </div>
        ) : (
          <Loader />
        )}
      </div>
    </>
  );
}
