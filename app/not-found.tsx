"use client";

import { redirect, usePathname } from "next/navigation";

export default async function NotFound() {
  const pathname = usePathname();
  const isApi = pathname.startsWith("/api");
  if (!isApi) redirect("/");
}
