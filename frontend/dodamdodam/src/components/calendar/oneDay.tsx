import { oneFoodType, oneSceduleType } from "@/types/calendarType";
import React from "react";

export default function OneDay(props: {
  today: number;
  year: number;
  month: number;
  setChoiceDay: any;
  scheduleList: oneSceduleType[] | oneFoodType | null;
  check: boolean;
}) {
  const { today, year, month, setChoiceDay, scheduleList, check } = props;
  const lastDate = new Date(year, month, 0).getDate();

  return (
    <div
      onClick={() => {
        setChoiceDay({ year: year, month: month, day: today });
      }}
      className="cursor-pointer"
    >
      {today > 0 && today <= lastDate ? (
        <div className="border-solid border-2 border-gray-200 rounded h-[110px] m-1 overflow-hidden">
          <div className="ml-2 mt-2 font-preM text-[12px]">{today}</div>
          {check && scheduleList ? (
            <div className="bg-b_yellow h-[20px] w-full"></div>
          ) : null}
          {!check && scheduleList ? (
            <div className="bg-[#DCEEFF] h-[20px] w-full"></div>
          ) : null}
        </div>
      ) : (
        <div className="border-solid border-2 border-gray-200 bg-gray-100 rounded h-[110px] m-1"></div>
      )}
    </div>
  );
}
