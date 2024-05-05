export type Odd = {
  provider: string;
  priority: number;
  favorite: boolean;
  value: number;
};

export type Fighter = {
  id: string;
  name: string;
  shortName: string;
  firstName: string;
  lastName: string;
  record?: string;
  flag?: string;
  weight: string;
  height: string;
  nickname: string;
  age: string;
  reach: string;
  mainStyle?: string;
  odds?: Odd[];
  images?: {
    left: string;
    right: string;
  };
};

export type Fight = {
  type: string;
  weight: string;
  description: string;
  titleShot: boolean;
  fighterA: Fighter;
  fighterB: Fighter;
};

export interface Event {
  id: string;
  title: string;
  description: string;
  date: string;
  logo: string;
  link: string;
  city: string;
  country: string;
  titleCategory: string;
  fightsNumber: number;
  fights?: Fight[];
}
