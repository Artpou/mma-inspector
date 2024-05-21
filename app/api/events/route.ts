import { NextRequest, NextResponse } from "next/server";

import prisma from "@/lib/prisma";

export async function GET(request: NextRequest) {
  const organization =
    request.nextUrl.searchParams.get("organization") || "all";
  const schedule = request.nextUrl.searchParams.get("schedule") || "upcoming";
  const page = request.nextUrl.searchParams.get("page") || 0;

  const events = await prisma.event.findMany({
    orderBy: {
      date: schedule === "upcoming" ? "asc" : "desc",
    },
    skip: Number(page) * 20 || 0,
    take: 20,
    where:
      organization === "all"
        ? { isFinished: schedule === "past" }
        : { isFinished: schedule === "past", organization },
  });

  return NextResponse.json(events);
}
