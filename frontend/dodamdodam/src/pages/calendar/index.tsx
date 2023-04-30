import React, { useEffect, useState } from "react";
import OneDay from "@/components/calendar/oneDay";
import NavBar from "@/components/common/navBar";
import { calendarMonthType, classificationType } from "@/types/calendarType";
import PageHeader from "@/components/common/pageHeader";
import { Button, IconButton, TextField, MenuItem } from "@mui/material";
import DeleteIcon from "@mui/icons-material/Delete";
import ArrowBackIosIcon from "@mui/icons-material/ArrowBackIos";
import ArrowForwardIosIcon from "@mui/icons-material/ArrowForwardIos";
import CalendarTypeModal from "@/components/calendar/calendarTypeModal";

export default function index() {
  // 모달
  const [open, setOpen] = useState<boolean>(false);

  // 현재 년, 월 초기에 저장.
  let today = new Date();
  const [thisMonth, setThisMonth] = useState<calendarMonthType>({
    year: today.getFullYear(),
    month: today.getMonth() + 1,
    dateNumber: [1, 2],
    schedule: {
      "1": [
        {
          type: "룰루랄라 행사",
          content: "소풍 가는 날 홀룰루룰ㄹ로로로로롤",
        },
        {
          type: "휴일2",
          content: "소풍 가는 날",
        },
        {
          type: "휴일3",
          content: "소풍 가는 날",
        },
        {
          type: "휴일3",
          content: "소풍 가는 날",
        },
        {
          type: "휴일3",
          content: "소풍 가는 날",
        },
        {
          type: "휴일3",
          content: "소풍 가는 날",
        },
        {
          type: "휴일3",
          content: "소풍 가는 날",
        },
        {
          type: "휴일3",
          content: "소풍 가는 날",
        },
        {
          type: "휴일3",
          content: "소풍 가는 날",
        },
        {
          type: "휴일3",
          content: "소풍 가는 날",
        },
        {
          type: "휴일3",
          content: "소풍 가는 날",
        },
        {
          type: "휴일3",
          content: "소풍 가는 날",
        },
        {
          type: "휴일3",
          content: "소풍 가는 날",
        },
        {
          type: "휴일3",
          content: "소풍 가는 날",
        },
        {
          type: "휴일3",
          content: "소풍 가는 날",
        },
        {
          type: "휴일3",
          content: "소풍 가는 날",
        },
        {
          type: "휴일3",
          content: "소풍 가는 날",
        },
        {
          type: "휴일3",
          content: "소풍 가는 날",
        },
        {
          type: "휴일3",
          content: "소풍 가는 날",
        },
        {
          type: "휴일3",
          content: "소풍 가는 날",
        },
        {
          type: "휴일3",
          content: "소풍 가는 날",
        },
        {
          type: "휴일3",
          content: "소풍 가는 날",
        },
        {
          type: "휴일3",
          content: "소풍 가는 날",
        },
        {
          type: "휴일3",
          content: "소풍 가는 날",
        },
      ],
      "2": [
        {
          type: "2번째 행사",
          content: "랄랄랄랄루",
        },
      ],
    },
  });

  // 요일
  const week = ["월", "화", "수", "목", "금"];

  // 월이 바뀌었을 때 캘린더 변경 및 API 통신해서 다시 가져오기
  useEffect(() => {
    calendarPush();
  }, [thisMonth]);

  // Arrow 눌렀을 때 월/년 이동 -> 통신 추가
  const changeMonth = (st: boolean) => {
    // 다음 월
    if (st) {
      if (thisMonth.month == 12) {
        setThisMonth({
          year: thisMonth.year + 1,
          month: 1,
          dateNumber: [],
          schedule: {},
        });
      } else {
        setThisMonth({
          year: thisMonth.year,
          month: thisMonth.month + 1,
          dateNumber: [],
          schedule: {},
        });
      }
    }

    // 이전 월
    else {
      if (thisMonth.month == 1) {
        setThisMonth({
          year: thisMonth.year - 1,
          month: 12,
          dateNumber: [],
          schedule: {},
        });
      } else {
        setThisMonth({
          year: thisMonth.year,
          month: thisMonth.month - 1,
          dateNumber: [],
          schedule: {},
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
      (lastDate === 31 && firstWeek >= 5)
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
            setChoiceDay={setCRUD}
            scheduleList={
              day > 0 &&
              day <= lastDate &&
              thisMonth.dateNumber.indexOf(day) !== -1
                ? thisMonth.schedule[day]
                : null
            }
          ></OneDay>
        );
        day = day + 1;
      }
    }
    return 어레이;
  };

  // 일정 CRUD state
  const [choiceDay, setChoiceDay] = useState<number>(0);
  const [choiceMonth, setChoiceMonth] = useState<number>(0);
  const setCRUD = (day: number, month: number) => {
    setChoiceDay(day);
    setChoiceMonth(month);
  };

  // 일정 추가
  const [addType, setAddType] = useState<string>("");
  const [addContent, setaddContent] = useState<string>("");
  const typeList: classificationType[] = [
    {
      scheduleTypeSeq: 0,
      content: "행사",
    },
    {
      scheduleTypeSeq: 1,
      content: "미술",
    },
    {
      scheduleTypeSeq: 2,
      content: "룰루랄랄랄ㄹ랄ㄹ랄ㄹ라",
    },
  ];

  return (
    <div className="grid grid-cols-7">
      <div className="fixed">
        <NavBar target="일정" />
      </div>
      <div></div>
      {/* 본문 내용 */}
      <div className="col-span-6 px-20 pt-4">
        {/* 페이지 헤더 */}
        <PageHeader name={"일정 관리"} />

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
                {thisMonth.year}년 {thisMonth.month}월
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

          {/* 일정 CRUD */}
          {choiceDay > 0 &&
          choiceDay <=
            new Date(thisMonth.year, thisMonth.month, 0).getDate() ? (
            <div className="col-span-3 h-[700px] flex flex-col items-center rounded shadow-lg p-10">
              {/* 타이틀 */}
              <div className="text-[25px] font-preM ">
                {choiceMonth}/{choiceDay} 일정 관리하기
              </div>

              {/* 일정 분류 수정 */}
              <div className="flex justify-end w-full mt-[15px]">
                <Button
                  variant="contained"
                  color="secondary"
                  className="font-preM text-[13px]"
                  size="small"
                  onClick={() => setOpen(true)}
                >
                  일정 분류 수정
                </Button>
              </div>

              <hr className="w-full mt-[10px]" />

              {/* 일정 추가 */}
              <div className="flex mt-[10px] w-full">
                <TextField
                  size="small"
                  id="outlined-select-currency"
                  select
                  defaultValue="분류 선택"
                >
                  {typeList.map((option, idx) => (
                    <MenuItem
                      className="font-preL text-[13px]"
                      key={idx}
                      value={option.scheduleTypeSeq}
                    >
                      {option.content}
                    </MenuItem>
                  ))}
                </TextField>
                <TextField
                  size="small"
                  id="outlined-basic"
                  label="새로운 일정 추가"
                  variant="outlined"
                />
              </div>

              {/* 일정 내용 */}
              <div className="w-full h-full mt-[20px] overflow-y-scroll [&::-webkit-scrollbar]:w-[10px] [&::-webkit-scrollbar-thumb]:bg-[#D5D5D5] [&::-webkit-scrollbar-thumb]:rounded-[10px] [&::-webkit-scrollbar-track]:hidden">
                {thisMonth.dateNumber.indexOf(choiceDay) !== -1 &&
                  thisMonth.schedule[choiceDay].map((item, idx) => {
                    return (
                      <div
                        className="grid grid-cols-10 text-[16px] flex items-center rounded-lg bg-blue-100 mb-[10px] p-2"
                        key={idx}
                      >
                        {/* 행사 내용 */}
                        <div className="col-span-7 flex truncate">
                          <div className="font-preM">[{item.type}] &nbsp;</div>
                          <div className="truncate">{item.content}</div>
                        </div>

                        {/* 삭제 */}
                        <div className="col-span-3 flex justify-end">
                          <IconButton color="secondary">
                            <DeleteIcon />
                          </IconButton>
                        </div>
                      </div>
                    );
                  })}
              </div>
            </div>
          ) : (
            <div className="col-span-3 h-[700px] flex flex-col bg-gray-200 items-center rounded shadow-lg p-10"></div>
          )}
        </div>
      </div>

      {/* 모달 */}
      <CalendarTypeModal
        open={open}
        handleClose={() => setOpen(false)}
        typeList={typeList}
      ></CalendarTypeModal>
    </div>
  );
}
