import React from "react";

export default function PageHeader(props: { name: string }) {
  const { name } = props;

  return (
    <div className="flex m-10">
      <div className="flex flex-col justify-center ml-3">
        <div className="text-[20px]">소정어린이집</div>
        <div className="text-[40px] font-preB text-[#4F4F4F]">{name}</div>
      </div>
    </div>
  );
}
