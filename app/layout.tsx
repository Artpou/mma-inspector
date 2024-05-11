import type { Metadata } from "next";
import { Inter } from "next/font/google";
import "./globals.css";
import { cn } from "@/lib/utils";
import Image from "next/image";
import ReactQueryProvider from "./provider/ReactQueryProvider";
import { Suspense } from "react";
import { SpeedInsights } from "@vercel/speed-insights/next";
import Placeholder from "./placeholder";

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
        <Suspense fallback={<Placeholder />}>
          <ReactQueryProvider>
            {children}
            <SpeedInsights />
          </ReactQueryProvider>
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
          </footer>
        </Suspense>
      </body>
    </html>
  );
}
