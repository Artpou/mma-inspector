"use client";

import { fetchEvent, fetchFights } from "@/app/query";
import Fight from "@/components/Fight/Fight";
import Loader from "@/components/Loader";
import { Button } from "@/components/ui/button";
import { Tabs, TabsList, TabsTrigger } from "@/components/ui/tabs";
import { flagEmoji } from "@/components/utils/string";
import { ArrowLeft } from "lucide-react";
import dynamic from "next/dynamic";
import Link from "next/link";
import React from "react";
import { useQuery } from "react-query";

const Darkmode = dynamic(() => import("@/components/Darkmode"), { ssr: false });

const STALE_TIME = 1000 * 60 * 2;

export default function EventPage({ params }) {
  const { eventId } = params;

  const [display, setDisplay] = React.useState<"advanced" | "simple">(
    "advanced"
  );

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

  return (
    <>
      <div className="fixed top-0 flex items-center border space-x-2 z-20 bg-card p-2 w-full">
        <Link href="/">
          <Button size="sm">
            <ArrowLeft className="mr-2" size={16} />
            <span>Back</span>
          </Button>
        </Link>
        <div className="flex-center w-full space-x-4 justify-between">
          <Tabs
            value={display}
            onValueChange={(value) =>
              setDisplay(value as "advanced" | "simple")
            }
          >
            <TabsList>
              <TabsTrigger value="advanced">Advanced</TabsTrigger>
              <TabsTrigger value="simple">Simple</TabsTrigger>
            </TabsList>
          </Tabs>
          <Darkmode />
        </div>
      </div>
      <div className="bg-card mt-[72px] border rounded-lg shadow-lg py-4 mx-4">
        {!fightsFetching || !eventFetching ? (
          <div className="flex flex-col">
            <div className="flex-center flex-col my-4">
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
            {fights &&
              fights?.map((fight, key) => (
                <div key={key} className="">
                  <Fight fight={fight} display={display} />
                </div>
              ))}
          </div>
        ) : (
          <Loader />
        )}
      </div>
    </>
  );
}
