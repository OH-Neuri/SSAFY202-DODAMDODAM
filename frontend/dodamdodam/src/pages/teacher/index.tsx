import React, { useState} from "react";
import Image from "next/image";
import TeacherCard from "@/components/teacher/teacherCard";
import { teacher } from "@/types/DataTypes";
import NavBar from "@/components/common/navBar";
import PageHeader from "@/components/common/pageHeader";
import TeacherRegisterModal from "@/components/teacher/teacherRegisterModal";
import TeacherModifyModal from "@/components/teacher/teacherModifyModal";
export default function index() {

  const teacherList: teacher[] = [
    {
      name: "여니",
      class: "꽃님반",
    },
    {
      name: "쒸스키",
      class: "햇살반",
    },
    {
      name: "젼스킈",
      class: "새싹반",
    },
    {
      name: "나현스킈",
      class: "햇살반",
    },
    {
      name: "줼레나",
      class: "구름반",
    },
    {
      name: "줼레나",
      class: "꽃님반",
    },
  ];

  return (
    <div className=" grid grid-cols-7 h-[935px] ">
      <div className="fixed">
        <NavBar target="교사" />
      </div>
      <div className="col-span-1"></div>
      <div className="col-span-6 pl-20 pt-4">
        <PageHeader name={"교사 목록"}></PageHeader>
        
        {/* 교사 카드 */}
        <div className=" grid grid-cols-6 gap-1 w-[1500px] h-[100px] mt-[100px] ml-10">
          {teacherList.map((v, i) => {
            return (
                <TeacherCard key={i} teacher={v}></TeacherCard>
            );
          })}
        </div>
      </div>
    </div>
  );
}
