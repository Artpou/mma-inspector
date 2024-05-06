"use client";

import React, { useEffect } from "react";
import { Switch } from "./ui/switch";
import { Moon, SunDim } from "lucide-react";

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
    <Switch
      checked={dark}
      onClick={() => setDark((prev) => !prev)}
      className={className}
    >
      {dark ? <Moon className="w-5 h-5" /> : <SunDim className="w-5 h-5" />}
    </Switch>
  );
}

export default Darkmode;
