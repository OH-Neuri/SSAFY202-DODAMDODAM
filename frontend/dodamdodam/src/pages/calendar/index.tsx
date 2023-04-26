import React, { useState } from "react";
import OneDay from "@/components/calendar/oneDay";
import NavBar from "@/components/common/navBar";
import { calendarMonthType } from "@/types/calendarType";
import ArrowBackIosIcon from "@mui/icons-material/ArrowBackIos";
import ArrowForwardIosIcon from "@mui/icons-material/ArrowForwardIos";
import PageHeader from "@/components/common/pageHeader";

export default function index() {
  // 현재 년, 월 초기에 저장.
  let today = new Date();
  const [thisMonth, setThisMonth] = useState<calendarMonthType>({
    year: today.getFullYear(),
    month: today.getMonth() + 1,
    result: [], // 데이터 받아와서 해당 월의 일정관리
  });

  // 요일
  const week = ["월", "화", "수", "목", "금"];

  // 캘린더 반복문을 위한 함수
  const calendarPush = () => {
    let 어레이 = [];
    let lastDate = new Date(thisMonth.year, thisMonth.month, 0).getDate();
    let firstWeek = new Date(
      thisMonth.year.toString() + "-" + thisMonth.month.toString() + "-01"
    ).getDay();
    let x = 5; // 기본 5주
    if (lastDate === 28 && firstWeek === 1) {
      x = 4; // 4주
    } else if (
      (lastDate === 30 && firstWeek === 6) ||
      (lastDate === 31 && firstWeek > 5)
    ) {
      x = 6; // 6주
    }
    let day = 1 - firstWeek;
    for (var i = 0; i < x; i++) {
      for (var j = 0; j < 7; j++) {
        어레이.push(
          <OneDay
            year={thisMonth.year}
            month={thisMonth.month}
            today={day}
          ></OneDay>
        );
        day = day + 1;
      }
    }
    return 어레이;
  };

  return (
    <div className="grid grid-cols-7">
      <div className="fixed">
        <NavBar target="일정" />
      </div>
      <div></div>
      {/* 본문 내용 */}
      <div className="col-span-6 pl-28">
        <PageHeader name={"일정 관리"} />
        {/* Arrow */}
        <div>
          <ArrowBackIosIcon />
        </div>
        <div>
          <ArrowForwardIosIcon />
        </div>

        {/* 요일, 캘린더 */}
        <div className="grid grid-cols-7 m-10 w-[1200px]">
          <div className="flex justify-center font-preM text-[25px] text-[#FF4747]">
            일
          </div>
          {week.map((w, i) => {
            return (
              <div
                className="flex justify-center font-preM text-[25px]"
                key={i}
              >
                {w}
              </div>
            );
          })}
          <div className="flex justify-center font-preM text-[25px] text-[#5B9DFF]">
            토
          </div>
          {calendarPush()}
        </div>
      </div>
    </div>
  );
}
