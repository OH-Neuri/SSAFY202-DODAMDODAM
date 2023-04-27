import React, { useEffect, useState } from "react";
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

  // 월이 바뀌었을 때 캘린더 변경
  useEffect(() => {
    calendarPush();
  }, [thisMonth]);

  // Arrow 눌렀을 때 월/년 이동
  const changeMonth = (st: boolean) => {
    // 다음 월
    if (st) {
      if (thisMonth.month == 12) {
        setThisMonth({
          year: thisMonth.year + 1,
          month: 1,
          result: [],
        });
      } else {
        setThisMonth({
          year: thisMonth.year,
          month: thisMonth.month + 1,
          result: [],
        });
      }
    }

    // 이전 월
    else {
      if (thisMonth.month == 1) {
        setThisMonth({
          year: thisMonth.year - 1,
          month: 12,
          result: [],
        });
      } else {
        setThisMonth({
          year: thisMonth.year,
          month: thisMonth.month - 1,
          result: [],
        });
      }
    }
  };

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
            key={day}
            setChoiceDay={setChoiceDay}
          ></OneDay>
        );
        day = day + 1;
      }
    }
    return 어레이;
  };

  // 일정 CRUD state
  const [choiceDay, setChoiceDay] = useState<number>(0);

  return (
    <div className="grid grid-cols-7">
      <div className="fixed">
        <NavBar target="일정" />
      </div>
      <div></div>
      {/* 본문 내용 */}
      <div className="col-span-6 pl-20 pt-4">
        {/* 페이지 헤더 */}
        <PageHeader name={"일정 관리"} />

        <div className="grid grid-cols-10">
          {/* 왼쪽 내용 */}
          <div className="col-span-7">
            <div className="flex justify-end items-center pr-[20px]">
              <div className="font-preM text-[20px]">
                {thisMonth.year}년 {thisMonth.month}월
              </div>
              {/* Arrow */}
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <div
                className="cursor-pointer"
                onClick={() => changeMonth(false)}
              >
                <ArrowBackIosIcon />
              </div>
              &nbsp;&nbsp;&nbsp;&nbsp;
              <div className="cursor-pointer" onClick={() => changeMonth(true)}>
                <ArrowForwardIosIcon />
              </div>
            </div>

            {/* 요일, 캘린더 */}
            <div className="grid grid-cols-7 m-3">
              <div className="flex justify-center font-preM text-[16px] text-[#FF4747]">
                일
              </div>
              {week.map((w, i) => {
                return (
                  <div
                    className="flex justify-center font-preM text-[16px]"
                    key={i}
                  >
                    {w}
                  </div>
                );
              })}
              <div className="flex justify-center font-preM text-[16px] text-[#5B9DFF]">
                토
              </div>
              {calendarPush()}
            </div>
          </div>

          <div className="col-span-3 h-[700px] flex flex-col items-center rounded shadow-lg p-10 mr-10 mb-10">
            {choiceDay > 0 &&
            choiceDay <=
              new Date(thisMonth.year, thisMonth.month, 0).getDate() ? (
              <div>{choiceDay}일 일정 관리하기</div>
            ) : null}
          </div>
        </div>
      </div>
    </div>
  );
}
