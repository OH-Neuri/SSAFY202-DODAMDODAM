import React from "react";

export default function OneDay(props: {
  today: number;
  year: number;
  month: number;
  setChoiceDay: any;
}) {
  const { today, year, month, setChoiceDay } = props;
  const lastDate = new Date(year, month, 0).getDate();

  return (
    <div onClick={() => setChoiceDay(today)} className="cursor-pointer">
      {today > 0 && today <= lastDate ? (
        <div className="border-solid border-2 border-gray-200 rounded h-[110px] m-1">
          <div className="ml-2 mt-2 font-preM text-[12px]">{today}</div>
        </div>
      ) : (
        <div className="border-solid border-2 border-gray-200 bg-gray-100 rounded h-[110px] m-1"></div>
      )}
    </div>
  );
}
