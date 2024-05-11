"use client";

import { TOrganization, TSchedule, isOrganization, isSchedule } from "@/types";

import { usePathname, useRouter, useSearchParams } from "next/navigation";
import dynamic from "next/dynamic";
import Header from "./Header";
import Events from "@/components/Events/Events";

const ScrollButton = dynamic(() => import("@/components/ScrollButton"), {
  ssr: false,
});

export default function Home() {
  const searchParams = useSearchParams();
  const pathname = usePathname();
  const { replace } = useRouter();

  const organization = isOrganization(searchParams.get("organization"))
    ? (searchParams.get("organization") as TOrganization)
    : "all";

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
      <ScrollButton />
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
