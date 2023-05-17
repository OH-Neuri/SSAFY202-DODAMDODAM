import React, { useEffect, useState } from "react";
import OneDay from "@/components/calendar/oneDay";
import NavBar from "@/components/common/navBar";
import ArrowBackIosIcon from "@mui/icons-material/ArrowBackIos";
import ArrowForwardIosIcon from "@mui/icons-material/ArrowForwardIos";
import PageHeader from "@/components/common/pageHeader";
import {
  useDayFood,
  useManageDayFood,
  useMonthFood,
} from "@/hooks/calendarHook";
import OneFoodLine from "@/components/calendar/oneFoodLine";
import { loginCheck } from "@/api/loginCheck";
import router from "next/router";
import { toastOK } from "@/components/common/toast";

export default function index() {
  const isLogin = () => {
    if (loginCheck() == false) {
      router.push("/error");
    }
  };
  useEffect(() => {
    isLogin();
  }, []);

  const { registFood } = useManageDayFood();

  // 현재 년, 월 초기에 저장.
  let today = new Date();
  const [day, setDay] = useState({
    year: today.getFullYear(),
    month: today.getMonth() + 1,
  });
  const { data: data } = useMonthFood(day.year, day.month);
  const week = ["월", "화", "수", "목", "금"];

  // 식단 CRUD state
  const [choiceDay, setChoiceDay] = useState({
    year: day.year,
    month: day.month,
    day: today.getDate(),
  });
  const { data: todayData } = useDayFood(
    choiceDay.year,
    choiceDay.month,
    choiceDay.day
  );

  // 월이 바뀌었을 때 캘린더 변경 및 API 통신해서 다시 가져오기
  useEffect(() => {
    calendarPush();
  }, [day]);

  // Arrow 눌렀을 때 월/년 이동 -> 통신 추가
  const changeMonth = (st: boolean) => {
    // 다음 월
    if (st) {
      if (day.month == 12) {
        setDay({ year: day.year, month: day.month });
      } else {
        setDay({ year: day.year, month: day.month + 1 });
      }
    }

    // 이전 월
    else {
      if (day.month == 1) {
        setDay({ year: day.year - 1, month: 12 });
      } else {
        setDay({ year: day.year, month: day.month - 1 });
      }
    }
  };

  // 캘린더 반복문을 위한 함수
  const calendarPush = () => {
    let 어레이 = [];
    let lastDate = new Date(day.year, day.month, 0).getDate();
    let firstWeek = new Date(
      day.year.toString() + "-" + day.month.toString() + "-01"
    ).getDay();
    let x = 5; // 기본 5주
    if (lastDate === 28 && firstWeek === 1) {
      x = 4; // 4주
    } else if (
      (lastDate === 30 && firstWeek === 6) ||
      (lastDate === 31 && firstWeek >= 5)
    ) {
      x = 6; // 6주
    }
    let singleday = 1 - firstWeek;
    for (var i = 0; i < x; i++) {
      for (var j = 0; j < 7; j++) {
        어레이.push(
          <OneDay
            check={false}
            year={day.year}
            month={day.month}
            today={singleday}
            key={singleday}
            choiceDay={choiceDay}
            setChoiceDay={setChoiceDay}
            scheduleList={
              singleday > 0 &&
              singleday <= lastDate &&
              data &&
              data.dateNumber.indexOf(singleday) !== -1
                ? data.food[singleday]
                : null
            }
          ></OneDay>
        );
        singleday = singleday + 1;
      }
    }
    return 어레이;
  };

  // 식단 입력하기
  const [sendRice, setSendRice] = useState("");
  const [sendSoup, setSendSoup] = useState("");
  const [sendDish1, setSendDish1] = useState("");
  const [sendDish2, setSendDish2] = useState("");
  const [sendDish3, setSendDish3] = useState("");
  const [sendMorningSnack1, setSendMorningSnack1] = useState("");
  const [sendMorningSnack2, setSendMorningSnack2] = useState("");
  const [sendAfternoonSnack1, setSendAfternoonSnack1] = useState("");
  const [sendAfternoonSnack2, setSendAfternoonSnack2] = useState("");

  useEffect(() => {
    setSendRice(todayData && todayData.rice ? todayData.rice : "");
    setSendSoup(todayData && todayData.soup ? todayData.soup : "");
    setSendDish1(todayData && todayData.dish1 ? todayData.dish1 : "");
    setSendDish2(todayData && todayData.dish2 ? todayData.dish2 : "");
    setSendDish3(todayData && todayData.dish3 ? todayData.dish3 : "");
    setSendMorningSnack1(
      todayData && todayData.morningSnack1 ? todayData.morningSnack1 : ""
    );
    setSendMorningSnack2(
      todayData && todayData.morningSnack2 ? todayData.morningSnack2 : ""
    );
    setSendAfternoonSnack1(
      todayData && todayData.afternoonSnack1 ? todayData.afternoonSnack1 : ""
    );
    setSendAfternoonSnack2(
      todayData && todayData.afternoonSnack2 ? todayData.afternoonSnack2 : ""
    );
  }, [todayData, choiceDay]);

  return (
    <div className="grid grid-cols-7">
      <div className="fixed">
        <NavBar target="급식" />
      </div>
      <div></div>
      {/* 본문 내용 */}
      <div className="col-span-6 px-20 pt-4">
        {/* 페이지 헤더 */}
        <PageHeader name={"급식 관리"} />

        <div className="grid grid-cols-10">
          {/* 왼쪽 내용 */}
          <div className="col-span-7">
            <div className="flex justify-end items-center pr-[20px] mt-[10px]">
              <div
                className="cursor-pointer"
                onClick={() => changeMonth(false)}
              >
                <ArrowBackIosIcon />
              </div>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <div className="font-preM text-[18px]">
                {day.year}년 {day.month}월
              </div>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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

          {/* 급식 CRUD */}
          {choiceDay.day > 0 &&
          choiceDay.day <=
            new Date(choiceDay.year, choiceDay.month, 0).getDate() ? (
            <div className="col-span-3 h-[700px] flex flex-col items-center rounded shadow-lg p-10">
              {/* 타이틀 */}
              <div className="text-[25px] font-preM ">
                {choiceDay.month}/{choiceDay.day} 식단 정보
              </div>

              {/* 식단 내용 */}
              <div className="w-full h-[300px] mt-[20px]">
                <div className="text-[20px] font-preM">식사</div>
                <div className="flex">
                  <OneFoodLine
                    value={sendRice}
                    setFunc={setSendRice}
                    text="밥"
                  />
                  <OneFoodLine
                    value={sendSoup}
                    setFunc={setSendSoup}
                    text="국"
                  />
                </div>
                <div className="flex">
                  <OneFoodLine
                    value={sendDish1}
                    setFunc={setSendDish1}
                    text="반찬1"
                  />
                  <OneFoodLine
                    value={sendDish2}
                    setFunc={setSendDish2}
                    text="반찬2"
                  />
                </div>
                <div className="flex">
                  <OneFoodLine
                    value={sendDish3}
                    setFunc={setSendDish3}
                    text="반찬3"
                  />
                </div>
              </div>

              <hr className="w-full mt-[10px]" />
              <div className="w-full h-[300px] mt-[20px]">
                <div className="text-[20px] font-preM">간식</div>
                <div className="flex">
                  <OneFoodLine
                    value={sendMorningSnack1}
                    setFunc={setSendMorningSnack1}
                    text="오전 간식1"
                  />
                  <OneFoodLine
                    value={sendMorningSnack2}
                    setFunc={setSendMorningSnack2}
                    text="오전 간식2"
                  />
                </div>
                <div className="flex">
                  <OneFoodLine
                    value={sendAfternoonSnack1}
                    setFunc={setSendAfternoonSnack1}
                    text="오후 간식1"
                  />
                  <OneFoodLine
                    value={sendAfternoonSnack2}
                    setFunc={setSendAfternoonSnack2}
                    text="오후 간식2"
                  />
                </div>

                {/* 등록하기 */}
                <div className="w-full">
                  <div
                    className="flex items-center justify-center w-full h-[50px] bg-m_yellow mt-[40px] font-preM rounded"
                    onClick={() => {
                      const sendData = {
                        foodData: {
                          date: `${choiceDay.year}-${
                            choiceDay.month >= 10
                              ? choiceDay.month
                              : "0" + choiceDay.month
                          }-${
                            choiceDay.day >= 10
                              ? choiceDay.day
                              : "0" + choiceDay.day
                          }`,
                          rice: sendRice,
                          soup: sendSoup,
                          dish1: sendDish1,
                          dish2: sendDish2,
                          dish3: sendDish3,
                          morningSnack1: sendMorningSnack1,
                          morningSnack2: sendMorningSnack2,
                          afternoonSnack1: sendAfternoonSnack1,
                          afternoonSnack2: sendAfternoonSnack2,
                        },
                        year: choiceDay.year,
                        month: choiceDay.month,
                        day: choiceDay.day,
                      };
                      registFood(sendData);
                      // console.log(sendData);
                      toastOK('식단이 등록되었습니다.')
                    }}
                  >
                    저장하기
                  </div>
                </div>
              </div>
            </div>
          ) : (
            <div className="col-span-3 h-[700px] flex flex-col bg-gray-200 items-center rounded shadow-lg p-10"></div>
          )}
        </div>
      </div>
    </div>
  );
}
