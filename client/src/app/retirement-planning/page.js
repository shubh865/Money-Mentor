"use client";
import React, { useState } from "react";
import AddExpenses from "@/components/AddExpenses/AddExpenses";
import AddHealthRecord from "@/components/HealthRecords/HeathRecords";
import FinalReport from "@/components/FinalReport/FinalReport";
import axios from "axios";
import { ScaleLoader } from "react-spinners";

const PredictCorpus = () => {
  const [data, setData] = useState({});
  const [step, setStep] = useState(1);
  const [isLoading, setisLoading] = useState(false);
  const [response, setResponse] = useState(null);

  const addExpenses = (list, totalExpense) => {
    setData((prevData) => ({
      ...prevData,
      age: 30,
      retirement_age: 60,
      current_monthly_expense: parseInt(totalExpense),
      current_expenses: list,
    }));
    setStep(2);
  };

  const addHealthRecord = async (list) => {
    const healthData = [];
    const currentDate = new Date();

    list.forEach((item) => {
      const recordDate = new Date(item.date);
      const yearsDiff = currentDate.getFullYear() - recordDate.getFullYear();
      healthData.push({
        disease_name: item.diseaseName,
        experiencing_from: `${yearsDiff} years`,
      });
    });

    setStep(3);
    setisLoading(true);
    var body = data;
    body["current_health_conditions"] = healthData;
    let config = {
      method: "post",
      maxBodyLength: Infinity,
      url: "http://127.0.0.1:5001/predictRetirementCorpus",
      headers: {
        "Content-Type": "application/json",
      },
      data: body,
    };

    axios
      .request(config)
      .then((response) => {
        console.log(response.data);
        setResponse(response.data);
        setisLoading(false);
      })
      .catch((error) => {
        console.log(error);
      });
  };

  return (
    <>
      {step == 1 ? (
        <AddExpenses handleSubmit={addExpenses} />
      ) : step == 2 ? (
        <AddHealthRecord handleSubmit={addHealthRecord} />
      ) : (
        <>
          {!isLoading ? (
            <FinalReport list={response} />
          ) : (
            <div className="flex flex-col min-h-[calc(100vh-200px)] w-full justify-center items-center">
              <ScaleLoader color="#3b82f6" />
            </div>
          )}
        </>
      )}
    </>
  );
};

export default PredictCorpus;
