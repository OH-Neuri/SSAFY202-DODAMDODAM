import RegistModal from '@/components/user/registModal'
import { Modal } from '@mui/material'
import { useRouter } from 'next/router'
import React, { useEffect, useState } from 'react'

export default function Login() {
    const [open, setOpen] = useState<boolean>(false)
    const [userName, setUserName] = useState<string>('')
    const router = useRouter()

    useEffect(()=>{
        const name = sessionStorage.getItem('name')
        if (name) setUserName(name)
    },[])

  return (
    <>
        <div className='flex justify-center items-center h-screen bg-b_yellow'>
            <div className='absolute flex justify-center top-0 left-0 w-[280px] mt-10'>
                <img onClick={()=>router.push('/')} className='cursor-pointer w-1/2' src="/images/logo.png" alt="" />
            </div>
            <div className='flex w-[1200px] h-[680px] bg-white rounded-xl'>
                <div className='flex justify-center items-center w-1/2 h-full'>
                    <img src="/images/user/kids.gif" className='w-4/5' />
                </div>
                <div className='flex flex-col items-center pt-16 px-16 w-1/2 h-full bg-m_yellow rounded-r-xl'>
                    <div className='mt-[170px] font-preSB text-[34px]'>{userName} 원장님 환영합니다</div>
                    <div className='mt-2 mb-20 font-preR text-[22px]'>유치원/어린이집을 등록해 편리하게 관리해보세요</div>
                    <div onClick={()=>setOpen(true)} className='flex justify-center items-center w-full h-[70px] bg-white/90 hover:bg-white cursor-pointer font-preM text-[20px] rounded-md'>등록하기</div>
                    
                </div>
            </div>
            <Modal className='flex justify-center items-center' open={open} onClose={()=>setOpen(false)}>
                <div className='flex justify-center items-center outline-none'>
                    <RegistModal />
                </div>
            </Modal>
        </div>
    </>
  )
}
