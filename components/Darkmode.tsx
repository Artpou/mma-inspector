"use client";

import React, { useEffect } from "react";
import { Switch } from "./ui/switch";
import { Moon, Sun, SunDim } from "lucide-react";
import { cn } from "@/lib/utils";

interface Props {
  className?: string;
}

function Darkmode({ className }: Props) {
  const [dark, setDark] = React.useState(
    window.sessionStorage.getItem("darkMode") === "true"
  );

  useEffect(() => {
    if (dark) {
      document.documentElement.classList.add("dark");
      window.sessionStorage.setItem("darkMode", "true");
    } else {
      document.documentElement.classList.remove("dark");
      sessionStorage.setItem("darkMode", "false");
    }
  }, [dark]);

  return (
    <div
      className="relative ml-2 h-6 w-12 bg-foreground rounded-full group"
      onClick={() => setDark((prev) => !prev)}
    >
      <Moon className="absolute left-0 top-1/2 transform -translate-y-1/2 w-5 h-5 text-black translate-x-[2px]" />
      <Sun className="absolute left-0 top-1/2 transform -translate-y-1/2 w-5 h-5 text-yellow-400 translate-x-6" />
      <label
        className={cn(
          "bg-card w-5 h-5 my-[2px] ml-[2px] rounded-full absolute left-0 top-0 ball transition-transform duration-200 transform translate-x-0 cursor-pointer",
          dark && "translate-x-6"
        )}
      />
    </div>
  );

  return (
    <Switch
      checked={dark}
      onClick={() => setDark((prev) => !prev)}
      className={cn("!bg-red", className)}
      dotClassName={!dark && "bg-yellow-400"}
    >
      {dark ? <Moon className="w-5 h-5" /> : <SunDim className="w-5 h-5" />}
    </Switch>
  );
}

export default Darkmode;
