import { SITE_URL } from "./constants";
import type { Event } from "@/types";

export async function getEvents({
  organization = "ufc",
  schedule = "upcoming",
  index = 0,
}): Promise<Event[]> {
  const response = await fetch(`${SITE_URL}/${organization}/scoreboard`);
  const scoreboard = await response.json();

  const calendar = await scoreboard.leagues[0].calendar
    .map((event) => {
      const link = event.event["$ref"].replace(".pvt", ".com");
      return {
        organization: link.split("/")[7],
        date: event.startDate,
        link,
      };
    })
    .filter((event) => event.organization !== "other")
    .filter((event) => {
      if (schedule === "upcoming") return new Date(event.date) > new Date();
      else {
        return new Date(event.date) < new Date();
      }
    })
    .sort((a, b) => {
      if (schedule === "upcoming")
        return new Date(a.date).valueOf() - new Date(b.date).valueOf();
      else return new Date(b.date).valueOf() - new Date(a.date).valueOf();
    })
    .slice(index * 10, index * 10 + 10);

  console.log("cal", index, calendar);

  const events = await calendar.map(async (event) => {
    const detailsResponse = await fetch(event.link);

    // etract organization from the link
    const details = await detailsResponse.json();
    const mainFight = details.competitions[details.competitions.length - 1];

    const extractCountry = (address) => {
      if (!address) return null;
      if (address.country) return address.country;
      if (address.state) return "USA";
      if (address.city === "Paris") return "France";
      if (address.city === "Manchester" || address.city === "London")
        return "United Kingdom";
      if (address.city === "Dublin" || address.city === "Belfast")
        return "Ireland";
    };

    return {
      id: details.id,
      ...event,
      title: details.shortName,
      description:
        details.name.includes("vs") &&
        details.name.replace(details.shortName, "").replace(": ", ""),
      titleCategory: mainFight.type?.text,
      city: mainFight.venue?.address.city,
      country: extractCountry(mainFight.venue?.address),
      fightsNumber: details.competitions.length,
    };
  });

  return await Promise.all(events);
}
