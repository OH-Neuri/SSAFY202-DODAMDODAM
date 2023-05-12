import { useRouter } from 'next/router'
import MoreVertIcon from '@mui/icons-material/MoreVert';
import React, { useEffect, useState } from 'react'
import { Modal } from '@mui/material';
import UpdateModal from '../user/updateModal';
import { useKindergarten, useModifyKindergarten } from '@/hooks/kindergartenHooks';

export default function NavBar(props: {target: string}) {
    const {target} = props

    const { data } = useKindergarten();
    const { modifyKindergarten } = useModifyKindergarten();

    const [userName, setUserName] = useState<string>('')
    const [open, setOpen] = useState<boolean>(false)
    const [tab, setTab] = useState<boolean>(false)
    const router = useRouter()
    const logout = () => {
        alert('로그아웃')
    }

    useEffect(()=>{
        const name = sessionStorage.getItem('name');
        if(name) {
            setUserName(name)
        }
    },[])

    const modify = (name: string, address: string) => {
        const payload = {
            name: name,
            address: address
        }
        modifyKindergarten(payload);
        setOpen(false)
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
            <div className='flex items-center justify-between pl-12 pr-6 w-[90%] bg-yellow-400/50 h-[90px] rounded-full'>
                <div className='flex flex-col w-[90%]'>
                    <div className='font-preM text-[20px] truncate'>{data?.name}</div>
                    <div>{userName}원장님</div>
                </div>
                <div onBlur={()=>setTab(false)} tabIndex={0}>
                    <div onClick={()=>{setTab(!tab)}} className='cursor-pointer'><MoreVertIcon /></div>
                    {tab && 
                    <div className='absolute top-[-70px] shadow-lg rounded bg-white w-[120px] h-[100px]'>
                        <div onClick={()=>setOpen(true)} className='flex justify-center items-center w-full h-1/2 cursor-pointer hover:bg-stone-200/80 font-preR'>유치원 정보</div>
                        <div onClick={logout} className='flex justify-center items-center w-full h-1/2 cursor-pointer hover:bg-stone-200/80 font-preR'>로그아웃</div>
                    </div>
                    }
                </div>
            </div>
        </div>
        {data &&
        <Modal className='flex justify-center items-center' open={open} onClose={()=>setOpen(false)}>
            <div className='flex justify-center items-center outline-none'>
                <UpdateModal kinder={data} setOpen={setOpen} modify={modify}/>
            </div>
        </Modal>
        }
    </div>
  )
}
