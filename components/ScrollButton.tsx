"use client";

import React, { useState } from "react";
import { Button } from "./ui/button";
import { ArrowUp } from "lucide-react";
import { cn } from "@/lib/utils";

const ScrollButton = () => {
  const [visible, setVisible] = useState(false);

  const toggleVisible = () => {
    const scrolled = document.documentElement.scrollTop;
    if (scrolled > 300) {
      setVisible(true);
    } else if (scrolled <= 300) {
      setVisible(false);
    }
  };

  const scrollToTop = () => {
    window.scrollTo({
      top: 0,
      behavior: "smooth",
    });
  };

  window && window.addEventListener("scroll", toggleVisible);

  return (
    <Button
      onClick={scrollToTop}
      className={cn(
        "hidden fixed bottom-0 right-0 z-20 h-12 m-4 rounded-full",
        visible && "block"
      )}
    >
      <ArrowUp className="w-6 h-6" />
    </Button>
  );
};

export default ScrollButton;
