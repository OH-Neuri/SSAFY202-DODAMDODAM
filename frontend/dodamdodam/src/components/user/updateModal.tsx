import React, { useEffect, useState } from 'react'
import DriveFileRenameOutlineIcon from '@mui/icons-material/DriveFileRenameOutline';
import { KindergartenInfoType } from '@/types/DataTypes';

export default function UpdateModal(props : {kinder : KindergartenInfoType, setOpen: any, modify: any}) {
    const {kinder, setOpen, modify} = props;
    const [name, setName] = useState<string>('')
    const [address, setAddress] = useState<string>('')
    const [readMode, setReadMode] = useState<boolean>(true)

    useEffect(()=>{
        if(kinder){
            setName(kinder.name)
            setAddress(kinder.address)
        }
    },[props])

  return (
    <>
    <div className='px-16 pt-14 flex flex-col items-center bg-white outline-none w-[600px] h-[600px] rounded-lg'>
        <div className='font-preSB text-[28px] text-[#191919] mb-8'>
            {readMode ? '유치원 정보' : '유치원 수정하기'}
            <span onClick={()=>{setReadMode(!readMode)}} className='cursor-pointer relative left-4 text-stone-500 hover:text-stone-800'>
                <DriveFileRenameOutlineIcon />
                </span>
            </div>
        <div className='w-full'>
            <div className='font-preM mt-7'>이름</div>
            <input readOnly={readMode} onChange={(e)=>setName(e.target.value)} value={name} className='w-full bg-[#F1F1F1] rounded h-[50px] outline-none px-4' placeholder='어린이집/유치원 이름을 입력해주세요' type="text" />
            <div className='font-preM mt-5'>주소</div>
            <input readOnly={readMode} onChange={(e)=>setAddress(e.target.value)} value={address} className='w-full bg-[#F1F1F1] rounded h-[50px] outline-none px-4 mt-2' placeholder='주소를 입력해주세요' type="text" />
        </div>
        {readMode ?
        <div onClick={()=>setOpen(false)} className='flex justify-center items-center w-full h-[60px] bg-stone-300 rounded text-[18px] font-preM mt-32 cursor-pointer hover:bg-stone-400/60'>닫기</div>
        :
        <div onClick={()=>modify(name, address)} className='flex justify-center items-center w-full h-[60px] bg-m_yellow rounded text-[18px] font-preM mt-32 cursor-pointer hover:bg-h_yellow'>수정하기</div>
        }
    </div>
    </>
  )
}
