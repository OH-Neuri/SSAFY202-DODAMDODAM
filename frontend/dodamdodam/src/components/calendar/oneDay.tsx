import React from "react";

export default function OneDay(props: {
  today: number;
  year: number;
  month: number;
}) {
  const { today, year, month } = props;
  const lastDate = new Date(year, month, 0).getDate();

  return (
    <div>
      {today > 0 && today <= lastDate ? (
        <div className="border-solid border-2 border-gray-200 rounded h-[130px] m-1">
          <div className="m-2 font-preM">{today}</div>
        </div>
      ) : (
        <div className="border-solid border-2 border-gray-200 bg-gray-100 rounded h-[130px] m-1"></div>
      )}
    </div>
  );
}
