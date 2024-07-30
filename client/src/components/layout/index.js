"use client";
import React from "react";
import { useState, useEffect } from "react"; // Import useState and useEffect
import Navbar from "../navbar";
import Sidebar from "../sidebar/navbar";
import { usePathname, useRouter } from "next/navigation";

const Layout = ({ children }) => {
  const router = useRouter(); // Define router using useRouter()
  const pathname = usePathname(); // Define pathname using usePathname()

  return (
    <div className="flex">
      {!pathname || (!pathname.includes("user") && <Sidebar />)}{" "}
      <div className="w-full flex flex-col">
        {!pathname || (!pathname.includes("user") && <Navbar />)}{" "}
        <div className="w-full">{children}</div>
      </div>
    </div>
  );
};

export default Layout;
