import React, { useState } from "react";

const Modal = ({ isOpen, closeModal, onAddCategory }) => {
  const [itemName, setItemName] = useState("");
  const [itemPrice, setItemPrice] = useState(0);
  const [itemCategory, setItemCategory] = useState("");

  const handleAddItem = () => {
    onAddCategory(itemName, itemPrice, itemCategory);
    closeModal();
  };

  return (
    <div className={`fixed inset-0 ${isOpen ? "block" : "hidden"}`}>
      <div
        className="fixed inset-0 bg-black opacity-50"
        onClick={closeModal}
      ></div>
      <div className="fixed inset-0 flex items-center justify-center bg-black bg-opacity-50">
        <div className="bg-white p-8 rounded-md w-96 h-100">
          <span
            className="absolute top-2 right-2 cursor-pointer text-xl"
            onClick={closeModal}
          >
            &times;
          </span>
          <h2 className="text-2xl mb-4">Add Item</h2>
          <label
            htmlFor="itemName"
            className="block mb-2 text-sm font-semibold"
          >
            Name:
          </label>
          <input
            type="text"
            id="itemName"
            value={itemName}
            onChange={(e) => setItemName(e.target.value)}
            placeholder="Enter the Name"
            className="w-full border border-gray-300 rounded px-3 py-2 mb-4 focus:outline-none focus:ring focus:border-blue-500"
          />
          <label
            htmlFor="itemPrice"
            className="block mb-2 text-sm font-semibold"
          >
            Category expense:
          </label>
          <input
            type="number"
            id="itemPrice"
            value={itemPrice}
            onChange={(e) => setItemPrice(e.target.value)}
            placeholder="Enter the expense"
            className="w-full border border-gray-300 rounded px-3 py-2 mb-4 focus:outline-none focus:ring focus:border-blue-500"
          />
          <label
            htmlFor="itemName"
            className="block mb-2 text-sm font-semibold"
          >
            Category:
          </label>
          <input
            type="text"
            id="itemCategory"
            value={itemCategory}
            onChange={(e) => setItemCategory(e.target.value)}
            placeholder="Enter the Category"
            className="w-full border border-gray-300 rounded px-3 py-2 mb-4 focus:outline-none focus:ring focus:border-blue-500"
          />
          <button
            onClick={handleAddItem}
            className="mx-auto flex items-center gap-x-3 mt-4 justify-center text-[#003865] font-medium text-[14px] font-inter border-[1.5px] w-[145px] py-1.5 rounded-lg border-[#2EADE2]"
          >
            <img className="w-5" src="/icons/add.svg"></img> Add Expense
          </button>
        </div>
      </div>
    </div>
  );
};

export default Modal;
