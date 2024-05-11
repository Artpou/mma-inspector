import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from "@/components/ui/select";
import { Tabs, TabsList, TabsTrigger } from "@/components/ui/tabs";
import { cn } from "@/lib/utils";
import { ORGANIZATIONS } from "@/types";
import dynamic from "next/dynamic";
import React, { useEffect, useState } from "react";
import Darkmode from "@/components/Darkmode";

interface Props {
  organization: string;
  schedule: string;
  handleOrganizationChange: (value: string) => void;
  handleScheduleChange: (value: string) => void;
}

const Header = ({
  organization,
  schedule,
  handleOrganizationChange,
  handleScheduleChange,
}: Props) => {
  const [isTop, setIsTop] = useState(true);

  useEffect(() => {
    if (typeof window === "undefined") return;

    const scrollListener = () => {
      setIsTop(window.scrollY === 0);
    };

    window.addEventListener("scroll", scrollListener);

    return () => {
      window.removeEventListener("scroll", scrollListener);
    };
  }, []);

  return (
    <div
      className={cn(
        "fixed z-30 top-0 p-2 items-center w-full transition-all duration-300",
        isTop ? "" : "bg-card"
      )}
    >
      <div className="flex items-center content-center w-full max-w-7xl mx-auto">
        <Select value={organization} onValueChange={handleOrganizationChange}>
          <SelectTrigger
            name="organization_select"
            className="flex sm:hidden w-full sm:w-48"
          >
            <SelectValue />
          </SelectTrigger>
          <SelectContent>
            {ORGANIZATIONS.map((org) => (
              <SelectItem key={org} value={org}>
                {org.toUpperCase()}
              </SelectItem>
            ))}
          </SelectContent>
        </Select>

        <Tabs value={organization} onValueChange={handleOrganizationChange}>
          <TabsList className="hidden sm:flex">
            {ORGANIZATIONS.map((org) => (
              <TabsTrigger key={org} value={org}>
                {org.toUpperCase()}
              </TabsTrigger>
            ))}
          </TabsList>
        </Tabs>
        <div className="flex w-full ml-2 items-center justify-between">
          <Tabs value={schedule} onValueChange={handleScheduleChange}>
            <TabsList>
              <TabsTrigger value="upcoming">Upcoming</TabsTrigger>
              <TabsTrigger value="past">Past</TabsTrigger>
            </TabsList>
          </Tabs>
          <Darkmode className="mx-2" />
        </div>
      </div>
    </div>
  );
};

export default Header;
