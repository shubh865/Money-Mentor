"use client";
import { useState } from "react";

const AddHealthRecord = ({ handleSubmit }) => {
  const [healthData, setHealthData] = useState([]);
  const [attached, setAttached] = useState([]);

  const handleInputChange = (index, fieldName, value) => {
    setHealthData((prevHealthData) => {
      const updatedHealthData = [...prevHealthData];
      updatedHealthData[index][fieldName] = value;
      return updatedHealthData;
    });
  };

  const handleFileChange = (index, event) => {
    const selectedFile = event.target.files[0];

    setHealthData((prevHealthData) => {
      const updatedHealthData = [...prevHealthData];
      const existingFiles = updatedHealthData[index].attachedFile || [];

      // Check if the selected file is already in the list using a reference comparison
      const isDuplicate = existingFiles.some((file) => file === selectedFile);

      if (!isDuplicate) {
        updatedHealthData[index].attachedFile = [
          ...existingFiles,
          selectedFile,
        ];
      }

      return updatedHealthData;
    });
  };

  const handleFileDelete = (healthDataIndex, attachedIndex) => {
    setHealthData((prevHealthData) => {
      const updatedHealthData = [...prevHealthData];
      updatedHealthData[healthDataIndex].attachedFile.splice(attachedIndex, 1);
      return updatedHealthData;
    });
  };
  const handleDeleteHealthData = (index) => {
    setHealthData((prevHealthData) => {
      const updatedHealthData = [...prevHealthData];
      updatedHealthData.splice(index, 1);
      return updatedHealthData;
    });
  };

  return (
    <section>
      <div className="p-4">
        <div className="ml-4 mb-4">
          <h1 className="text-2xl font-medium">Health Details</h1>
          <p className="mt-[5px] text-[14px]">
            Enter any current / past health issues
          </p>
        </div>
        {healthData.length ? (
          <>
            {healthData.map((item, healthDataIndex) => {
              return (
                <div
                  key={healthDataIndex}
                  className="border-[1.5px] border-[#d9d9d9] w-full py-[10px] px-[20px]"
                >
                  <div className="flex justify-between">
                    <div className="flex gap-x-8">
                      <div>
                        <p className="font-inter text-[#57534E] mb-[5px] font-medium text-[14px]">
                          Disease name / Symptoms:
                        </p>
                        <input
                          className="px-4 border-[1.5px] w-[200px] border-[#D9D9D9] rounded-md py-[5px]"
                          placeholder="Diseases name"
                          value={item.diseaseName}
                          onChange={(e) =>
                            handleInputChange(
                              healthDataIndex,
                              "diseaseName",
                              e.target.value
                            )
                          }
                        ></input>
                      </div>
                      <div>
                        <p className="font-inter text-[#57534E] mb-[5px] font-medium text-[14px]">
                          Experiencing from:
                        </p>
                        <input
                          className="px-4 border-[1.5px] text-[#9ca3af] w-[160px] border-[#D9D9D9] rounded-md py-[5px]"
                          type="date"
                          value={item.date}
                          onChange={(e) =>
                            handleInputChange(
                              healthDataIndex,
                              "date",
                              e.target.value
                            )
                          }
                        />
                      </div>
                      <div className="h-[60px]">
                        <p className="font-inter text-[#57534E] mb-[5px] font-medium text-[14px]">
                          Report/Doctor's Findings:
                        </p>
                        <div className="px-4 border-[1.5px] w-[180px] border-[#D9D9D9] rounded-md py-[5px]">
                          <p className="text-[#9ca3af] flex justify-center align-center items-center gap-x-2">
                            <img
                              className="w-4"
                              src="/icons/upload.svg"
                              alt="upload"
                            />
                            Upload File
                          </p>
                        </div>
                        <input
                          className="px-4 opacity-0 relative top-[-38px] border-[1.5px] w-[180px] border-[#000] rounded-md py-[2px]"
                          type="file"
                          onChange={(e) => handleFileChange(healthDataIndex, e)}
                        />
                      </div>
                      <div>
                        <p className="font-inter text-[#57534E] mb-[5px] font-medium text-[14px]">
                          Additional information:
                        </p>
                        <input
                          className="px-4 border-[1.5px] w-[200px] border-[#D9D9D9] rounded-md py-[5px]"
                          placeholder="Additional information"
                          value={item.additionalInformation}
                          onChange={(e) =>
                            handleInputChange(
                              healthDataIndex,
                              "additionalInformation",
                              e.target.value
                            )
                          }
                        />
                      </div>
                    </div>
                    <div className="min-h-full flex items-end py-2">
                      <img
                        className="w-6 cursor-pointer"
                        src="/icons/delete.svg"
                        alt="delete"
                        onClick={() => handleDeleteHealthData(healthDataIndex)}
                      />
                    </div>
                  </div>
                  <div className="mt-4">
                    <p className="text-[#7D7C81]">
                      Attached:{" "}
                      <em>(click on upload button to attach files)</em>
                    </p>
                    <div className="mt-2 text-[#57534E] mb-[5px] font-normal text-[15px] ">
                      {item.attachedFile.length ? (
                        <div>
                          {item.attachedFile.map((file, id) => {
                            return (
                              <div
                                className="flex w-[500px] items-center justify-between"
                                key={id}
                              >
                                <p className="flex mt-[3px] items-center font-inter text-[#57534E] mb-[5px] font-medium text-[14px]">
                                  <span className="mr-2">{id + 1}.</span>
                                  <span className="truncate w-[340px] inline-block">
                                    {file.name}
                                  </span>
                                </p>
                                <div className="flex gap-x-8 items-center">
                                  <p className="flex font-medium text-[#9ca3af]">
                                    View
                                    <img
                                      className="w-4 mb-[4px] ml-2"
                                      src="/icons/view.svg"
                                      alt="view"
                                    />
                                  </p>
                                  <img
                                    className="w-5 cursor-pointer"
                                    src="/icons/delete.svg"
                                    alt="delete"
                                    onClick={() =>
                                      handleFileDelete(healthDataIndex, id)
                                    }
                                  />
                                </div>
                              </div>
                            );
                          })}
                        </div>
                      ) : (
                        <p className="">No files attached</p>
                      )}
                    </div>
                  </div>
                </div>
              );
            })}
          </>
        ) : (
          <p>
            <em>Click Add More button to create new record </em>
          </p>
        )}

        <button
          className="flex items-center gap-x-3 mt-8 justify-center text-[#003865] font-medium text-[14px] font-inter border-[1.5px] w-[145px] py-1.5 rounded-lg border-[#2EADE2]"
          onClick={() => {
            setHealthData((prevData) => [
              ...prevData,
              {
                diseaseName: "",
                date: "",
                attachedFile: [],
                additionalInformation: "",
              },
            ]);
          }}
        >
          <img className="w-5" src="/icons/add.svg"></img> add more
        </button>
      </div>
      <div className="flex justify-center mt-[20px]">
        <div
          className="text-gray-200 h-[40px] w-[120px] justify-center bg-[#2EADE2] py-1 px-4 flex items-center cursor-pointer text-[#003865] font-medium rounded-md text-[14px]"
          onClick={() => handleSubmit(healthData)}
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
    </section>
  );
};
export default AddHealthRecord;
