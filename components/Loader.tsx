import React from "react";
import Image from "next/image";
import loadingGif from "@/public/loading.gif";

const Loader = () => {
  return (
    <div className="flex-center flex-col gap-2 font-medium w-full">
      <Image
        width={100}
        height={100}
        src={loadingGif}
        alt="loading"
        className="invert"
      />
      <span>Loading ...</span>
    </div>
  );
};

export default Loader;
