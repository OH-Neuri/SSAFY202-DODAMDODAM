import React from "react";
import OneDay from "@/components/calendar/oneDay";

export default function index() {
  return (
    <div className="grid grid-cols-7">
      <div className="bg-blue-100">네브바 자리</div>
      {/* 본문 내용 */}
      <div className="col-span-6">
        {/* 큰 타이틀 */}
        <div className="flex m-10">
          <div className="font-preB text-[54px] text-[#DDDDDD]">2023</div>
          <div className="flex flex-col justify-center ml-3">
            <div>소정 어린이집</div>
            <div className="font-preB text-[28px]">4월 일정</div>
          </div>
        </div>
        <div className="m-10">
          <OneDay></OneDay>
        </div>
      </div>
    </div>
  );
}
