import React, { useState, useEffect, useRef } from "react";

import { Trophy } from "lucide-react";

import { cn } from "@/lib/utils";

interface Props {
  children: React.ReactNode;
  label: string[];
  onClick?: (_index: number) => void;
}

const ScrollList = ({ children, label, onClick }: Props) => {
  const [visibleIndexes, setVisibleIndexes] = useState([]);
  const [show, setShow] = useState(false);
  const firstVisibleIndex = visibleIndexes?.[0];
  const listRef = useRef(null);

  useEffect(() => {
    const handleScroll = () => {
      const list = listRef.current;
      const listTop = list.getBoundingClientRect().top;
      setShow(true);

      const newVisibleIndexes = [];

      list.childNodes.forEach((item, index) => {
        const { top } = item.getBoundingClientRect();
        if (top >= 0 && top <= window.innerHeight - listTop) {
          newVisibleIndexes.push(index);
        }
      });

      setVisibleIndexes(newVisibleIndexes);
    };

    window.addEventListener("scroll", handleScroll);
    return () => {
      window.removeEventListener("scroll", handleScroll);
    };
  }, []);

  useEffect(() => {
    if (!show) return;

    setTimeout(() => {
      show && setShow(false);
    }, 2000);
  }, [show]);

  return (
    <>
      <div
        className={cn(
          "fixed opacity-0 sm:hover:opacity-100 flex flex-col z-30 right-1 top-1/2 transform -translate-y-1/2 transition-opacity duration-300",
          "bg-muted rounded-sm",
          show && "opacity-100"
        )}
      >
        {label.map((item, index) => (
          <div
            key={index}
            className={cn(
              "flex-center cursor-pointer bg-muted m-1 text-muted-foreground border w-5 sm:w-12 h-8 sm:h-12",
              firstVisibleIndex === index &&
                "bg-card text-foreground rounded-sm"
            )}
            onClick={() => {
              onClick?.(index);
            }}
          >
            <div className="sm:text-xl">
              {index === 0 ? (
                <Trophy className="w-4 h-4 sm:w-6 sm:h-6" />
              ) : (
                item
              )}
            </div>
          </div>
        ))}
      </div>
      <div className="relative" ref={listRef}>
        {children}
      </div>
    </>
  );
};

export default ScrollList;
