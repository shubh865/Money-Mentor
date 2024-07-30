import Navlinks from "./navlinks";
import { ToastContainer, toast } from "react-toastify";
import "react-toastify/dist/ReactToastify.css";

const Sidebar = () => {
  return (
    <div className="min-w-[280px] px-[2px] flex flex-col justify-between border-r-[1px] h-[100vh] py-[20px]">
      <div>
        <div className="flex flex-row gap-x-[15px] items-center px-[20px] pb-[10px] border-b-[1px]">
          <img className="h-[35px]" src="/images/bob.png" alt="logo" />
          <div className="flex flex-col justify-start font-Lexend">
            <p className="text-xl font-bold">Bank of Baroda</p>
            <span className="text-[12px] mt-[5px] font-light text-[#57534E] flex gap-x-[5px]">
              <p>Powered by</p>
              <img className="w-[55px]" src="/images/azure.png" />
            </span>
          </div>
        </div>

        <div className="flex flex-col gap-y-[10px] text-[14px] mt-[20px] h-[calc(100vh-110px)]">
          <Navlinks
            link="personal-finance"
            logo="financial.png"
            text="Investement Strategies"
          />
          <Navlinks
            link="retirement-planning"
            logo="retirement.png"
            text="Retirement Planning"
          />
          <Navlinks link="tools" logo="tools.png" text="Finance Tools" />
          <Navlinks link="expenses" logo="expense.png" text="Expense Tracker" />
          <Navlinks link="portfolio" logo="portfolio.png" text="My Portfolio" />
          <Navlinks
            link="market-insights"
            logo="insight.png"
            text="Market Insights"
          />
          <Navlinks
            link="learnings"
            logo="book.png"
            text="Financial Education"
          />
          
        </div>
        <ToastContainer />
      </div>
    </div>
  );
};

export default Sidebar;
