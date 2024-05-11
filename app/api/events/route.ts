import prisma from "@/lib/prisma";
import { NextRequest, NextResponse } from "next/server";

export async function GET(request: NextRequest) {
  const organization =
    request.nextUrl.searchParams.get("organization") || "all";
  const schedule = request.nextUrl.searchParams.get("schedule") || "upcoming";
  const page = request.nextUrl.searchParams.get("page") || 0;

  const events = await prisma.event.findMany({
    where:
      organization === "all"
        ? { isFinished: schedule === "past" }
        : { organization, isFinished: schedule === "past" },
    orderBy: {
      date: schedule === "upcoming" ? "asc" : "desc",
    },
    skip: Number(page) * 20 || 0,
    take: 20,
  });

  return NextResponse.json(events);
}
