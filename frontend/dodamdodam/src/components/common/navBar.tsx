import { useRouter } from 'next/router'
import React from 'react'

export default function NavBar(props: {target: string}) {
    const {target} = props
    const router = useRouter()
    const logout = () => {
        alert('로그아웃')
    }

  return (
    <div className=' flex flex-col w-full h-screen bg-b_yellow'>
        <div className='flex justify-center w-full my-10'>
            <img onClick={()=>{router.push('/')}} className='w-1/2 cursor-pointer' src="/images/logo.png" alt="" />
        </div>
        <div>
            <div onClick={()=>{router.push('/calendar')}} className={`flex justify-center items-center w-full h-[80px] cursor-pointer hover:bg-yellow-500/20 text-[22px] ${target == '일정' && 'font-preM bg-yellow-500/20'}`}>일정 관리</div>
            <div onClick={()=>{router.push('각자 url 입력')}} className={`flex justify-center items-center w-full h-[80px] cursor-pointer hover:bg-yellow-500/20 text-[22px] ${target == '급식' && 'font-preM bg-yellow-500/20'}`}>급식 관리</div>
            <div onClick={()=>{router.push('/teacher')}} className={`flex justify-center items-center w-full h-[80px] cursor-pointer hover:bg-yellow-500/20 text-[22px] ${target == '교사' && 'font-preM bg-yellow-500/20'}`}>교사 관리</div>
            <div onClick={()=>{router.push('/class')}} className={`flex justify-center items-center w-full h-[80px] cursor-pointer hover:bg-yellow-500/20 text-[22px] ${target == '반' && 'font-preM bg-yellow-500/20'}`}>반 관리</div>
            <div onClick={()=>{router.push('/student')}} className={`flex justify-center items-center w-full h-[80px] cursor-pointer hover:bg-yellow-500/20 text-[22px] ${target == '원생' && 'font-preM bg-yellow-500/20'}`}>원생 관리</div>
        </div>
        <div className='relative bottom-[-25%] flex justify-center w-full'>
            <div className='flex items-center px-3 w-[90%] bg-yellow-400/50 h-[90px] rounded-full'>
                <div className='rounded-full overflow-hidden w-[60px] h-[60px] mr-4'>
                    <img className='object-fit w-full h-full' src="/images/main/cloud.png" alt="" />
                </div>
                <div className='flex flex-col w-[120px]'>
                    <div className='font-preM text-[18px]'>소정어린이집</div>
                    <div>쿨냥이원장님</div>
                </div>
                <div onClick={()=>{logout()}} className='cursor-pointer'>💢</div>
            </div>
        </div>
    </div>
  )
}
