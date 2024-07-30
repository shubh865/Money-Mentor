"use client";
import React, { useState, useEffect } from "react";
// import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faTrash } from "@fortawesome/free-solid-svg-icons";
import { Pie } from "@/components/AddExpenses/pie";
import { ProgressBar } from "./progress";
import Modal from "./addItemModal";

const AddExpenses = ({ handleSubmit }) => {
  const [totalExpence, setTotalExpence] = useState(9200);
  const [count, setCount] = useState(3);
  const [label, setLabel] = useState([
    "Grocery",
    "Electricity bill",
    "Gas bill",
    "House maintainence",
  ]);
  // const [colorList, setColorList] = useState(['#4C7CFF', '#FF6B6B', '#63B3ED', '#FFD166']);

  const [predictionList, setPredictionList] = useState([
    { name: "Grocery", expense: 5000, category: "food_and_beverages" },
    { name: "Electricity bill", expense: 2000, category: "fuel_and_light" },
    { name: "Gas bill", expense: 1700, category: "fuel_and_light" },
    { name: "House maintainence", expense: 500, category: "inflation_rate" },
  ]);

  const [data, setData] = useState([5000, 2000, 1700, 500]);

  const pieChartColors = [
    "#4C7CFF",
    "#FF6B6B",
    "#63B3ED",
    "#FFD166",
    "#A0D468",
    "#ED5565",
    "#48CFAD",
    "#AC92EB",
    "#FFCE54",
    "#6A6A6A",
    "#EC87C0",
    "#5DB2FF",
    "#FFD700",
    "#9F9F9F",
    "#37BC9B",
    "#967ADC",
    "#FF7857",
    "#5E5E5E",
    "#DA4453",
    "#80D3E6",
  ];

  const [isModalOpen, setModalOpen] = useState(false);

  const openModal = () => {
    setModalOpen(true);
  };

  const closeModal = () => {
    setModalOpen(false);
  };

  const handleUpdateCategory = (index, newVal) => {
    // console.log(index,newVal);
    // const newData = [...data];

    //   newData[index] = parseInt(newVal);
    //   setData(newData);
    //   setTotalExpence(totalExpence - data[index] + parseInt(newVal))
    if (isNaN(newVal)) {
      const newData = [...data];
      newData[index] = 0;
      setData(newData);
      setTotalExpence(totalExpence - data[index]);
    } else {
      const newData = [...data];

      newData[index] = parseInt(newVal);
      setData(newData);
      setTotalExpence(totalExpence - data[index] + parseInt(newVal));
    }
  };

  const handleAddCategory = (category, expense, categoryType) => {
    const newItem = {
      id: count + 1,
      name: category,
      expense: parseInt(expense),
      category: categoryType,
    };

    setTotalExpence(totalExpence + parseInt(expense));
    setLabel([...label, category]);
    setData([...data, parseInt(expense)]);
    // setColorList([...colorList,pieChartColors[count+1]])
    setPredictionList([...predictionList, newItem]);

    setCount(count + 1);

    closeModal();
  };

  const handleRemoveElement = (index) => {
    setTotalExpence(totalExpence - data[index]);
    const newData = data.filter((element) => element !== data[parseInt(index)]);
    const newLabel = label.filter(
      (element) => element !== label[parseInt(index)]
    );
    const newList = predictionList.filter(
      (_, index) => index !== parseInt(index)
    );
    setData(newData);
    setLabel(newLabel);
    setPredictionList(newList);
    setCount(count - 1);
  };

  // useEffect(() => {
  //   console.log(totalExpence);
  // }, [data]);
  return (
    <div className="p-[30px]">
      <div className="  flex justify-between">
        <div className="w-[55%] bg-[white] ">
          <div className="font-medium text-[18px]">Categories</div>
          <div className="text-[12px] mb-[30px]">
            Enter monthly spendings in each category
          </div>
          <div className="mb-[40px] w-[100%]">
            {label.map((item, index) => (
              <div
                key={index}
                className="flex flex-row justify-between pr-[50px] py-[20px] w-[100%] "
              >
                <div className="flex flex-col items-start  relative w-[65%]">
                  <h1 className="font-medium text-[16px] relative top-[-8px]">
                    {item}
                  </h1>
                  <div className="flex items-center justify-center w-[90%] ">
                    <ProgressBar
                      progress={(data[index] / totalExpence) * 100}
                      color={pieChartColors[index]}
                    />
                  </div>
                </div>
                <div className="w-[35%]">
                  <input
                    type="number"
                    placeholder="₹ 0.00"
                    value={data[index]}
                    className={`px-2 py-1 w-[100px] hover:border-[1px] hover:border-[gray] rounded-md`}
                    style={{
                      borderColor: pieChartColors[index],
                      borderWidth: "1px",
                      borderStyle: "solid",
                    }}
                    onChange={(e) =>
                      handleUpdateCategory(index, parseInt(e.target.value))
                    }
                  />
                  <span className="ml-2 cursor-pointer">
                    {/* <FontAwesomeIcon icon={faTrash} className="text-[gray]" onClick={() => handleRemoveElement(index)} /> */}
                  </span>
                </div>
              </div>
            ))}
          </div>
          <div className="flex justify-between">
            <div
              className="border border-[#2EADE2] py-1 px-4 flex items-center cursor-pointer text-[#003865] font-medium rounded-md text-[14px]"
              onClick={openModal}
            >
              <span className="text-[#2EADE2] mr-2 text-[20px] font-bold">
                +
              </span>
              Add New Category
            </div>
            <div
              className="text-gray-200 w-[110px] justify-center bg-[#2EADE2] py-1 px-4 flex items-center cursor-pointer text-[#003865] font-medium rounded-md text-[14px]"
              onClick={() => handleSubmit(predictionList, totalExpence)}
            >
              <span className="mr-2 mt-[-2px]">Next</span>
              <svg
                xmlns="http://www.w3.org/2000/svg"
                fill="none"
                viewBox="0 0 24 24"
                strokeWidth="2.5"
                stroke="currentColor"
                className="w-4 h-4"
              >
                <path
                  strokeLinecap="round"
                  strokeLinejoin="round"
                  d="M13.5 4.5L21 12m0 0l-7.5 7.5M21 12H3"
                />
              </svg>
            </div>
          </div>
        </div>
        <div className="w-[50%] flex flex-col  items-center relative text-center">
          <div className="font-medium text-[18px] mb-[10px]">
            Expense Distribution
          </div>
          <div className="w-[80%]">
            {" "}
            <Pie
              label={label}
              color={pieChartColors.slice(0, count + 1)}
              pieData={data}
            />
          </div>
          <div className=" absolute top-[45%]">
            <p className="leading-4	">
              Total montly <br /> expenses
            </p>
            <div className="mt-[5px] font-bold text-[22px]">
              ₹ {totalExpence}
            </div>
          </div>
        </div>
        <Modal
          isOpen={isModalOpen}
          closeModal={closeModal}
          onAddCategory={handleAddCategory}
        />
      </div>
    </div>
  );
};
export default AddExpenses;
