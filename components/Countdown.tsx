import React, { useEffect, useState } from "react";

interface Props {
  date: Date;
}

const Countdown = ({ date }) => {
  const [days, setDays] = useState("");
  const [hours, setHours] = useState("");
  const [minutes, setMinutes] = useState("");
  const [seconds, setSeconds] = useState("");

  const missing0 = (value: number) => {
    return value < 10 ? `0${value}` : String(value);
  };

  useEffect(() => {
    const calculateTimeUntilFight = () => {
      const fightTime = new Date(date);
      const currentTime = new Date();

      const timeDifference = fightTime.valueOf() - currentTime.valueOf();
      // create a new date object to store the time difference
      const time = new Date(timeDifference);

      setDays(String(time.getUTCDate() - 1));
      setHours(missing0(time.getUTCMinutes()));
      setMinutes(missing0(time.getUTCHours()));
      setSeconds(missing0(time.getUTCSeconds()));
    };

    if (new Date(date) < new Date()) {
      return;
    }

    calculateTimeUntilFight();
    const interval = setInterval(calculateTimeUntilFight, 1000);

    return () => {
      clearInterval(interval);
    };
  }, [date]);

  if (new Date(date) < new Date()) {
    return null;
  }

  return (
    <div className="flex items-center z-10 bg-[hsla(0,0%,0%,0.5)] rounded-md px-2 py-1 gap-4 justify-center">
      {parseInt(date) > 0 && (
        <div className="flex-center flex-col">
          <span>{days}</span>
          <span>Days</span>
        </div>
      )}
      <div className="flex-center flex-col">
        <span>{hours}</span>
        <span>Hours</span>
      </div>
      <div className="flex-center flex-col">
        <span>{minutes}</span>
        <span>Minutes</span>
      </div>
      <div className="flex-center flex-col">
        <span>{seconds}</span>
        <span>Seconds</span>
      </div>
    </div>
  );
};

export default Countdown;
