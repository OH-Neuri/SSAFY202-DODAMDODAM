import React, { useEffect, useState } from "react";
import OneDay from "@/components/calendar/oneDay";
import NavBar from "@/components/common/navBar";
import {
  calendarMonthType,
  oneSceduleType,
  scheduleSendType,
} from "@/types/calendarType";
import ArrowBackIosIcon from "@mui/icons-material/ArrowBackIos";
import ArrowForwardIosIcon from "@mui/icons-material/ArrowForwardIos";
import PageHeader from "@/components/common/pageHeader";
import Button from "@mui/material/Button";
import IconButton from "@mui/material/IconButton";
import DeleteIcon from "@mui/icons-material/Delete";
import {
  useCalendarType,
  useDayCalendar,
  useManageCalendarType,
  useManageDayCalendar,
  useMonthCalendar,
} from "@/hooks/calendarHook";
import { toastError } from "@/components/common/toast";
import { Modal } from "@mui/material";
import { loginCheck } from "@/api/loginCheck";
import router from "next/router";

export default function index() {
  const isLogin = () => {
    if (loginCheck() == false) {
      router.push("/error");
    }
  };
  useEffect(() => {
    isLogin();
  }, []);

  const { registSchedule, deleteFunction } = useManageDayCalendar();

  // 현재 년, 월 초기에 저장.
  let today = new Date();
  const [day, setDay] = useState({
    year: today.getFullYear(),
    month: today.getMonth() + 1,
  });
  const { data: data } = useMonthCalendar(day.year, day.month);
  const week = ["월", "화", "수", "목", "금"];

  // 일정 CRUD state
  const [choiceDay, setChoiceDay] = useState({
    year: day.year,
    month: day.month,
    day: today.getDate(),
  });
  const { data: todayData } = useDayCalendar(
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
            check
            year={day.year}
            month={day.month}
            today={singleday}
            key={singleday}
            setChoiceDay={setChoiceDay}
            scheduleList={
              singleday > 0 &&
              singleday <= lastDate &&
              data &&
              data.dateNumber.indexOf(singleday) !== -1
                ? data.schedule[singleday]
                : null
            }
          ></OneDay>
        );
        singleday = singleday + 1;
      }
    }
    return 어레이;
  };

  // 일정 분류
  const { data: typeList } = useCalendarType();
  const { registScheduleType } = useManageCalendarType();

  // 현재 입력해놓은 일정
  const [addCal, setAddcal] = useState({
    type: -1,
    content: "",
  });

  // 일정 관리 state
  const [selectValue, setSelectValue] = useState(-1);

  // 일정 삭제 모달 관리
  const [deleteSeq, setDeleteSeq] = useState(-1);
  const [open, setOpen] = useState<boolean>(false);
  const erase = () => {
    deleteFunction({
      scheduleSeq: deleteSeq,
      year: choiceDay.year,
      month: choiceDay.month,
      day: choiceDay.day,
    });
    setOpen(false);
  };

  // 일정 분류 관리 모달 관리
  const [open2, setOpen2] = useState<boolean>(false);

  // 모달에 들어갈 일정 분류 리스트
  const [modalList, setModalList] = useState<scheduleSendType[]>(
    typeList as scheduleSendType[]
  );
  const [addModal, setAddModal] = useState("");
  useEffect(() => {
    setModalList(typeList as scheduleSendType[]);
  }, [typeList]);

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

          {/* 일정 CRUD */}
          {choiceDay.day > 0 &&
          choiceDay.day <=
            new Date(choiceDay.year, choiceDay.month, 0).getDate() ? (
            <div className="col-span-3 h-[700px] flex flex-col items-center rounded shadow-lg p-10">
              {/* 타이틀 */}
              <div className="text-[25px] font-preM ">
                {choiceDay.month}/{choiceDay.day} 일정 관리하기
              </div>

              {/* 일정 분류 수정 */}
              <div className="flex justify-end w-full mt-[15px]">
                <Button
                  variant="contained"
                  color="secondary"
                  className="font-preM text-[13px]"
                  size="small"
                  onClick={() => {
                    setOpen2(true);
                  }}
                >
                  일정 분류 수정
                </Button>
              </div>

              {/* 일정 내용 */}
              <div className="w-full h-[400px] mt-[20px] overflow-y-scroll [&::-webkit-scrollbar]:w-[10px] [&::-webkit-scrollbar-thumb]:bg-[#D5D5D5] [&::-webkit-scrollbar-thumb]:rounded-[10px] [&::-webkit-scrollbar-track]:hidden">
                {todayData &&
                  todayData.map((item: oneSceduleType, idx: number) => {
                    return (
                      <div
                        className="grid grid-cols-10 text-[16px] flex items-center rounded-lg bg-[#FFE5E4] mb-[10px] p-2"
                        key={idx}
                      >
                        {/* 행사 내용 */}
                        <div className="col-span-7 flex truncate">
                          <div className="font-preM">[{item.type}] &nbsp;</div>
                          <div className="truncate">{item.content}</div>
                        </div>

                        {/* 삭제 */}
                        <div className="col-span-3 flex justify-end">
                          <IconButton
                            color="secondary"
                            onClick={() => {
                              setOpen(true);
                              setDeleteSeq(item.scheduleSeq);
                            }}
                          >
                            <DeleteIcon />
                          </IconButton>
                        </div>
                      </div>
                    );
                  })}
              </div>

              <hr className="w-full mt-[10px]" />

              {/* 일정 추가 */}
              <div className="flex w-full justify-start mt-[20px]">
                <select
                  value={selectValue}
                  className="border-2"
                  onChange={(e) => {
                    setAddcal({
                      type: parseInt(e.target.value),
                      content: addCal.content,
                    });
                    setSelectValue(parseInt(e.target.value));
                  }}
                >
                  <option key={-1} value={-1}>
                    선택
                  </option>
                  {typeList &&
                    typeList.map((option) => (
                      <option
                        key={option.scheduleTypeSeq}
                        value={option.scheduleTypeSeq}
                      >
                        {option.content}
                      </option>
                    ))}
                </select>
              </div>

              {/* 일정 입력 부분 */}
              <div className="mt-[10px] w-full h-[40px]">
                <input
                  maxLength={10}
                  onChange={(e) =>
                    setAddcal({ type: addCal.type, content: e.target.value })
                  }
                  type="text"
                  value={addCal.content}
                  className="w-full h-full border-2 border-gray-200 rounded-xl"
                />
              </div>

              {/* 일정 추가 버튼 */}
              <div className="flex w-full justify-end mt-[10px]">
                <div
                  className="flex justify-center items-center w-[80px] h-[40px] rounded bg-pink-200 rounded-full cursor-pointer"
                  onClick={() => {
                    if (addCal.type == -1) {
                      toastError("일정 분류를 선택해주세요!");
                    } else if (addCal.content == "") {
                      toastError("일정 내용을 입력해주세요!");
                    } else if (addCal.content.length > 10) {
                      toastError("10글자 이내로 입력해주세요!");
                    } else {
                      const yyear = choiceDay.year;
                      const mmonth = choiceDay.month;
                      const dday = choiceDay.day;
                      const day = `${choiceDay.year}-${
                        choiceDay.month >= 10
                          ? choiceDay.month
                          : "0" + choiceDay.month
                      }-${
                        choiceDay.day >= 10
                          ? choiceDay.day
                          : "0" + choiceDay.day
                      }`;
                      console.log(yyear, mmonth, dday, day, addCal);
                      registSchedule({
                        scheduleTypeSeq: addCal.type,
                        content: addCal.content,
                        date: day,
                        year: yyear,
                        month: mmonth,
                        day: dday,
                      });
                      setAddcal({
                        type: -1,
                        content: "",
                      });
                      setSelectValue(-1);
                    }
                  }}
                >
                  일정 추가
                </div>
              </div>
            </div>
          ) : (
            <div className="col-span-3 h-[700px] flex flex-col bg-gray-200 items-center rounded shadow-lg p-10"></div>
          )}
        </div>
      </div>

      {/* 삭제 모달 */}
      <Modal
        className="flex justify-center items-center"
        open={open}
        onClose={() => {
          setOpen(false);
        }}
      >
        <div className="flex flex-col items-center p-10 bg-white rounded outline-none w-[500px] h-[400px]">
          <div className="font-preB text-[24px] mb-10">일정 삭제하기</div>
          <div className="flex flex-col w-full text-[18px]">
            <div>삭제된 일정은 다시 복구할 수 없습니다.</div>
            <div>정말로 삭제하시겠습니까?</div>
          </div>
          <div
            onClick={() => erase()}
            className="flex justify-center items-center w-full h-[60px] bg-m_yellow rounded text-[18px] font-preM mt-10 cursor-pointer hover:bg-h_yellow"
          >
            삭제하기
          </div>
          <div
            onClick={() => setOpen(false)}
            className="flex justify-center items-center w-full h-[60px] bg-stone-200 rounded text-[18px] font-preM mt-5 cursor-pointer hover:bg-stone-300"
          >
            취소
          </div>
        </div>
      </Modal>

      {/* 일정 분류 관리 모달 */}
      <Modal
        className="flex justify-center items-center"
        open={open2}
        onClose={() => {
          setOpen2(false);
        }}
      >
        <div className="flex flex-col items-center p-10 bg-white rounded outline-none w-[500px] h-[800px]">
          <div className="font-preB text-[24px] w-full">일정 분류 관리</div>

          <div className="flex items-center w-full h-[50px] mt-[20px]">
            <input
              type="text"
              className="w-[300px] h-[40px] bg-stone-100"
              onChange={(e) => setAddModal(e.target.value)}
              value={addModal}
              maxLength={5}
            />
            <div
              className="flex justify-center items-center w-[100px] h-[40px] bg-[#FFEAF5] ml-[20px] cursor-pointer rounded font-preM"
              onClick={() => {
                if (addModal !== "") {
                  let tmp = [...modalList];
                  tmp.push({ scheduleTypeSeq: null, content: addModal });
                  setAddModal("");
                  setModalList(tmp);
                }
              }}
            >
              추가
            </div>
          </div>

          <div className=" w-full pl-[5px] pt-[20px] h-[500px] border-2 rounded mt-[10px] mb-[20px] overflow-y-scroll [&::-webkit-scrollbar]:w-[10px] [&::-webkit-scrollbar-thumb]:bg-[#D5D5D5] [&::-webkit-scrollbar-thumb]:rounded-[10px] [&::-webkit-scrollbar-track]:hidden">
            {modalList &&
              modalList.map((item, index) => {
                return item.content !== null ? (
                  <div
                    className="grid grid-cols-10 text-[16px] flex items-center rounded-lg bg-[#FFE5E4] mb-[10px] p-2"
                    key={index}
                  >
                    {/* 일정분류 내용 */}
                    <div className="col-span-7 flex truncate">
                      <div className="truncate">{item.content}</div>
                    </div>

                    {/* 삭제 */}
                    <div className="col-span-3 flex justify-end">
                      <IconButton
                        color="secondary"
                        onClick={() => {
                          let tmp = [...modalList];
                          tmp[index].content = null;
                          setModalList(tmp);
                        }}
                      >
                        <DeleteIcon />
                      </IconButton>
                    </div>
                  </div>
                ) : null;
              })}
          </div>

          <div className="grid grid-cols-2 gap-2 w-full">
            <div
              onClick={() => setOpen2(false)}
              className="flex justify-center items-center h-[60px] bg-stone-200 rounded text-[18px] font-preM cursor-pointer hover:bg-stone-300"
            >
              취소
            </div>
            <div
              onClick={() => {
                registScheduleType(modalList);
                setOpen2(false);
              }}
              className="flex justify-center items-center h-[60px] bg-m_yellow rounded text-[18px] font-preM cursor-pointer hover:bg-h_yellow"
            >
              저장하기
            </div>
          </div>
        </div>
      </Modal>
    </div>
  );
}
