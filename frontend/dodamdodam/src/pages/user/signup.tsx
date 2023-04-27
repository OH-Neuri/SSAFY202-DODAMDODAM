import { useRouter } from 'next/router'
import VisibilityIcon from '@mui/icons-material/Visibility';
import VisibilityOffIcon from '@mui/icons-material/VisibilityOff';
import ArrowBackIosNewOutlinedIcon from '@mui/icons-material/ArrowBackIosNewOutlined';
import React, { useState } from 'react'

export default function Signup() {
    const router = useRouter()

    const [phone, setPhone] = useState<string>('')
    const [name, setName] = useState<string>('')
    const [id, setId] = useState<string>('')
    const [checkId, setCheckId] = useState<boolean>(false)
    const [pw, setPw] = useState<string>('')
    const [pwCheck, setPwCheck] = useState<string>('')
    const [pwSee, setPwSee] = useState<boolean>(false)
    const [pwCheckSee, setPwCheckSee] = useState<boolean>(false)
    const [idRule, setIdRule] = useState<string>('')
    const [pwRule, setPwRule] = useState<string>('')
    const [pwCheckRule, setPwCheckRule] = useState<string>('')
    const [page, setPage] = useState<number>(0)

    const rules = (target: string, value: string) => {
        if (target == 'pw') {
            if (value.length > 15) {
                setPwRule('비밀번호는 15자 이내로 설정해주세요.')
            } else if ( value.length > 0 && value.length < 8) {
                setPwRule('비밀번호는 최소 8자 이상으로 설정해주세요.')
                setPw(value)
            } else {
                setPwRule('')
                setPw(value)
            }
        } else if (target == 'pwCheck') {
            if (value != pw) {
                setPwCheckRule('비밀번호가 일치하지 않습니다.')
            } else {
                setPwCheckRule('')
            }
            setPwCheck(value)
        }
    }

    const idCheck = (value : string) => {
        // 백이라 연동해서 값을 받아오면 idRule 변화
        if (value.length == 0) {
            setIdRule('')
        } else {
            setCheckId(true)
            setIdRule(`${value}는 사용 가능한 아이디입니다.`)
        }
        setId(value)
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
                <div className='flex flex-col items-center pt-8 px-16 w-1/2 h-full bg-m_yellow rounded-r-xl'>
                    {page == 1 ?
                    <>
                    <div onClick={()=>setPage(2)} className='relative top-[34px] left-[-230px] cursor-pointer'><ArrowBackIosNewOutlinedIcon/></div>
                    <div className='font-preSB text-[26px]'>계정 생성하기</div>
                    <div className='w-full mt-2'>
                        <div className='font-preR text-grey-800 mt-3'>이름</div>
                        <input onChange={(e)=>{setName(e.target.value)}} className='outline-none bg-white/70 rounded w-full h-[50px] mb-4 px-4' type="text" />
                        <div className='font-preR text-grey-800 mt-3'>아이디</div>
                        <input onChange={(e)=>{idCheck(e.target.value)}} className='outline-none bg-white/70 rounded w-full h-[50px] px-4' type="text" />
                        <div className={`${!checkId && 'text-red-600'} text-[14px] h-[20px]`}>{idRule}</div>
                        <div className='font-preR text-grey-800 mt-3'>비밀번호</div>
                        <div className='flex items-center bg-white/70 rounded w-full'>
                            <input onChange={(e)=>{rules('pw', e.target.value)}} className='outline-none bg-white/0 w-full h-[50px] px-4' type={pwSee ? 'text' : "password"} ></input>
                            <div className='cursor-pointer mr-4 text-stone-500' onClick={()=>setPwSee(!pwSee)}>{pwSee? <VisibilityIcon /> : <VisibilityOffIcon/>}</div>
                        </div>
                        <div className='text-red-600 text-[14px] h-[20px]'>{pwRule}</div>
                        <div className='font-preR text-grey-800 mt-3'>비밀번호확인</div>
                        <div className='flex items-center bg-white/70 rounded w-full'>
                            <input onChange={(e)=>{rules('pwCheck', e.target.value)}} className='outline-none bg-white/0 w-full h-[50px] px-4' type={pwCheckSee ? 'text' : "password"} ></input>
                            <div className='cursor-pointer mr-4 text-stone-500' onClick={()=>setPwCheckSee(!pwCheckSee)}>{pwCheckSee? <VisibilityIcon /> : <VisibilityOffIcon/>}</div>
                        </div>
                        <div className='text-red-600 text-[14px] h-[20px] mb-8'>{pwCheckRule}</div>
                    </div>
                    <div className=''>{}</div>
                    <div onClick={()=>router.push('/user/welcome')} className='flex justify-center items-center w-full h-[70px] bg-white/90 hover:bg-white cursor-pointer font-preM text-[20px] rounded-md'>생성하기</div>
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
                        <span onClick={()=>{router.push('/user/login')}} className='cursor-pointer underline font-preM hover:font-preB'>로그인 하러가기</span>
                    </div>

                    </>
                    }
                </div>
            </div>
        </div>
    </>
  )
}
