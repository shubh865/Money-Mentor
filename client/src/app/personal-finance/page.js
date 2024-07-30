"use client";
import React from "react";
import { useRouter } from "next/navigation";

const Finance = () => {
  const router = useRouter();
  return (
    <div className="flex flex-col pt-[20px] items-center">
      <img src="/images/highway.jpeg" className="w-[150px] mb-[10px]" />
      <h1 className="text-[28px] tracking-wide font-bold text-gray-700">
        Welcome
      </h1>
      <div className="z-40 bg-white flex flex-col items-center mt-[20px] border border-[#303031] border-[3px] rounded-[3px] p-[2px] px-[15px] w-[100px] ">
        <p className="text-[#30303] text-[24px] font-bold tracking-wide">
          RISK
        </p>
        <div className="flex gap-x-[2px]">
          <div className="lottery1"></div>
          <div className="lottery"></div>
        </div>
      </div>
      <div className="w-full flex flex-col items-center mt-[-55px] z-0">
        <svg
          fill="#303031"
          viewBox="-13.302 0.019 1471.419 58.116"
          xmlns="http://www.w3.org/2000/svg"
        >
          <path d="M -12.952 8.813 C -12.952 8.813 30.385 32.674 90.138 30.537 C 149.891 28.4 154.008 26.656 184.427 18.978 C 214.846 11.3 234.359 10.12 263.811 15.332 C 293.263 20.544 324.811 20.397 369.659 10.651 C 414.507 0.905 523.122 -1.048 597.578 12.38 C 672.034 25.808 678.812 18.704 691.276 14.76 C 703.74 10.816 712.554 -3.463 772.897 15.328 C 833.24 34.119 904.488 24.956 921.913 22.711 C 939.338 20.466 1005.306 16.04 1055.916 24.765 C 1106.526 33.49 1133.61 21.498 1150.357 16.526 C 1167.104 11.554 1188.485 8.175 1234.207 18.069 C 1279.929 27.963 1291.97 18.781 1316.425 12.208 C 1340.88 5.635 1422.466 -8.017 1458.117 6.362 L 1458.117 58.135 L -13.302 57.619 L -12.952 8.813 Z"></path>
        </svg>
        <img className="" src="/images/road.gif" />
        <div className="flex flex-col w-[440px] items-center gap-y-[15px] mt-[-160px]">
          <p className="text-center text-white">
            Determining how fast you’re comfortable traveling on your investment
            journey is the first step in helping your financial professional
            develop an investment strategy that’s right for you.
          </p>
          <button
            className="rounded-full bg-white text-black px-[20px] p-[5px]"
            onClick={() => router.push("personal-finance/goals")}
          >
            Get Started
          </button>
        </div>
      </div>
    </div>
  );
};

export default Finance;
