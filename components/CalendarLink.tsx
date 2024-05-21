import React from "react";

import Link from "next/link";

import { BellRing } from "lucide-react";

import { TEvent } from "@/types";

import { Button } from "./ui/button";

type Props = {
  event: TEvent;
};

function CalendarLink({ event }: Props) {
  function format(value: string, addedHours = 0) {
    if (!value) return;
    const date = new Date(value);
    date.setHours(date.getHours() + addedHours + 2);

    return date.toISOString().replace(/[-:]/g, "").slice(0, -5);
  }

  return (
    <Link
      href={`https://calendar.google.com/calendar/r/eventedit?dates=${format(
        event.date
      )}/${format(event.date, 3)}&text=${event.title}&details=${
        event.description
      }`}
      target="_blank"
      aria-label="Add to Google Calendar"
    >
      <Button aria-label="calendar_button" size="sm">
        <BellRing size={16} />
      </Button>
    </Link>
  );
}

export default CalendarLink;
