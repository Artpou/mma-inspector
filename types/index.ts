import { Event, Fight, Fighter, Odd } from "@prisma/client";

export const ORGANIZATIONS = ["all", "ufc", "bellator", "pfl"] as const;
export type Organization = (typeof ORGANIZATIONS)[number];
export function isOrganization(value: string): value is Organization {
  return ORGANIZATIONS.includes(value as Organization);
}

export const SCHEDULES = ["upcoming", "past"] as const;
export type Schedule = (typeof SCHEDULES)[number];
export function isSchedule(value: string): value is Schedule {
  return SCHEDULES.includes(value as Schedule);
}

// export type Stats = {
//   strikeAccuracy: number;
//   koPercentage: number;
//   takedownAccuracy: number;
//   takedownAvg: number;
//   submissionAvg: number;
// };

export type TFighter = Fighter & {
  odds: Odd[];
  stats: any;
  images: any;
};

export type TFight = Fight & {
  fighterA: TFighter;
  fighterB: TFighter;
  winner: "A" | "B" | null;
  stats?: {
    fighterA: any;
    fighterB: any;
  };
};

export type TEvent = Event & {
  date: string;
  fights?: TFight[];
};
