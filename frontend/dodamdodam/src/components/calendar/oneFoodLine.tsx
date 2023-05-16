import React from "react";

export default function OneFoodLine(props: {
  setFunc: any;
  value: string;
  text: string;
}) {
  const { setFunc, value, text } = props;

  return (
    <div>
      <div className="mt-[10px]">{text}</div>
      <input
        maxLength={10}
        type="text"
        onChange={(e) => setFunc(e.target.value)}
        value={value}
        className="w-[170px] h-[40px] bg-[#F5F5F5] text-[16px] mr-[20px]"
      />
    </div>
  );
}
