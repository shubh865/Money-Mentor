"use client";

import React from "react";
import { useRouter } from "next/navigation";
import Navlink from "./Navlink";

const Navbar = () => {
  const router = useRouter();

  return (
    <div className="w-full h-[60px] min-h-[60px] border-b border-[#ececfb] shadow-sm flex flex-row items-center px-[10px]">
      <div className="flex flex-row gap-x-[10px] justify-between w-full items-center">
        <p>some link</p>
        <div className="flex gap-x-[15px] items-center py-[10px] rounded-[10px] px-[10px]">
          <img
            className="h-[40px] border border-[2px] border rounded-full"
            src="/images/deep.jpeg"
          />
          <div>
            <p className="font-bold text-[15px]">Deep Parekh</p>
            <div className="flex px-[1px] items-center gap-x-[5px] text-red-500 items-center">
              <p className="font-light text-[14px]">Logout</p>
              <svg
                xmlns="http://www.w3.org/2000/svg"
                fill="none"
                viewBox="0 0 24 24"
                strokeWidth="1.5"
                stroke="currentColor"
                className="size-[18px]"
              >
                <path
                  strokeLinecap="round"
                  strokeLinejoin="round"
                  d="M15.75 9V5.25A2.25 2.25 0 0 0 13.5 3h-6a2.25 2.25 0 0 0-2.25 2.25v13.5A2.25 2.25 0 0 0 7.5 21h6a2.25 2.25 0 0 0 2.25-2.25V15m3 0 3-3m0 0-3-3m3 3H9"
                />
              </svg>
            </div>
          </div>
        </div>
      </div>

      <div className="flex flex-row gap-x-[20px] ml-auto">
        {/* <Navlink name='Home' link='/' /> */}
      </div>
    </div>
  );
};

export default Navbar;
