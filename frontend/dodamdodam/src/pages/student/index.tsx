import React from 'react'
import Divider from '@mui/material/Divider';
import UserCard from '@/components/user/userCard';
import { student } from '@/types/DataTypes';
import NavBar from '@/components/common/navBar';
import Image from 'next/image';
import StudentRegisterModal from '@/components/student/studentRegisterModal';

export default function index() {
    const [open, setOpen] = React.useState(false);
    const handleOpen = () => setOpen(true);
    const handleClose = () => setOpen(false);

    const studentList:student []= [
        {
            image:"/images/student/dog1.jpg",
            name: "여니",
            age: 5,
            gender: "w",
            class: "꽃님반"
        },
        {
            image:"/images/student/squirrel.jpg",
            name: "느리스키",
            age: 6,
            gender: "m",
            class: "햇살반"
        },
        {
            image:"/images/student/dog1.jpg",
            name: "줼레나",
            age: 5,
            gender: "w",
            class: "나무반"
        },
        {
            image:"/images/student/squirrel.jpg",
            name: "줼레나",
            age: 5,
            gender: "w",
            class: "나무반"
        },
        {
            image:"/images/student/European_otter.jpg",
            name: "줼레나",
            age: 5,
            gender: "w",
            class: "나무반"
        },
        {
            image:"/images/student/squirrel.jpg",
            name: "줼레나",
            age: 5,
            gender: "w",
            class: "나무반"
        },
        {
            image:"/images/student/squirrel.jpg",
            name: "줼레나",
            age: 5,
            gender: "w",
            class: "나무반"
        },
        {
            image:"/images/student/European_otter.jpg",
            name: "줼레나",
            age: 5,
            gender: "w",
            class: "나무반"
        },

        {
            image:"/images/student/squirrel.jpg",
            name: "줼레나",
            age: 5,
            gender: "w",
            class: "나무반"
        },
    ]
    return (
        <div className=' grid grid-cols-7 h-[935px] '>
        <div className='fixed'>
            <NavBar target='원생' />
        </div>
        <div className='col-span-1'>
        </div>
        <div className='col-span-6 pl-28'>
            <div className=' absolute mt-[100px]  w-[680px] h-[120px]'>
                <div className=' font-preM text-[30px] text-[#4F4F4F]'>
                    소정 어린이집
                </div>
                <div className='mt-[-4px] font-preBl text-[55px] text-[#494949]'>
                    원생 목록
                </div>
            </div>
            <div className='absolute overflow-hidden w-[1580px] h-[10px] mt-[270px] ml-[-85px]'>
                <Divider variant="middle" />
            </div>
            <div className=' grid grid-cols-6 gap-1 w-[1500px] h-[100px] mt-[315px]'>
                {studentList.map((v, i) => { 
                    return (
                        <div>
                        <UserCard key={i} student={v}></UserCard>
                        </div>
                    )
                })}
                
                <div onClick={()=>handleOpen()} className=' cursor-pointer flex justify-center items-center hover:bg-gray-200 w-[200px] h-[250px] rounded-3xl border-2 border-gray-200 bg-gray-100  '>
                    <Image className='opacity-40 ' src="/images/user/add.png" alt="" width={105} height={105} />
                </div>
                    <StudentRegisterModal open={open} handleOpen={handleOpen} handleClose={handleClose}></StudentRegisterModal>
                    
            </div>
        </div>
     </div>
  )
}
