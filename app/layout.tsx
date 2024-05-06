import type { Metadata } from "next";
import { Inter } from "next/font/google";
import "./globals.css";
import { cn } from "@/lib/utils";
import Image from "next/image";
import ReactQueryProvider from "./provider/ReactQueryProvider";
import { Suspense } from "react";

const fontSans = Inter({
  subsets: ["latin"],
  variable: "--font-sans",
});

export const metadata: Metadata = {
  title: "MMA Inspector",
  description: "Get the latest MMA events and fights",
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="en">
      <meta
        httpEquiv="Content-Security-Policy"
        content="upgrade-insecure-requests"
      />
      <body
        className={cn(
          "font-sans bg-background text-foreground",
          fontSans.variable
        )}
      >
        <Suspense>
          <ReactQueryProvider>{children}</ReactQueryProvider>
        </Suspense>
        <footer className="flex flex-col gap-3 mb-2 text-center text-sm text-muted-foreground py-4">
          <div>
            <span className="mr-1">Built by</span>
            <a
              href="https://github.com/artpou"
              className="text-foreground font-medium"
            >
              Artpou
            </a>
          </div>
          <div className="flex-center">
            <span className="mr-2">Using the API of</span>
            <a
              href="https://www.espn.com/"
              target="_blank"
              className="bg-[#DD0000] p-1 rounded-sm"
            >
              <Image
                width={82}
                height={20}
                src="https://a.espncdn.com/redesign/assets/img/logos/logo-espn-82x20.png"
                alt="ESPN Logo"
                className="inline"
              />
            </a>
          </div>
        </footer>
      </body>
    </html>
  );
}
