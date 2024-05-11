import { TEvent, TFight, TOrganization, TSchedule } from "@/types";
import { useState } from "react";
import { Accordion } from "@/components/ui/accordion";

import dynamic from "next/dynamic";
import { useQuery } from "react-query";
import FightShowcase from "../Fight/FightShowcase";
import { Skeleton } from "../ui/skeleton";

const EventItem = dynamic(() => import("./EventItem"), {
  loading: () => <Skeleton className="w-full max-w-7xl h-24 mb-4" />,
});

const STALE_TIME = 1000 * 60 * 2;

type Props = {
  organization: TOrganization;
  schedule: TSchedule;
};

function Events({ organization, schedule }: Props) {
  const [page, setPage] = useState(0);
  const [index, setIndex] = useState<string>();

  const fetchEvents = async (page: number) =>
    (
      await fetch(
        `/api/events?organization=${organization}&schedule=${schedule}&page=${page}`
      )
    ).json() as Promise<TEvent[]>;

  const fetchFights = async (eventId: string, onlyMain = false) =>
    (
      await fetch(
        `/api/fights?event=${eventId}${onlyMain ? "&onlyMain=true" : ""}`
      )
    ).json() as Promise<TFight[]>;

  const { data: events, isFetched } = useQuery({
    queryKey: ["events", organization, schedule],
    queryFn: async () => {
      setIndex("");
      const events = await fetchEvents(page);
      const mainFights = await fetchFights(events?.[0]?.id, true);
      events[0].mainFight = mainFights[0];
      return events;
    },
    staleTime: STALE_TIME,
    enabled: !!organization && !!schedule,
    refetchOnWindowFocus: false,
  });

  const { data: fights, isFetching: isFetchingFights } = useQuery({
    queryKey: ["events", index, organization, schedule],
    queryFn: async () => fetchFights(events?.[index]?.id),
    staleTime: STALE_TIME,
    enabled: !!index,
    refetchOnWindowFocus: false,
  });

  return (
    <>
      <FightShowcase fight={events?.[0]?.mainFight} event={events?.[0]} />
      <div className="flex flex-col w-full items-center p-4">
        <Accordion
          className="flex flex-col items-center w-full"
          type="single"
          collapsible
          value={index}
          onValueChange={setIndex}
        >
          {!!isFetched
            ? events.map((event, index) => (
                <EventItem
                  key={index}
                  index={index}
                  event={event}
                  fights={fights}
                  isFetching={isFetchingFights}
                />
              ))
            : Array.from({ length: 10 }).map((_, index) => (
                <Skeleton key={index} className="w-full max-w-7xl h-24 mb-4" />
              ))}
        </Accordion>
      </div>
    </>
  );
}

export default Events;
