import type { Metadata } from "next";
import { Inter } from "next/font/google";
import "./globals.css";
import { cn } from "@/lib/utils";
import Image from "next/image";

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
        http-equiv="Content-Security-Policy"
        content="upgrade-insecure-requests"
      />
      <body
        className={cn("font-sans bg-gray-100 text-black", fontSans.variable)}
      >
        {children}
        <footer className="flex flex-col gap-3 mb-2 text-center text-sm text-muted-foreground py-4">
          <div>
            <span className="mr-1">Built by</span>
            <a
              href="https://arthur-poullin.netlify.app/"
              className="text-foreground font-medium"
            >
              Artpou
            </a>
          </div>
          <div>
            <span className="mr-1">Using the API of</span>
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
                className="h-4 inline"
              />
            </a>
          </div>
        </footer>
      </body>
    </html>
  );
}
