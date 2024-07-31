import React from "react";

const Market = () => {
  const topSearchedStocks = [
    {
      name: "Indian Railway Finance Corporation",
      icon: "/images/irfc.png",
    },
    {
      name: "Rail Vikas Nigam Limited",
      icon: "/images/rvnl.png",
    },
    {
      name: "Power Grid Corporation of India",
      icon: "/images/powergrid.png",
    },
    {
      name: "State Bank of India",
      icon: "/images/sbi.png",
    },
    {
      name: "Indian Oil Corporation",
      icon: "/images/ioc.png",
    },
    {
      name: "Tata Power Company",
      icon: "/images/tata.png",
    },
    {
      name: "Adani Port & SEZ",
      icon: "/images/adani.png",
    },
    {
      name: "Suzlon Energy",
      icon: "/images/suzlon.png",
    },
  ];
  const upTrendStocks = [
    {
      name: "TATA STEEL LIMITED",
      price: "₹ 165.33",
      change: "0.77%",
      icon: "/images/tata.png",
      color: "green",
    },
    {
      name: "JIO FIN SERVICES",
      price: "₹ 328.50",
      change: "0.26%",
      icon: "/images/jio.png",
      color: "red",
    },
    {
      name: "TATA CONSULTANCY SERVICES",
      price: "₹ 4385",
      change: "0.46%",
      icon: "/images/tcs.png",
      color: "green",
    },
    {
      name: "BHARAT PETROLEUM CORPORATION",
      price: "₹ 350.05",
      change: "0.53%",
      icon: "/images/bpcl.png",
      color: "green",
    },
    {
      name: "ICICI BANK",
      price: "₹ 1214.90",
      change: "0.65%",
      icon: "/images/icici.png",
      color: "RED",
    },
  ];
  return (
    <div>
      <div className="p-[15px]">
        <h1 className="font-bold">Top Searched stocks</h1>
        <div className="mt-[15px] flex flex-wrap gap-x-[10px] gap-y-[10px]">
          {topSearchedStocks.map((stock) => (
            <div className="flex items-center gap-x-[5px] bg-gray-200 rounded-full p-[5px] pr-[10px]">
              <img
                className="h-[30px] w-[30px] rounded-full"
                src={stock.icon}
                alt={stock.name}
              />
              <p className="text-[14px]">{stock.name}</p>
            </div>
          ))}
        </div>
      </div>
      <div className="bg-gray-300 py-[30px] px-[20px]">
        <h1 className="text-[28px] font-semibold">UpTrend</h1>
        <p className="text-[14px]">Top stocks by order value</p>
        <div className="flex mt-[15px] gap-x-[15px]">
          {upTrendStocks.map((stock, index) => (
            <div className="p-[10px] w-[155px] rounded-[10px] bg-white">
              <img
                className="w-[35px] mb-[10px] h-[35px] rounded-full"
                src={stock.icon}
                alt={stock.name}
              />
              <p className="text-gray-800 mb-[3px] text-[14px] overflow-hidden whitespace-nowrap text-overflow-ellipsis">
                {stock.name}
              </p>
              <p className="text-[18px] font-semibold">{stock.price}</p>
              <p className={`text-${stock.color}-700 text-[16px]`}>
                {stock.change}
              </p>
            </div>
          ))}
        </div>
      </div>
    </div>
  );
};

export default Market;
