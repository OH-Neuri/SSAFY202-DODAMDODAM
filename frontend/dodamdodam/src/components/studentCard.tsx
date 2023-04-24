import React from 'react'
import { useState } from 'react'
import { student } from '@/types/DataTypes';
import Divider from '@mui/material/Divider';

export default function StudentCard(props: { student: student})
{
  return (
    <div className='hover:bg-[#F3C1BF] cursor-pointer shadow-lg flex flex-col items-center mb-[25px] w-[310px] h-[330px] bg-[#FFE5E4] text-[30px] rounded-3xl'>
      <div className='mt-[45px] rounded-full overflow-hidden h-[115px] w-[115px]'>
        <img className='w-full h-full object-none' src={props.student.Image} alt=''></img>
      </div>    
      <div className='mt-[17px] flex items-center font-preSB text-[28px]'>
        {props.student.name}
        <div className='flex justify-end items-end text-[20px] pl-[5px]'>
          <div className='pr-[5px]'>
            {props.student.age}세 |
          </div>
          <div>
            {props.student.gender == "w" ? '여자' : '남자'}
          </div>
        </div>
      </div>
      <div className='items-center justify-center text-white text-[21px] font-preR mt-[23px] w-[100px] h-[47px] bg-[#FF7070] flex rounded-full overflow-hidden'>
            {props.student.class}
        </div>
    </div>
  )
}
