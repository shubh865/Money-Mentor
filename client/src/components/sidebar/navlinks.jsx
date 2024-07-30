"use client";

import { usePathname, useRouter } from "next/navigation";

const Navlinks = ({ link, text, logo }) => {
  const Router = useRouter();
  const pathname = usePathname();

  const onClickHandler = () => {
    if (pathname == "/" + link) {
      return;
    } else if (link == "Logout") {
    } else {
      Router.push("/" + link);
    }
  };
  const isActive = (path) => {
    return pathname.includes(path);
  };

  return (
    <div
      className={`flex flex-row pl-[40px] py-[12px] gap-x-[20px] font-medium px-[16px] box-border items-center ${
        isActive(link) && "bg-gray-200 "
      }  rounded-r-full cursor-pointer`}
      onClick={onClickHandler}
    >
      <img className="h-[27px]" src={`/images/${logo}`} alt="." />
      <p className="">{text}</p>
    </div>
  );
};

export default Navlinks;
