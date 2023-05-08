import { kindergartenType } from '@/types/DataTypes'
import { Modal } from '@mui/material'
import React, { useState } from 'react'
import DaumPostcode from 'react-daum-postcode';

export default function UpdateModal() {
    const [open, setOpen] = useState<boolean>(false)
    const [kinder, setKinder] = useState<kindergartenType|null>(null)

    
    const onComplete = (data : any) => {
        if(kinder) {
            const newKinder : kindergartenType = {...kinder}
            newKinder.address = data.address
            setKinder(newKinder)
        } else {
            const newKinder : kindergartenType = {
                name: '',
                address: data.address,
                phone_number: ''
            }
            setKinder(newKinder)
        }
        setOpen(false)
    }

  return (
    <>
    <div className='px-16 pt-14 flex flex-col items-center bg-white outline-none w-[600px] h-[700px] rounded-lg'>
        <div className='font-preSB text-[28px] text-[#191919] mb-8'>유치원 정보</div>
        <div className='w-full'>
            <div className='font-preM mt-7'>이름</div>
            <input className='w-full bg-[#F1F1F1] rounded h-[50px] outline-none px-4' placeholder='어린이집/유치원 이름을 입력해주세요' type="text" />
            <div className='font-preM mt-5'>주소</div>
            <div onClick={()=>setOpen(true)} className='flex items-center w-full bg-[#F1F1F1] rounded h-[50px] outline-none px-4 cursor-pointer' >{kinder? kinder.address : '주소 찾기'}</div>
            <input className='w-full bg-[#F1F1F1] rounded h-[50px] outline-none px-4 mt-2' placeholder='상세주소를 입력해주세요' type="text" />
            <div className='font-preM mt-5'>전화번호</div>
            <input className='w-full bg-[#F1F1F1] rounded h-[50px] outline-none px-4' type="text" />
        </div>
        <div className='flex justify-center items-center w-full h-[60px] bg-m_yellow rounded text-[18px] font-preM mt-12 cursor-pointer hover:bg-h_yellow'>등록하기</div>
    </div>
    <Modal className='flex justify-center items-center op' open={open} onClose={()=>setOpen(false)}>
        <div className='flex flex-col items-center pt-10 bg-white w-[600px] h-[700px] rounded-lg outline-none'>
            <DaumPostcode onComplete={onComplete} style={{height: '80%'}} />
            <div onClick={()=>setOpen(false)} className='mt-12 font-preR cursor-pointer hover:font-preM'>닫기</div>
        </div>
    </Modal>
    </>
  )
}
