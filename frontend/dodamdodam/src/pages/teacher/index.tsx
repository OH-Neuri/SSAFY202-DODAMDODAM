import React, { useState, useEffect } from "react";
import Image from "next/image";
import TeacherCard from "@/components/teacher/teacherCard";
import { teacher, teacherList } from "@/types/DataTypes";
import NavBar from "@/components/common/navBar";
import PageHeader from "@/components/common/pageHeader";
import TeacherRegisterModal from "@/components/teacher/teacherRegisterModal";
import TeacherModifyModal from "@/components/teacher/teacherModifyModal";
import axios from "axios";
export default function index() {
  const [teacherList, setTeacherList] = useState<teacherList[]>([]);


 // 선생님 리스트 불러오기
  async function getTeacherList() { 
    try {
      const response = await axios.get(
        `https://dodamdodam.site/api/dodam/kindergarten/teacher`
      );
      setTeacherList(response.data.result);
    } catch (error) { 
      console.log("선생님 리스트 불러오기 에러 발생")
    }
  }


  
  useEffect(() => { 
    getTeacherList();
  },[])


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
