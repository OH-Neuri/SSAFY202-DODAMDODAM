import NavBar from '@/components/common/navBar'
import PageHeader from '@/components/common/pageHeader'
import RegistModal from '@/components/user/registModal'
import { kindergartenType } from '@/types/DataTypes'
import { Modal } from '@mui/material'
import React, { useState } from 'react'

export default function Mypage() {
    const [open, setOpen] = useState<boolean>(false)
    const [kinder, setKinder] = useState<kindergartenType | null>(
        {
            name: '소정어린이집',
            address: '테헤란로34 802호',
            phone_number: '010-7000-2222'
        }
    )

  return (
    <div className='grid grid-cols-7'>
        <div className='fixed'>
            <NavBar target='마이페이지' />
        </div>
        <div></div>
        <div className='col-span-6 px-20'>
            <div className='pt-4'>
                <PageHeader name='유치원/어린이집 관리' />
            </div>
            {
            !kinder ?
            <div className='flex flex-col justify-center items-center h-[560px]'>
                <div className='text-[20px] mb-5'>등록된 유치원/어린이집이 없습니다.</div>
                <div onClick={()=>setOpen(true)} className='w-[300px] h-[50px] flex justify-center items-center text-[18px] font-preM bg-stone-200/50 hover:bg-stone-200 cursor-pointer rounded'>등록하기</div>
            </div>
            :
            <div className='flex flex-col ml-12 mt-12'>
                <div className='font-preSB text-[32px]'>{kinder.name}</div>
                <div className='font-preR text-[24px]'>{kinder.address}</div>
                <div className='text-[20px]'>{kinder.phone_number}</div>
            </div>
            }
        </div>
        <Modal className='flex justify-center items-center' open={open} onClose={()=>setOpen(false)}>
            <div className='flex justify-center items-center outline-none'>
                <RegistModal />
            </div>
        </Modal>
    </div>
  )
}
