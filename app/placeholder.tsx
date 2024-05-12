import { Skeleton } from "@/components/ui/skeleton";

type Props = {};

function Placeholder({}: Props) {
  return (
    <div className="flex flex-col items-center justify-center w-screen">
      <div className="bg-black h-[406px] w-full" />
      {Array.from({ length: 10 }).map((_, index) => (
        <Skeleton key={index} className="w-full max-w-7xl h-24 mb-4" />
      ))}
    </div>
  );
}

export default Placeholder;
