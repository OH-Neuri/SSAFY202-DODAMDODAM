import { useRouter } from 'next/router'
import React, { useState } from 'react'

export default function Signup() {
    const router = useRouter()

    const [phone, setPhone] = useState<string>('')
    const [name, setName] = useState<string>('')
    const [id, setId] = useState<string>('')
    const [pw, setPw] = useState<string>('')
    const [pwCheck, setPwCheck] = useState<string>('')
    const [pwSee, setPwSee] = useState<boolean>(false)
    const [pwCheckSee, setPwCheckSee] = useState<boolean>(false)
    const [page, setPage] = useState<number>(0)

  return (
    <>
        <div className='flex justify-center items-center h-screen bg-b_yellow'>
            <div className='flex w-[1200px] h-[680px] bg-white rounded-xl'>
                <div className='flex justify-center items-center w-1/2 h-full'>
                    <img src="/images/user/kids.gif" className='w-4/5' />
                </div>
                <div className='flex flex-col items-center pt-8 px-16 w-1/2 h-full bg-m_yellow rounded-r-xl'>
                    {page == 1 ?
                    <>
                    <div onClick={()=>setPage(2)} className='relative top-[20px] left-[-230px] cursor-pointer'>🥨</div>
                    <div className='font-preSB text-[26px]'>계정 생성하기</div>
                    <div className='w-full mt-2'>
                        <div className='font-preR text-grey-800 mt-3'>이름</div>
                        <input onChange={(e)=>{setName(e.target.value)}} className='outline-none bg-white/70 rounded w-full h-[50px] mb-4 px-4' type="text" />
                        <div className='font-preR text-grey-800 mt-3'>아이디</div>
                        <input onChange={(e)=>{setId(e.target.value)}} className='outline-none bg-white/70 rounded w-full h-[50px] mb-4 px-4' type="text" />
                        <div className='font-preR text-grey-800 mt-3'>비밀번호</div>
                        <div className='flex items-center bg-white/70 rounded w-full mb-7'>
                            <input onChange={(e)=>{setPw(e.target.value)}} className='outline-none bg-white/0 w-full h-[50px] px-4' type={pwSee ? 'text' : "password"} ></input>
                            <div className='cursor-pointer mr-4' onClick={()=>setPwSee(!pwSee)}>🍕</div>
                        </div>
                        <div className='font-preR text-grey-800 mt-3'>비밀번호확인</div>
                        <div className='flex items-center bg-white/70 rounded w-full mb-12'>
                            <input onChange={(e)=>{setPwCheck(e.target.value)}} className='outline-none bg-white/0 w-full h-[50px] px-4' type={pwCheckSee ? 'text' : "password"} ></input>
                            <div className='cursor-pointer mr-4' onClick={()=>setPwCheckSee(!pwCheckSee)}>🍕</div>
                        </div>
                    </div>
                    <div className=''>{}</div>
                    <div className='flex justify-center items-center w-full h-[70px] bg-white/90 hover:bg-white cursor-pointer font-preM text-[20px] rounded-md'>생성하기</div>
                    </>
                    :
                    <>
                    <div className='font-preSB text-[26px] mt-8'>회원가입하기</div>
                    <div className='w-full mt-16'>
                        <div className='font-preR text-grey-800'>핸드폰번호</div>
                        <div className='flex items-center mt-2 mb-8 '>
                            <input onChange={(e)=>{setPhone(e.target.value)}} placeholder='ex) 01012341234' className='outline-none bg-white/70 font-preEL rounded w-2/3 h-[50px] px-4' type="text" />
                            <div className='flex justify-center items-center cursor-pointer bg-yellow-500 w-[30%] h-[50px] rounded ml-3 font-preR hover:bg-yellow-600/60'>인증번호 받기</div>
                        </div>
                        <div className='font-preR text-grey-800'>인증번호</div>
                        <div className='flex items-center rounded w-full mt-2 mb-4'>
                            <input onChange={(e)=>{setPw(e.target.value)}} className='outline-none bg-white/70 rounded w-full mt-2 mb-12 h-[50px] px-4' type={pwSee ? 'text' : "password"} ></input>
                        </div>
                    </div>
                    <div className=''>{}</div>
                    <div onClick={()=>setPage(1)} className='flex justify-center items-center w-full h-[70px] bg-white/90 hover:bg-white cursor-pointer font-preM text-[20px] rounded-md'>다음</div>
                    <div className='mt-16'>
                        <span className='mr-3'>이미 회원이신가요?</span>
                        <span onClick={()=>{router.push('/user/login')}} className='underline font-preM hover:font-preB'>로그인 하러가기</span>
                    </div>

                    </>
                    }
                </div>
            </div>
        </div>
    </>
  )
}
