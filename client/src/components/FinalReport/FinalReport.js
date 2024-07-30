const FinalReport = ({ list }) => {
  console.log(typeof list);
  console.log(list);

  return (
    <>
      {list ? (
        <section className="p-4">
          <div className="flex text-[#000000] text-[16px] font-medium px-4 justify-between border-[1px] border-[#404040] bg-[#FFD87A] pr-[70px] h-[30px] items-center">
            <div>Total corpus for recurring expenses:</div>
            <div>₹ {list.data.final_corpus}</div>
          </div>
          <h1 className="font-medium text-[16px] my-4">Recurring Expenses</h1>
          <div className="flex-col w-fit">
            <div className="flex text-[#404040] text-[14px] w-fit font-medium border-[1px] border-[#404040] bg-[#FFD87A]">
              <div className="border-r-[1px] border-[#000] w-[248px] flex justify-center py-[5px]">
                Name
              </div>
              <div className="border-r-[1px] border-[#000] w-[160px] flex justify-center py-[5px]">
                Current expense
              </div>
              <div className="border-r-[1px] border-[#000] w-[160px] flex justify-center py-[5px]">
                Current Inflation
              </div>
              <div className="border-r-[1px] border-[#000] w-[160px] flex justify-center py-[5px]">
                At age 61
              </div>
              <div className="border-r-[1px] border-[#000] w-[160px] flex justify-center py-[5px]">
                At age 90
              </div>
              <div className="border-[#000] w-[140px] w-[180px] flex justify-center py-[5px]">
                Total
              </div>
            </div>
            {list.data.future_expenses.map((item) => {
              return (
                <div className="flex text-[#404040] text-[14px] font-medium border-l-[1px] border-r-[1px] border-b-[1px] border-[#]">
                  <div className="border-r-[1px] border-l-[1px] border-[#000] w-[248px] flex justify-center py-[5px]">
                    {item.name}
                  </div>
                  <div className="border-r-[1px] border-[#000] w-[160px] flex justify-center py-[5px]">
                    {item.current_expense}
                  </div>
                  <div className="border-r-[1px] border-[#000] w-[160px] flex justify-center py-[5px]">
                    {item.inflation_rate} %
                  </div>
                  <div className="border-r-[1px] border-[#000] w-[160px] flex justify-center py-[5px]">
                    {item.future_expense_start}
                  </div>
                  <div className="border-r-[1px] border-[#000] w-[160px] flex justify-center py-[5px]">
                    {item.future_expense_end}
                  </div>
                  <div className="border-[#000] border-r-[1px] w-[140px] w-[180px] flex justify-center py-[5px]">
                    {item.category_total}
                  </div>
                </div>
              );
            })}
            <div className="flex text-[#000000] text-[14px] font-medium px-4 justify-between border-[1px] border-[#404040] bg-[#FFD87A] pr-[70px] h-[30px] items-center">
              <div>Total corpus for recurring expenses:</div>
              <div>₹ {list.data.total_corpus}</div>
            </div>
          </div>
          <h1 className="font-medium text-[16px] my-4">Health Expenses</h1>

          <div className="flex-col w-fit">
            <div className="flex text-[#404040] text-[14px] font-medium border-[1px] border-[#404040] bg-[#FFD87A] w-fit">
              <div className="border-r-[1px] border-[#000] w-[260px] flex justify-center py-[5px]">
                Disease Name
              </div>
              <div className="border-r-[1px] border-[#000] w-[310px] flex justify-center py-[5px]">
                Surgery Name
              </div>
              <div className="border-r-[1px] border-[#000] w-[160px] flex justify-center py-[5px]">
                Cost
              </div>
              <div className="border-r-[1px] border-[#000] w-[160px] flex justify-center py-[5px]">
                Inflation rate
              </div>
              <div className="border-[#000] w-[180px] flex justify-center py-[5px]">
                Inflation Considered Cost
              </div>
            </div>
            {list.data.future_diseases.map((item) => {
              return (
                <div className="flex text-[#404040] text-[14px] font-medium border-l-[1px] border-r-[1px] border-b-[1px] border-[#404040] w-fit">
                  <div className="border-r-[1px] border-[#000] w-[260px] flex justify-center py-[5px]">
                    {item["disease name"]}
                  </div>
                  <div className="border-r-[1px] border-[#000] w-[310px] flex justify-center py-[5px]">
                    {item["surgery name"]}
                  </div>
                  <div className="border-r-[1px] border-[#000] w-[160px] flex justify-center py-[5px]">
                    {item.cost}
                  </div>
                  <div className="border-r-[1px] border-[#000] w-[160px] flex justify-center py-[5px]">
                    {item.health_inflation_rate} %
                  </div>
                  <div className="border-[#000] w-[180px] flex justify-center py-[5px]">
                    {item.inflation_considered_cost}
                  </div>
                </div>
              );
            })}
            <div className="flex text-[#000000] text-[14px] font-medium border-l-[1px] px-4 justify-between border-r-[1px] border-b-[1px] border-[#404040] bg-[#FFD87A] pr-[70px] h-[30px] items-center">
              <div>Total corpus for heatlh expenses:</div>
              <div>₹ {list.data.toatl_health_corpus}</div>
            </div>
          </div>
        </section>
      ) : null}
    </>
    // {list? }
  );
};

export default FinalReport;
