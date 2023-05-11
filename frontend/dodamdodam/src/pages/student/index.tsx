import React, { useState } from "react";
import StudentCard from "@/components/student/studentCard";
import { student } from "@/types/DataTypes";
import NavBar from "@/components/common/navBar";
import Image from "next/image";
import StudentRegisterModal from "@/components/student/studentRegisterModal";
import PageHeader from "@/components/common/pageHeader";
import StudentModifyModal from "@/components/student/studentModifyModal";

export default function index() {
  const [openRe, setOpenRe] = useState<boolean>(false);
  const [openMo, setOpenMo] = useState<boolean>(false);
  const [student, setStudent] = useState<number>(1)
  const handleOpenRe = () => setOpenRe(true);
  const handleCloseRe = () => setOpenRe(false);
  const handleOpenMo = (v:number)=> {
    setStudent(v)
    setOpenMo(true)
  };
  const handleCloseMo = () => setOpenMo(false);

  const studentList: student[] = [
    {
      image: "/images/student/dog1.jpg",
      name: "여니",
      birth:"2018-04-06",
      gender: "여자",
      class: "꽃님반",
    },
    {
      image: "/images/student/squirrel.jpg",
      name: "느리스키",
      birth:"2018-04-06",
      gender: "남자",
      class: "햇살반",
    },
    {
      image: "/images/student/dog1.jpg",
      name: "줼레나",
      birth:"2018-04-06",
      gender: "여자",
      class: "나무반",
    },
    {
      image: "/images/student/squirrel.jpg",
      name: "줼레나",
      birth:"2018-04-06",
      gender: "여자",
      class: "나무반",
    },
    {
      image: "/images/student/European_otter.jpg",
      name: "줼레나",
      birth:"2018-04-06",
      gender: "여자",
      class: "나무반",
    },
    {
      image: "/images/student/squirrel.jpg",
      name: "줼레나",
      birth:"2018-04-06",
      gender: "여자",
      class: "나무반",
    },
    {
      image: "/images/student/squirrel.jpg",
      name: "줼레나",
      birth:"2018-04-06",
      gender: "여자",
      class: "나무반",
    },
    {
      image: "/images/student/European_otter.jpg",
      name: "줼레나",
      birth:"2018-04-06",
      gender: "여자",
      class: "나무반",
    },

    {
      image: "/images/student/squirrel.jpg",
      name: "줼루나",
      birth:"2018-04-06",
      gender: "여자",
      class: "나무반",
    },
  ];
  return (
    <div className=" grid grid-cols-7 h-[935px] ">
      <div className="fixed">
        <NavBar target="원생" />
      </div>
      <div className="col-span-1"></div>
      <div className="col-span-6 pl-20 pt-4">
        <PageHeader name={"원생 목록"}></PageHeader>
        
        {/* 교사 카드 */}
        <div className=" grid grid-cols-6 gap-1 w-[1500px] h-[100px] mt-[100px] ml-10">
          {studentList.map((v, i) => {
            return (
              <div key={i}>
                <div
                  onClick={() => {
                    handleOpenMo(i);
                  }}
                >
                <StudentCard key={i} student={v}></StudentCard>
                </div>
              </div>
            );
          })}
        {/* 교사 등록 카드 */}
          <div
            onClick={() => handleOpenRe()}
            className=" cursor-pointer flex justify-center items-center hover:bg-gray-200 w-[200px] h-[250px] rounded-3xl border-1 border-gray-200 bg-gray-100  "
          >
            <Image
              className="opacity-40 "
              src="/images/user/add.png"
              alt=""
              width={105}
              height={105}
            />
          </div>
          <StudentRegisterModal
            open={openRe}
            handleOpen={handleOpenRe}
            handleClose={handleCloseRe}
          ></StudentRegisterModal>
          <div className="">
            <StudentModifyModal
              open={openMo}
              student={studentList[student]}
              handleOpen={handleOpenMo}
              handleClose={handleCloseMo}
            ></StudentModifyModal>
          </div>
        </div>
      </div>
    </div>
  );
}
