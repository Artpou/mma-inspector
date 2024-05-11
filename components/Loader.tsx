const Loader = () => {
  return (
    <div className="flex-center flex-col gap-2 font-medium w-full">
      <video
        autoPlay
        loop
        muted
        playsInline
        className="w-20 h-20"
        src="/loading.webm"
      />
      <span>Loading ...</span>
    </div>
  );
};

export default Loader;
