import React from "react";
import { useState, useEffect } from "react";
import { teacherList } from "@/types/DataTypes";
import Image from "next/image";


export default function teacherCard(props: { teacher: teacherList }) {


  const { teacher } = props;
  const [group, setGroup] = useState<string>("");
  const [name, setName] = useState<string>("");
  const [teacherSeq, setTeacherSeq] = useState<number>(0);

  useEffect(() => {
    setGroup(props.teacher.className);
    setName(props.teacher.teacherName);
    setTeacherSeq(props.teacher.teacherSeq);
  }, []);



  return (
    <div className="cursor-pointer shadow-lg flex flex-col items-center mb-[35px] w-[200px] h-[250px] bg-[#FFE5E4] text-[30px] rounded-3xl">
      {/* 반 사진 */}
      <Image
        className="mt-[29px]  w-[85px] h-[85px]  object-cover"
        src={
          teacherSeq % 5 == 0 ?
            '/images/teacher/class/class_1.png' :
            teacherSeq % 5 == 2 ?
              '/images/teacher/class/class_2.png' :
              teacherSeq % 5 == 4 ?
                '/images/teacher/class/class_3.png' :
                teacherSeq % 5 == 6 ?
                '/images/teacher/class/class_4.png' :
                  '/images/teacher/class/class_5.png' 
        }
        alt=""
        width={100}
        height={100}
      ></Image>

      <div className="mt-[13px] flex items-center font-preSB text-[20px]">
        {name}
        <div className="mt-[2px] flex ml-[5px] text-[15px] font-preL">
          교사
        </div>
        <div className="flex justify-end items-end text-[15px] pl-[5px]">
        </div>
      </div>
      <div className="items-center justify-center text-white text-[18px] font-preR mt-[20px] w-[83px] h-[37px] bg-[#FF7070] flex rounded-full overflow-hidden">
        {group}
      </div>
    </div>
  );
}
