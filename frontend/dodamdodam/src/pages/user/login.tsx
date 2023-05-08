import { useRouter } from 'next/router'
import React, { useState } from 'react'

export default function Login() {
    const router = useRouter()

    const [id, setId] = useState<string>('')
    const [pw, setPw] = useState<string>('')

    const login = () => {
        if(id == '') {
            alert('아이디를 입력해주세요.')
            return
        }
        if(pw == '') {
            alert('비밀번호를 입력해주세요.')
            return
        }
        const data = {
            id: id,
            pw: pw
        }
        console.log(data)
    }
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
                    <div className='font-preSB text-[26px]'>관리자로 로그인하기</div>
                    <div className='w-full mt-12'>
                        <div className='font-preR text-grey-800'>아이디</div>
                        <input onChange={(e)=>{setId(e.target.value)}} className='outline-none bg-white/70 rounded w-full h-[50px] mt-2 mb-8 px-4' type="text" />
                        <div className='font-preR text-grey-800'>비밀번호</div>
                        <input onChange={(e)=>{setPw(e.target.value)}} className='outline-none bg-white/70 rounded w-full h-[50px] mt-2 mb-16 px-4' type="password" />
                    </div>
                    <div onClick={login} className='flex justify-center items-center w-full h-[70px] bg-white/90 hover:bg-white cursor-pointer font-preM text-[20px] rounded-md'>로그인하기</div>
                    <div className='cursor-pointer font-preM hover:font-preB mt-16 mb-2'>문제가 있으신가요?</div>
                    <div>
                        <span className='mr-3'>아직 회원이 아니신가요?</span>
                        <span onClick={()=>{router.push('/user/signup')}} className='cursor-pointer underline font-preM hover:font-preB'>회원가입 하러가기</span>
                    </div>
                </div>
            </div>
        </div>
    </>
  )
}
