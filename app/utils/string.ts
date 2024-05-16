import { getCountryCode, getEmojiFlag } from "countries-list";

export const flagEmoji = (country: string) => {
  if (!country) return "";

  const formattedCountry = country
    .replace("USA", "United States")
    .replace("England", "United Kingdom");

  let isoCountry = getCountryCode(formattedCountry);
  return isoCountry !== false ? getEmojiFlag(isoCountry) : "";
};
