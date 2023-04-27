import { oneSceduleType } from "@/types/calendarType";
import React from "react";

export default function OneDay(props: {
  today: number;
  year: number;
  month: number;
  setChoiceDay: any;
  scheduleList: oneSceduleType[] | null;
}) {
  const { today, year, month, setChoiceDay, scheduleList } = props;
  const lastDate = new Date(year, month, 0).getDate();

  return (
    <div onClick={() => setChoiceDay(today, month)} className="cursor-pointer">
      {today > 0 && today <= lastDate ? (
        <div className="border-solid border-2 border-gray-200 rounded h-[110px] m-1 overflow-hidden">
          <div className="ml-2 mt-2 font-preM text-[12px]">{today}</div>
          {scheduleList
            ? scheduleList.map((item, idx) => {
                return (
                  <div className="flex ml-2 text-[14px] truncate" key={idx}>
                    <div className="font-preM">[{item.type}]</div>
                    &nbsp;
                    <div className="truncate">{item.content}</div>
                  </div>
                );
              })
            : null}
        </div>
      ) : (
        <div className="border-solid border-2 border-gray-200 bg-gray-100 rounded h-[110px] m-1"></div>
      )}
    </div>
  );
}
