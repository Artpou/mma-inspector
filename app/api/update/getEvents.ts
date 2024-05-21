import { Event } from "@prisma/client";

import { isOlderThanNDays } from "@/app/utils/date";

import { SITE_URL } from "./constants";

async function getEvents({ organization = "all" } = {}): Promise<Event[]> {
  const response = await fetch(`${SITE_URL}/${organization}/scoreboard`);
  const scoreboard = await response.json();

  const calendar = await scoreboard.leagues[0].calendar
    .map((event) => {
      const link = event.event["$ref"].replace(".pvt", ".com");
      return {
        date: new Date(event.startDate),
        isFinished: new Date(event.startDate) < new Date(),
        link,
        organization: link.split("/")[7],
      };
    })
    .filter(
      (event) =>
        event.organization !== "other" && !isOlderThanNDays(event.date, 30)
    );

  const events = await calendar.map(async (event) => {
    const detailsResponse = await fetch(event.link);
    delete event.link;

    // etract organization from the link
    const details = await detailsResponse.json();
    const mainFight = details.competitions[details.competitions.length - 1];

    const extractCountry = (address) => {
      if (!address) return null;
      if (address.country) return address.country;
      if (address.state) return "USA";
      if (address.city === "Paris") return "France";
      if (address.city === "Rio De Janeiro") return "Brazil";
      if (address.city === "Manchester" || address.city === "London")
        return "United Kingdom";
      if (address.city === "Dublin" || address.city === "Belfast")
        return "Ireland";
    };

    return {
      id: details.id,
      updatedAt: new Date(mainFight.lastUpdated),
      ...event,
      city: mainFight.venue?.address.city,
      country: extractCountry(mainFight.venue?.address),
      description:
        (details.name.includes("vs") &&
          details.name.replace(details.shortName, "").replace(": ", "")) ||
        "",
      fightsNumber: details.competitions.length,
      title: details.shortName,
      titleCategory: mainFight.type?.text,
    };
  });

  return await Promise.all(events);
}

export default getEvents;
