import React from 'react'
import { useState,useEffect } from 'react'
import { teacher } from '@/types/DataTypes';
import Image from 'next/image';
export default function teacherCard(props: { teacher: teacher }){
    const [group, setGroup] = useState<string>(props.teacher.class);

    useEffect(() => {
        setGroup(props.teacher.class)
     },[])
  return (
    <div  className=' cursor-pointer shadow-lg flex flex-col items-center mb-[35px] w-[200px] h-[250px] bg-[#FFE5E4] text-[30px] rounded-3xl'>
          <Image className='mt-[25px] rounded-full w-[90px] h-[90px]  object-cover'
              src={ group == "햇살반" ? "/images/teacher/sun.png" :
                    group == "꽃님반" ? "/images/teacher/flower.png" : 
                    group == "새싹반" ? "/images/teacher/plant.png" : 
                    "/images/teacher/cloud.png" 
                }
              alt='' width={70} height={70} ></Image>
      {/* <div className='mt-[35px] rounded-full overflow-hidden h-[85px] w-[85px]'>
        <img className='w-full h-full object-none' src={props.student.Image} alt=''></img>
      </div>     */}
      <div className='mt-[13px] flex items-center font-preSB text-[20px]'>
        {props.teacher.name}
        <div className='flex justify-end items-end text-[15px] pl-[5px]'>
          <div className='pr-[5px]'>
            {props.teacher.age}세 |
          </div>
          <div>
            {props.teacher.gender == "여자" ? '여자' : '남자'}
          </div>
        </div>
      </div>
      <div className='items-center justify-center text-white text-[18px] font-preR mt-[20px] w-[83px] h-[37px] bg-[#FF7070] flex rounded-full overflow-hidden'>
            {props.teacher.class}
        </div>
    </div>
  )
}
