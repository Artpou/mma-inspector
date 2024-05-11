import { TEvent, TFight } from "@/types";

export const fetchFights = async (eventId: string, onlyMain = false) =>
  (
    await fetch(
      `/api/fights?event=${eventId}${onlyMain ? "&onlyMain=true" : ""}`
    )
  ).json() as Promise<TFight[]>;

export const fetchEvent = async (eventId: string): Promise<TEvent> =>
  (await fetch(`/api/events/${eventId}`)).json();
