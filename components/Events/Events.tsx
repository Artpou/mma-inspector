import { useState } from "react";
import { useMutation, useQuery } from "react-query";

import dynamic from "next/dynamic";

import { fetchFights } from "@/app/query";
import { TEvent, TOrganization, TSchedule } from "@/types";

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
  const [page, _setPage] = useState(0);

  const fetchEvents = async (page: number) =>
    (
      await fetch(
        `/api/events?organization=${organization}&schedule=${schedule}&page=${page}`
      )
    ).json() as Promise<TEvent[]>;

  const { data: events, isFetched } = useQuery({
    enabled: !!organization && !!schedule,
    queryFn: async () => {
      const events = await fetchEvents(page);
      const mainFights = await fetchFights(events?.[0]?.id, true);
      events[0].mainFight = mainFights[0];

      return events;
    },
    queryKey: ["events", organization, schedule, page],
    refetchOnWindowFocus: false,
    staleTime: STALE_TIME,
  });

  const { mutate } = useMutation({
    mutationFn: async () => {
      if (!!events?.[0]?.fights) return;
      events[0].fights = await fetchFights(events?.[0]?.id);
    },
    mutationKey: ["mainFight", organization, schedule],
  });

  const eventsByMonth: { events: TEvent[]; month: string }[] = events?.reduce(
    (acc, event) => {
      const month = new Date(event.date).toLocaleString("en-US", {
        month: "long",
      });
      const monthIndex = acc.findIndex((item) => item.month === month);
      if (monthIndex === -1) {
        acc.push({ events: [event], month });
      } else {
        acc[monthIndex].events.push(event);
      }
      return acc;
    },
    []
  );

  return (
    <>
      <FightShowcase
        fights={events?.[0]?.fights || [events?.[0]?.mainFight]}
        event={events?.[0]}
        loadFights={mutate}
      />
      <div className="flex flex-col w-full px-4 sm:px-12 py-4">
        {isFetched ? (
          eventsByMonth?.map(({ events, month }) => (
            <div key={month}>
              <div className="flex mb-2 items-center">
                <h2 className="uppercase">{month}</h2>
                <span className="ml-2 text-muted-foreground">
                  {events.length} events
                </span>
              </div>

              <div
                className="w-full lg:grid lg:grid-cols-2 2xl:grid-cols-3 gap-4"
                key={month}
              >
                {events.map((event, idx) => (
                  <EventItem
                    key={month + idx}
                    event={event}
                    className="w-full"
                  />
                ))}
              </div>
            </div>
          ))
        ) : (
          <div className="w-full lg:grid lg:grid-cols-2 2xl:grid-cols-3 gap-4">
            {[...Array(12)].map((_, idx) => (
              <Skeleton key={idx} className="w-full max-w-7xl h-32 mb-4" />
            ))}
          </div>
        )}
      </div>
    </>
  );
}

export default Events;
