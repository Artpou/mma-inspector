export function secondsToTimeFormat(seconds) {
  const minutes = Math.floor(seconds / 60);
  const remainingSeconds = seconds % 60;
  return `${minutes}:${remainingSeconds < 10 ? "0" : ""}${remainingSeconds}`;
}

export function isOlderThanNDays(date: Date, days: number) {
  return date < new Date(new Date().getTime() - 1000 * 60 * 60 * 24 * days);
}
