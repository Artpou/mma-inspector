import { NextRequest, NextResponse } from "next/server";

import { Event } from "@prisma/client";

import prisma from "@/lib/prisma";

export async function GET(
  _req: NextRequest,
  { params }
): Promise<NextResponse<Event>> {
  const eventId = params?.id;

  if (!eventId) {
    throw new Error("Event not found");
  }

  const event = await prisma.event.findUnique({
    where: { id: eventId },
  });

  return NextResponse.json(event);
}
