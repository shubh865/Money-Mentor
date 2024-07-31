"use client";
import React from "react";
import { useRouter } from "next/navigation";

const Tools = () => {
  const router = useRouter();

  return (
    <div className="p-[20px] text-[#44475b] flex flex-col items-center gap-y-[30px]">
      <h1 className="text-[28px] w-full font-semibold tracking-wide">
        Calculators
      </h1>
      <div className="flex justify-around min-w-[850px]">
        <div
          className="cursor-pointer border hover:border-gray-300 flex flex-col w-[240px] h-[240px] rounded-[10px] items-end justify-between relative"
          onClick={() => router.push("tools/sip")}
        >
          <div className="opacity-100 flex flex-col gap-y-[20px] p-[24px] w-full">
            <h1 className="text-[20px] font-semibold">SIP</h1>
            <p className="text-[13px]">
              Calculate how much you need to save or how much you will
              accumulate with your SIP
            </p>
          </div>
          <div className="absolute flex justify-end items-end top-0 p-[2px] w-full h-full opacity-40 hover:opacity-100">
            <img className="h-[80px]" src="/images/sip.png" />
          </div>
        </div>
        <div
          className="cursor-pointer border hover:border-gray-300 flex flex-col w-[240px] h-[240px] rounded-[10px] items-end justify-between relative"
          onClick={() => router.push("tools/emi")}
        >
          <div className="opacity-100 flex flex-col gap-y-[20px] p-[24px] w-full">
            <h1 className="text-[20px] font-semibold">EMI</h1>
            <p className="text-[13px]">
              Calculate EMI on your loans – home loan, car loan or personal loan
            </p>
          </div>
          <div className="absolute flex justify-end items-end top-0 p-[2px] w-full h-full opacity-40 hover:opacity-100">
            <img className="h-[80px]" src="/images/emi.png" />
          </div>
        </div>
        <div
          className="cursor-pointer border hover:border-gray-300 flex flex-col w-[240px] h-[240px] rounded-[10px] items-end justify-between relative"
          onClick={() => router.push("tools/ppf")}
        >
          <div className="opacity-100 flex flex-col gap-y-[20px] p-[24px] w-full">
            <h1 className="text-[20px] font-semibold">PPF</h1>
            <p className="text-[13px]">
              Calculate your returns on Public Provident Fund (PPF){" "}
            </p>
          </div>
          <div className="absolute flex justify-end items-end top-0 p-[2px] w-full h-full opacity-40 hover:opacity-100">
            <img className="h-[80px]" src="/images/ppf.png" />
          </div>
        </div>
      </div>
    </div>
  );
};

export default Tools;
