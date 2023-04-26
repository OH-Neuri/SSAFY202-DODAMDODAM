import React from "react";
import Divider from "@mui/material/Divider";
import UserCard from "@/components/user/userCard";
import { student } from "@/types/DataTypes";
import NavBar from "@/components/common/navBar";
import Image from "next/image";
import StudentRegisterModal from "@/components/student/studentRegisterModal";
import PageHeader from "@/components/common/pageHeader";
import StudentModifyModal from "@/components/student/studentModifyModal";

export default function index() {
  const [openRi, setOpenRi] = React.useState(false);
  const [openMo, setOpenMo] = React.useState(false);

  const handleOpenRi = () => setOpenRi(true);
  const handleCloseRi = () => setOpenRi(false);
  const handleOpenMo = () => setOpenMo(true);
  const handleCloseMo = () => setOpenMo(false);

  const studentList: student[] = [
    {
      image: "/images/student/dog1.jpg",
      name: "여니",
      age: 5,
      gender: "w",
      class: "꽃님반",
    },
    {
      image: "/images/student/squirrel.jpg",
      name: "느리스키",
      age: 6,
      gender: "m",
      class: "햇살반",
    },
    {
      image: "/images/student/dog1.jpg",
      name: "줼레나",
      age: 5,
      gender: "w",
      class: "나무반",
    },
    {
      image: "/images/student/squirrel.jpg",
      name: "줼레나",
      age: 5,
      gender: "w",
      class: "나무반",
    },
    {
      image: "/images/student/European_otter.jpg",
      name: "줼레나",
      age: 5,
      gender: "w",
      class: "나무반",
    },
    {
      image: "/images/student/squirrel.jpg",
      name: "줼레나",
      age: 5,
      gender: "w",
      class: "나무반",
    },
    {
      image: "/images/student/squirrel.jpg",
      name: "줼레나",
      age: 5,
      gender: "w",
      class: "나무반",
    },
    {
      image: "/images/student/European_otter.jpg",
      name: "줼레나",
      age: 5,
      gender: "w",
      class: "나무반",
    },

    {
      image: "/images/student/squirrel.jpg",
      name: "줼레나",
      age: 5,
      gender: "w",
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
        <PageHeader name={"원생목록"}></PageHeader>
        <div className="absolute overflow-hidden w-[1580px] h-[10px] mt-[10px] ml-[-53111px]">
          <Divider variant="middle" />
        </div>
        <div className=" grid grid-cols-6 gap-1 w-[1500px] h-[100px] mt-[100px] ml-20">
          {studentList.map((v, i) => {
            return (
              <div
                onClick={() => {
                  handleOpenMo();
                }}
              >
                <UserCard key={i} student={v}></UserCard>
                <div className="">
                  <StudentModifyModal
                    key={i}
                    student={v}
                    open={openMo}
                    handleOpen={handleOpenMo}
                    handleClose={handleCloseMo}
                  ></StudentModifyModal>
                </div>
              </div>
            );
          })}

          <div
            onClick={() => handleOpenRi()}
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
            open={openRi}
            handleOpen={handleOpenRi}
            handleClose={handleCloseRi}
          ></StudentRegisterModal>
        </div>
      </div>
    </div>
  );
}
