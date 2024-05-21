"use client";

import dynamic from "next/dynamic";
import { usePathname, useRouter, useSearchParams } from "next/navigation";

import Events from "@/components/Events/Events";
import { TOrganization, TSchedule, isOrganization, isSchedule } from "@/types";

import Header from "./Header";

export default function Home() {
  const searchParams = useSearchParams();
  const pathname = usePathname();
  const { replace } = useRouter();

  const organization = isOrganization(searchParams.get("organization"))
    ? (searchParams.get("organization") as TOrganization)
    : "ufc";

  const schedule = isSchedule(searchParams.get("schedule"))
    ? (searchParams.get("schedule") as TSchedule)
    : "upcoming";

  const handleOrganizationChange = (value: string) => {
    if (isOrganization(value)) {
      const params = new URLSearchParams(searchParams);
      params.set("organization", value);
      replace(`${pathname}?${params.toString()}`);
    }
  };

  const handleScheduleChange = (value: string) => {
    if (isSchedule(value)) {
      const params = new URLSearchParams(searchParams);
      params.set("schedule", value);
      replace(`${pathname}?${params.toString()}`);
    }
  };

  return (
    <main className="flex flex-col">
      <Header
        organization={organization}
        schedule={schedule}
        handleOrganizationChange={handleOrganizationChange}
        handleScheduleChange={handleScheduleChange}
      />
      <Events organization={organization} schedule={schedule} />
    </main>
  );
}
