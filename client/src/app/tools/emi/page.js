"use client";
import React, { useState, useEffect } from "react";
import { ProgressBar } from "@/components/AddExpenses/progress";
import { Pie } from "@/components/AddExpenses/pie";

const Emi = () => {
  const [loanAmount, setLoanAmount] = useState(1000000);
  const [rateInterest, setRateInterest] = useState(7);
  const [years, setYears] = useState(5);

  const [emi, setEmi] = useState(0);
  const [principal, setPrincipal] = useState(0);
  const [totalInterest, setTotalInterest] = useState(0);
  const [totalPayment, setTotalPayment] = useState(0);

  useEffect(() => {
    const calculateEMI = () => {
      const principal = loanAmount;
      const annualInterestRate = rateInterest / 100;
      const monthlyInterestRate = annualInterestRate / 12;
      const numberOfPayments = years * 12;

      const emi =
        (principal *
          monthlyInterestRate *
          Math.pow(1 + monthlyInterestRate, numberOfPayments)) /
        (Math.pow(1 + monthlyInterestRate, numberOfPayments) - 1);
      const totalPayment = emi * numberOfPayments;
      const totalInterest = totalPayment - principal;

      setEmi(emi);
      setPrincipal(principal);
      setTotalInterest(totalInterest);
      setTotalPayment(totalPayment);
    };

    calculateEMI();
  }, [loanAmount, rateInterest, years]);

  return (
    <div className="p-[20px] text-[#44475b] flex flex-col">
      <h1 className="text-[28px] w-full font-semibold tracking-wide">
        EMI Calculator
      </h1>
      <div className="flex w-full rounded-[20px] p-[10px] border">
        <div className="flex flex-col gap-y-[50px] mt-[30px] min-w-[420px]">
          <div className="flex flex-col gap-y-[15px]">
            <div className="flex justify-between items-center">
              <p>Loan Amount</p>
              <div className="flex items-center font-bold py-[5px] px-[20px] gap-x-[5px] bg-blue-100 text-blue-500">
                ₹
                <input
                  className="border-transparent focus:border-transparent focus:ring-0 focus:outline-none align-end bg-transparent w-[100px]"
                  type="number"
                  placeholder="0"
                  value={loanAmount}
                  onChange={(e) => setLoanAmount(Number(e.target.value))}
                />
              </div>
            </div>
            <ProgressBar
              progress={(loanAmount / 10000000) * 100}
              color={"#3b82f6"}
            />
          </div>
          <div className="flex flex-col gap-y-[15px]">
            <div className="flex justify-between items-center">
              <p>Rate of Interest (p.a)</p>
              <div className="flex items-center font-bold py-[5px] px-[20px] gap-x-[5px] bg-blue-100 text-blue-500">
                <input
                  className="border-transparent focus:border-transparent focus:ring-0 focus:outline-none align-end bg-transparent w-[40px]"
                  type="number"
                  placeholder="4"
                  value={rateInterest}
                  onChange={(e) => setRateInterest(Number(e.target.value))}
                  min={1}
                />
                %
              </div>
            </div>
            <ProgressBar
              progress={(rateInterest / 30) * 100}
              color={"#3b82f6"}
            />
          </div>
          <div className="flex flex-col gap-y-[15px]">
            <div className="flex justify-between items-center">
              <p>Loan Tenure (Years)</p>
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
            <ProgressBar progress={(years / 30) * 100} color={"#3b82f6"} />
          </div>
          <div className="flex flex-col gap-y-[5px]">
            <div className="flex justify-between">
              <p className="text-[14px]">Monthly EMI</p>
              <p className="font-semibold text-[15px]">
                ₹{emi.toLocaleString(undefined, { maximumFractionDigits: 0 })}
              </p>
            </div>
            <div className="flex justify-between">
              <p className="text-[14px]">Principal Amount</p>
              <p className="font-semibold text-[15px]">
                ₹{principal.toLocaleString()}
              </p>
            </div>
            <div className="flex justify-between">
              <p className="text-[14px]">Total Interest</p>
              <p className="font-semibold text-[15px]">
                ₹
                {totalInterest.toLocaleString(undefined, {
                  maximumFractionDigits: 0,
                })}
              </p>
            </div>
            <div className="flex justify-between">
              <p className="text-[14px]">Total Payment</p>
              <p className="font-semibold text-[15px]">
                ₹
                {totalPayment.toLocaleString(undefined, {
                  maximumFractionDigits: 0,
                })}
              </p>
            </div>
          </div>
        </div>
        <div className="flex justify-center items-center p-[40px] h-full min-w-[300px]">
          <Pie
            label={["Principle amount", "Interest amount", "", "", ""]}
            color={["#eef0ff", "#5367ff", "#ffffff", "#ffffff", "ffffff"]}
            pieData={[principal, totalInterest]}
          />
        </div>
      </div>
    </div>
  );
};

export default Emi;
