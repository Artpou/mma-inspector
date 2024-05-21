import React, { useEffect, useState } from "react";

import dynamic from "next/dynamic";
import Image from "next/image";

import { Ellipsis } from "lucide-react";

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

const Darkmode = dynamic(() => import("@/components/Darkmode"), { ssr: false });

interface Props {
  handleOrganizationChange: (value: string) => void;
  handleScheduleChange: (value: string) => void;
  organization: string;
  schedule: string;
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
        "fixed z-30 top-0 p-2 items-center w-full transition-colors duration-300",
        isTop ? "" : "bg-card border"
      )}
    >
      <div className="flex items-center content-center w-full max-w-7xl mx-auto">
        <Image
          src="/logo.png"
          alt="logo"
          width={38}
          height={38}
          className="hidden sm:block rounded-sm mr-2"
        />
        <Select value={organization} onValueChange={handleOrganizationChange}>
          <SelectTrigger
            name="organization_select"
            className="flex sm:hidden w-full sm:w-48"
          >
            <div className="flex-center">
              {organization !== "all" ? (
                <Image
                  width={24}
                  height={24}
                  src={`/organization/${organization}.png`}
                  alt="select-organization"
                  className="mr-2 rounded-sm"
                />
              ) : (
                <Ellipsis className="h-6 w-6 mr-2" />
              )}
              <SelectValue />
            </div>
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
