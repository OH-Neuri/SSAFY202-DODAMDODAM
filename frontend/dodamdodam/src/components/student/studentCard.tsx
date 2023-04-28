import React from 'react'
import { useState } from 'react'
import { student } from '@/types/DataTypes';
import Divider from '@mui/material/Divider';
import Image from 'next/image';
export default function StudentCard(props: { student: student})
{
  return (
    <div  className='hover:bg-[#F3C1BF] cursor-pointer shadow-lg flex flex-col items-center mb-[35px] w-[200px] h-[250px] bg-[#FFE5E4] text-[30px] rounded-3xl'>
      <Image className='mt-[35px] rounded-full w-[80px] h-[80px]  object-none' src={props.student.image} alt='' width={100} height={65} ></Image>
      {/* <div className='mt-[35px] rounded-full overflow-hidden h-[85px] w-[85px]'>
        <img className='w-full h-full object-none' src={props.student.Image} alt=''></img>
      </div>     */}
      <div className='mt-[13px] flex items-center font-preSB text-[20px]'>
        {props.student.name}
        <div className='flex justify-end items-end text-[15px] pl-[5px]'>
          <div className='pr-[5px]'>
            {2023-(+props.student.birth.split("-")[0])}세 |
          </div>
          <div>
            {props.student.gender == "여자" ? '여자' : '남자'}
          </div>
        </div>
      </div>
      <div className='items-center justify-center text-white text-[18px] font-preR mt-[20px] w-[83px] h-[37px] bg-[#FF7070] flex rounded-full overflow-hidden'>
            {props.student.class}
        </div>
    </div>
  )
}
