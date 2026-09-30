import Image from "next/image";
import Link from "next/link";
import pool, {WordRow} from "../lib/db"

export default function Home() {
  return (
    <div className="mx-auto max-w-3xl flex flex-col items-center mt-50">
      <div className="font-bold text-2xl">English Quiz</div>
      <div className="border-2 border-blue-500 px-4 py-2 mt-30 rounded-xl bg-blue-500 shadow-xl text-white">
        <Link href="./quiz">start</Link>
      </div>
    </div>    
  );
}
