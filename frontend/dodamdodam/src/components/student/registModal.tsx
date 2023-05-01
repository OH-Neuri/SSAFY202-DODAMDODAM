import { kindergartenType } from '@/types/DataTypes'
import { Modal } from '@mui/material';
import React, { useState } from 'react'
import DaumPostcode from 'react-daum-postcode';

export default function RegistModal() {
    const [open, setOpen] = useState<boolean>(false)
    const [idx, setIdx] = useState<number>(0)
    const [focus, setFocus] = useState<boolean>(false)
    const [kinder, setKinder] = useState<kindergartenType|null>(null)
    const result: kindergartenType[] = [
        {name: '소정어린이집', address: '테헤란로 ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ', phone_number: '010-1234-1244'},
        {name: '룰루랄라 유치원', address: '부산광역시 도봉구 89 태산빌딩 102호', phone_number: '010-1234-1244'},
        {name: '소중한 우리아이 어린이집', address: '충청북도 청주시 오창중앙로', phone_number: '010-1234-1244'},
        {name: '희망어린이집', address: '제주도 저기 저 어떤 해변', phone_number: '010-1234-1244'},
    ]
    const search = (e : any) => {
        if(e.target.value.length == 0){
            setFocus(false)
            return
        }
        setFocus(true)
    }

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
        {idx == 0 &&
        <>
        <div className='font-preSB text-[28px] text-[#191919] mb-20'>유치원/어린이집 등록하기</div>
        <div onClick={()=>setIdx(1)} className='flex items-center group w-full h-[180px] rounded-xl bg-[#FFCAC8] shadow-lg cursor-pointer hover:bg-[#FFBBB9] mb-12'>
            <img className='w-[80px] ml-10 mr-6 opacity-70 group-hover:opacity-100 ' src="/images/user/kinder1.png" alt="" />
            <div className='font-preB text-[28px] text-stone-800/50 group-hover:text-stone-800/80'>검색해서 등록하기</div>
        </div>
        <div onClick={()=>setIdx(2)} className='flex items-center group w-full h-[180px] rounded-xl bg-[#ACB4DB] shadow-lg cursor-pointer hover:bg-[#949ED0] mb-12'>
            <img className='w-[80px] ml-10 mr-6 opacity-70 group-hover:opacity-100 ' src="/images/user/kinder2.png" alt="" />
            <div className='font-preB text-[28px] text-stone-800/50 group-hover:text-stone-800/80'>직접 입력해서 등록하기</div>
        </div>
        </>
        }
        {idx == 1 &&
        <>
        <div className='font-preSB text-[28px] text-[#191919] mb-12'>검색해서 등록하기</div>
        <input onFocus={(e)=>{if(e.target.value) setFocus(true)}} onChange={search} className='w-full bg-[#F1F1F1] rounded h-[50px] outline-none px-4' placeholder='이름을 검색해주세요' type="text" />
        {focus && <div className='z-[10] flex flex-col absolute top-[322px] min-h-[100px] max-h-[200px] w-[474px] bg-[#F1F1F1] rounded overflow-y-scroll [&::-webkit-scrollbar]:w-[10px] [&::-webkit-scrollbar-thumb]:bg-[#D5D5D5] [&::-webkit-scrollbar-thumb]:rounded-[10px] [&::-webkit-scrollbar-track]:hidden'>
        {result.length == 0 ?
                <div className={'pt-6 pl-4'}>검색결과가 없습니다.</div>
                :
                result.map((value, index)=>{
                    return (
                        <div key={index} onClick={()=>{setKinder(value); setFocus(false)}} className={'w-full flex flex-col items-start border-b pl-4 p-2 hover:bg-stone-200 cursor-pointer group'}>
                            <div className={'font-preM text-[18px]'}>
                                {value.name}
                            </div>
                            <div className={'flex item-center text-[14px] group-hover:font-preR'}>{value.address}</div>
                        </div>
                    )
                })}
        </div>}
        {/* 검색 결과 보여주기 */}
        {kinder ?
        <div className='w-full'>
            <div className='font-preM mt-7'>이름</div>
            <input readOnly={true} value={kinder.name} className='w-full bg-[#F1F1F1] rounded h-[50px] outline-none px-4' type="text" />
            <div className='font-preM mt-5'>주소</div>
            <input readOnly={true} value={kinder.address} className='w-full bg-[#F1F1F1] rounded h-[50px] outline-none px-4' type="text" />
            <div className='font-preM mt-5'>전화번호</div>
            <input readOnly={true} value={kinder.phone_number} className='w-full bg-[#F1F1F1] rounded h-[50px] outline-none px-4' type="text" />
        </div>:
        <div className='h-[290px] w-full'>
            <div className='mt-4 pl-2'>선택한 유치원/어린이집이 없습니다.</div>
        </div>
        }
        <div className='flex justify-center items-center w-full h-[60px] bg-m_yellow rounded text-[18px] font-preM mt-12 cursor-pointer hover:bg-h_yellow'>등록하기</div>
        <div onClick={()=>{setIdx(0); setKinder(null)}} className='mt-6 font-preR hover:font-preM cursor-pointer text-stone-700'>뒤로가기</div>
        </>
        }
        {idx == 2 &&
        <>
        <div className='font-preSB text-[28px] text-[#191919] mb-12'>직접 입력해서 등록하기</div>
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
        <div onClick={()=>{setIdx(0); setKinder(null)}} className='mt-6 font-preR hover:font-preM cursor-pointer text-stone-700'>뒤로가기</div>
        </>
        }
        <Modal className='flex justify-center items-center op' open={open} onClose={()=>setOpen(false)}>
            <div className='flex flex-col items-center pt-10 bg-white w-[600px] h-[700px] rounded-lg outline-none'>
                <DaumPostcode onComplete={onComplete} style={{height: '80%'}} />
                <div onClick={()=>setOpen(false)} className='mt-12 font-preR cursor-pointer hover:font-preM'>닫기</div>
            </div>
        </Modal>
    </div>
    </>
    )
}
