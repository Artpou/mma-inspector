import { Event, Fight, Fighter, Odd } from "@prisma/client";

export const ORGANIZATIONS = ["all", "ufc", "bellator", "pfl"] as const;
export type TOrganization = (typeof ORGANIZATIONS)[number];
export function isOrganization(value: string): value is TOrganization {
  return ORGANIZATIONS.includes(value as TOrganization);
}

export const SCHEDULES = ["upcoming", "past"] as const;
export type TSchedule = (typeof SCHEDULES)[number];
export function isSchedule(value: string): value is TSchedule {
  return SCHEDULES.includes(value as TSchedule);
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
  color: {
    primary: string;
    secondary: string;
  };
};

export type TFight = Fight & {
  fighterA: TFighter;
  fighterB: TFighter;
  winner: "A" | "B" | null;
  stats?: {
    fighterA: any;
    fighterB: any;
  };
  status?: {
    name: string;
    shortName: string;
    clock: number;
    round: number;
    target?: string;
  };
};

export type TEvent = Event & {
  date: string;
  fights?: TFight[];
  mainFight?: TFight;
};
