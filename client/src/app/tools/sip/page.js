"use client";
import React, { useState, useEffect } from "react";
import { ProgressBar } from "@/components/AddExpenses/progress";
import { Pie } from "@/components/AddExpenses/pie";

const SIP = () => {
  const [monthlySip, setMonthlySip] = useState(25000);
  const [expectedReturns, setExpectedReturns] = useState(12);
  const [years, setYears] = useState(10);

  const [investedAmount, setInvestedAmount] = useState(0);
  const [estimatedReturns, setEstimatedReturns] = useState(0);
  const [totalValue, setTotalValue] = useState(0);

  useEffect(() => {
    const months = years * 12;
    const r = expectedReturns / 100 / 12;
    const invested = monthlySip * months;
    const futureValue =
      monthlySip * ((Math.pow(1 + r, months) - 1) / r) * (1 + r);
    const returns = futureValue - invested;

    setInvestedAmount(invested);
    setEstimatedReturns(Math.round(returns));
    setTotalValue(Math.round(futureValue));
  }, [monthlySip, expectedReturns, years]);

  return (
    <div className="p-[20px] text-[#44475b] flex flex-col">
      <h1 className="text-[28px] w-full font-semibold tracking-wide">
        SIP Calculator
      </h1>
      <div className="flex w-full rounded-[20px] p-[10px] border">
        <div className="flex flex-col gap-y-[50px] mt-[30px] min-w-[420px]">
          <div className="flex flex-col gap-y-[15px]">
            <div className="flex justify-between items-center">
              <p>Monthly Investment</p>
              <div className="flex items-center font-bold py-[5px] px-[20px] gap-x-[5px] bg-blue-100 text-blue-500">
                ₹
                <input
                  className="border-transparent focus:border-transparent focus:ring-0 focus:outline-none align-end bg-transparent w-[100px]"
                  type="number"
                  placeholder="0"
                  value={monthlySip}
                  onChange={(e) => setMonthlySip(Number(e.target.value))}
                />
              </div>
            </div>
            <ProgressBar
              progress={(monthlySip / 100000) * 100}
              color={"#3b82f6"}
            />
          </div>
          <div className="flex flex-col gap-y-[15px]">
            <div className="flex justify-between items-center">
              <p>Expected Returns Rate (p.a)</p>
              <div className="flex items-center font-bold py-[5px] px-[20px] gap-x-[5px] bg-blue-100 text-blue-500">
                <input
                  className="border-transparent focus:border-transparent focus:ring-0 focus:outline-none align-end bg-transparent w-[40px]"
                  type="number"
                  placeholder="4"
                  value={expectedReturns}
                  onChange={(e) => setExpectedReturns(Number(e.target.value))}
                  min={1}
                />
                %
              </div>
            </div>
            <ProgressBar
              progress={(expectedReturns / 50) * 100}
              color={"#3b82f6"}
            />
          </div>
          <div className="flex flex-col gap-y-[15px]">
            <div className="flex justify-between items-center">
              <p>Investment Duration (Years)</p>
              <div className="flex items-center font-bold py-[5px] px-[20px] gap-x-[5px] bg-blue-100 text-blue-500">
                <input
                  className="border-transparent focus:border-transparent focus:ring-0 focus:outline-none align-end bg-transparent w-[40px]"
                  type="number"
                  placeholder="2"
                  value={years}
                  onChange={(e) => setYears(Number(e.target.value))}
                  min={1}
                />
                Yrs
              </div>
            </div>
            <ProgressBar progress={(years / 60) * 100} color={"#3b82f6"} />
          </div>
          <div className="flex flex-col gap-y-[5px]">
            <div className="flex justify-between">
              <p className="text-[14px]">Invested Amount</p>
              <p className="font-semibold text-[15px]">
                ₹{investedAmount.toLocaleString()}
              </p>
            </div>
            <div className="flex justify-between">
              <p className="text-[14px]">Est. Returns</p>
              <p className="font-semibold text-[15px]">
                ₹{estimatedReturns.toLocaleString()}
              </p>
            </div>
            <div className="flex justify-between">
              <p className="text-[14px]">Total Value</p>
              <p className="font-semibold text-[15px]">
                ₹{totalValue.toLocaleString()}
              </p>
            </div>
          </div>
        </div>
        <div className="flex justify-center items-center p-[40px] h-full min-w-[300px]">
          <Pie
            label={["Invested amount", "Est. Returns", "", "", ""]}
            color={["#eef0ff", "#5367ff", "#ffffff", "#ffffff", "ffffff"]}
            pieData={[investedAmount, estimatedReturns]}
          />
        </div>
      </div>
    </div>
  );
};

export default SIP;
