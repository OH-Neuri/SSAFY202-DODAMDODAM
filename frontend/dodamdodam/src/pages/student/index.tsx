import React, { useEffect, useState } from "react";
import StudentCard from "@/components/student/studentCard";
import { student } from "@/types/DataTypes";
import NavBar from "@/components/common/navBar";
import Image from "next/image";
import StudentRegisterModal from "@/components/student/studentRegisterModal";
import PageHeader from "@/components/common/pageHeader";
import StudentModifyModal from "@/components/student/studentModifyModal";
import axios from "axios";
import { authAxios } from "@/api/common";
import { loginCheck } from "@/api/loginCheck";
import router from "next/router";

export default function index() {
  // 로그인 확인
  const isLogin = () => {
    if (loginCheck() == false) {
      router.push("/error");
    }
  };
  useEffect(() => {
    isLogin();
  }, []);

  const [openRe, setOpenRe] = useState<boolean>(false);
  const [openMo, setOpenMo] = useState<boolean>(false);
  const [studentIdx, setStudentIdx] = useState<number>(-1);
  const [studentList, setStudentList] = useState<student[] | any>([]);

  // 아이 등록 모달 컨트롤 함수 +Re
  const handleOpenRe = () => setOpenRe(true);
  const handleCloseRe = () => setOpenRe(false);

  // 아이 수정 모달 컨트롤 함수 +Mo
  const handleOpenMo = (v: number) => {
    setStudentIdx(v);
    setOpenMo(true);
  };
  const handleCloseMo = () => setOpenMo(false);

  // 원생 리스트 가져오기
  async function fetchStudentList() {
    try {
      const response = await authAxios.get(
        `https://dodamdodam.site/api/dodam/kindergarten/kid`
      );
      setStudentList(response.data.result);
    } catch (error) {
    }
  }

  useEffect(() => {
    fetchStudentList();
  }, [studentIdx]);

  return (
    <div className=" grid grid-cols-7 h-[935px] ">
      <div className="fixed">
        <NavBar target="원생" />
      </div>
      <div className="col-span-1"></div>
      <div className="col-span-6 pl-20 pt-4">
        <PageHeader name={"원생 목록"}></PageHeader>
        <div className=" grid grid-cols-6 gap-1 w-[1500px] h-[100px] mt-[100px] ml-10">
          {studentList.map((v: any, i: any) => {
            return (
              <div key={i}>
                <div
                  onClick={() => {
                    handleOpenMo(v.kidSeq);
                  }}
                >
                  <StudentCard key={i} student={v} />
                </div>
              </div>
            );
          })}
          <div
            onClick={() => handleOpenRe()}
            className=" cursor-pointer flex justify-center items-center hover:bg-gray-200 w-[200px] h-[250px] rounded-3xl border-1 border-gray-200 bg-gray-100  "
          >
            <Image
              className="opacity-40"
              src="/images/user/add.png"
              alt="Register Image"
              width={105}
              height={105}
            />
          </div>
          <StudentRegisterModal
            open={openRe}
            handleOpen={handleOpenRe}
            handleClose={handleCloseRe}
          ></StudentRegisterModal>
          <div>
            <StudentModifyModal
              idx={studentIdx}
              open={openMo}
              handleOpen={handleOpenMo}
              handleClose={handleCloseMo}
            ></StudentModifyModal>
          </div>
        </div>
      </div>
    </div>
  );
}
