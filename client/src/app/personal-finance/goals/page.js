"use client";
import React, { useState } from "react";

const Goals = () => {
  const [goals, setGoals] = useState([
    { name: "College Savings", price: "10 Lakhs" },
    { name: "Save for a vacation", price: "2 Lakhs" },
    { name: "Wealth Accumulation", price: "-" },
    { name: "Buy a home", price: "1.5 Crs" },
  ]);

  const [selectedGoals, setSelectedGoals] = useState([]);
  const [showCustomInput, setShowCustomInput] = useState(false);
  const [customGoalName, setCustomGoalName] = useState("");
  const [customGoalPrice, setCustomGoalPrice] = useState("");
  const [initialAmount, setInitialAmount] = useState();
  const [year, setYears] = useState();
  const [stepNumber, setStepNumber] = useState(1);

  const handleSelectGoal = (goal) => {
    if (selectedGoals.includes(goal)) {
      setSelectedGoals(selectedGoals.filter((g) => g !== goal));
    } else {
      setSelectedGoals([...selectedGoals, goal]);
    }
  };

  const handleAddCustomGoal = () => {
    if (customGoalName && customGoalPrice) {
      const newGoal = {
        name: customGoalName,
        price: parseInt(customGoalPrice),
      };
      setGoals([...goals, newGoal]);
      setSelectedGoals([...selectedGoals, newGoal]);
      setCustomGoalName("");
      setCustomGoalPrice("");
      setShowCustomInput(false);
    }
  };
  const handleBack = () => {
    if (stepNumber != 1) setStepNumber(stepNumber - 1);
  };
  const handleNext = () => {
    setStepNumber(stepNumber + 1);
  };

  console.log(stepNumber);

  return (
    <div className="p-[10px] pt-[20px] justify-between flex flex-col items-center text-[#404041] min-h-[calc(100vh-80px)]">
      {stepNumber == 1 ? (
        <div>
          <h1 className="font-bold text-[18px]">
            Let's start with your goals, Deep
          </h1>
          <p className="text-[18px]">
            What are your primary financial goals? Select
          </p>
          <div className="mt-[30px] grid grid-cols-2 gap-[40px] gap-y-[30px] mt-4">
            {goals.map((goal, index) => (
              <div
                key={index}
                className={`shadow-md shadow-gray-500/50 p-[10px] px-[20px] w-[300px] rounded-[8px] cursor-pointer ${
                  selectedGoals.includes(goal)
                    ? "border-blue-500 border-[2px]"
                    : "border-gray-500"
                }`}
                onClick={() => handleSelectGoal(goal)}
              >
                <h2>{goal.name}</h2>
                <p>{`Corpus: ₹ ${goal.price}`}</p>
              </div>
            ))}
          </div>
          <div className="mt-[40px] w-full flex justify-center">
            {!showCustomInput ? (
              <button
                onClick={() => setShowCustomInput(true)}
                className="border rounded-[10px] p-2 px-[20px] bg-blue-500 text-white"
              >
                Add Custom Goal
              </button>
            ) : (
              <div className="flex flex-col items-center">
                <input
                  type="text"
                  placeholder="Goal Name"
                  value={customGoalName}
                  onChange={(e) => setCustomGoalName(e.target.value)}
                  className="border p-2 mt-2 rounded"
                />
                <input
                  type="number"
                  placeholder="Corpus Required"
                  value={customGoalPrice}
                  onChange={(e) => setCustomGoalPrice(e.target.value)}
                  min={0}
                  className="border p-2 mt-2 rounded"
                />
                <button
                  onClick={handleAddCustomGoal}
                  className="border rounded-[10px] px-[20px] p-2 bg-green-500 text-white mt-2"
                >
                  Add Goal
                </button>
              </div>
            )}
          </div>
        </div>
      ) : stepNumber == 2 ? (
        <div>
          <h1 className="text-[20px]">How much do you have to invest?</h1>
          <div className="w-[600px] mt-[30px] flex flex-col gap-y-[10px]">
            <p>Initial investment amount</p>
            <input
              className="px-[10px] p-[8px] border bg-[#f1f3f5]"
              type="number"
              placeholder="e.g. ₹ 100000"
              min={0}
              value={initialAmount}
              onChange={(e) => setInitialAmount(e.target.value)}
            />
            <p className="mt-[30px]">At what time will require your money</p>
            <input
              className="px-[10px] p-[8px] border bg-[#f1f3f5]"
              type="number"
              placeholder="e.g. 5 Years"
              min={1}
              max={100}
              value={year}
              onChange={(e) => setYears(e.target.value)}
            />
          </div>
        </div>
      ) : (
        <div>
          <h1>Output</h1>
        </div>
      )}
      <div className="flex justify-between w-full items-center mt-[20px ] px-[40px]">
        <button className="flex items-center gap-x-[5px]" onClick={handleBack}>
          <svg
            xmlns="http://www.w3.org/2000/svg"
            fill="none"
            viewBox="0 0 24 24"
            strokeWidth="1.5"
            stroke="currentColor"
            className="size-4"
          >
            <path
              strokeLinecap="round"
              strokeLinejoin="round"
              d="M10.5 19.5 3 12m0 0 7.5-7.5M3 12h18"
            />
          </svg>
          Back
        </button>
        <button
          className="flex items-center gap-x-[5px] mt-[10px] rounded-full p-[5px] px-[20px] bg-blue-500 text-white"
          onClick={handleNext}
        >
          Next
          <svg
            xmlns="http://www.w3.org/2000/svg"
            fill="none"
            viewBox="0 0 24 24"
            strokeWidth="1.5"
            stroke="currentColor"
            className="size-4"
          >
            <path
              strokeLinecap="round"
              strokeLinejoin="round"
              d="M13.5 4.5 21 12m0 0-7.5 7.5M21 12H3"
            />
          </svg>
        </button>
      </div>
    </div>
  );
};

export default Goals;
