export const ProgressBar = ({ progress, color }) => {
    return (
      <div className="bg-gray-300 h-2 w-[100%] rounded-full overflow-hidden">
        <div
          className={`h-full transition-all ease-in-out rounded-full`}
          style={{ width: `${progress}%`, backgroundColor: color }}
        ></div>
      </div>
    );
  };