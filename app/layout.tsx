import { Suspense } from "react";

import type { Metadata } from "next";
import dynamic from "next/dynamic";

import { Analytics } from "@vercel/analytics/react";
import { SpeedInsights } from "@vercel/speed-insights/next";
import { Github, Linkedin } from "lucide-react";
import { Inter } from "next/font/google";

import { cn } from "@/lib/utils";

import "./globals.css";
import Placeholder from "./placeholder";
import ReactQueryProvider from "./provider/ReactQueryProvider";

const ScrollButton = dynamic(() => import("@/components/ScrollButton"), {
  ssr: false,
});

const fontSans = Inter({
  subsets: ["latin"],
  variable: "--font-sans",
});

export const metadata: Metadata = {
  description: "Get the latest MMA events and fights",
  title: "MMA Inspector",
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
        <link rel="icon" href="/logo.png" sizes="any" />
        <Suspense fallback={<Placeholder />}>
          <ReactQueryProvider>
            <ScrollButton />
            {children}
            <SpeedInsights />
            <Analytics />
          </ReactQueryProvider>
          <footer className="flex flex-col gap-3 mb-2 text-center text-sm text-muted-foreground py-4">
            <div>
              <span className="mr-1">Built by</span>
              <a
                href="https://arthur-poullin.netlify.app/"
                aria-label="Website"
                className="text-foreground font-medium"
              >
                Arthur Poullin
              </a>
            </div>
            <div className="flex-center gap-2">
              <a
                href="https://github.com/artpou/mma-inspector"
                aria-label="GitHub"
                className="flex-center rounded-full w-10 h-10 bg-black hover:bg-gray-800 text-white"
              >
                <Github />
              </a>
              <a
                href="https://linkedin.com/in/artpou"
                aria-label="LinkedIn"
                className="flex-center rounded-full w-10 h-10 bg-black hover:bg-gray-800 text-white"
              >
                <Linkedin />
              </a>
            </div>
          </footer>
        </Suspense>
      </body>
    </html>
  );
}
