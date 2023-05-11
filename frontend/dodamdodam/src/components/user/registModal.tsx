import { searchKindergarten } from '@/api/kindergarten/default';
import { KinderGartenSearchType } from '@/types/DataTypes'
import { Modal } from '@mui/material';
import React, { useState } from 'react'
import DaumPostcode from 'react-daum-postcode';
import { toastError, toastOK } from '../common/toast';
import { registKindergarten } from '@/api/kindergarten/auth';
import { useRouter } from 'next/router';

export default function RegistModal() {
    const [open, setOpen] = useState<boolean>(false)
    const [idx, setIdx] = useState<number>(0)
    const [focus, setFocus] = useState<boolean>(false)
    const [kinder, setKinder] = useState<KinderGartenSearchType|null>(null)
    const [addressDetail, setAddressDetail] = useState<string>('')
    const [searchList, setSearchList] = useState<KinderGartenSearchType[]>([])

    const router = useRouter()

    const search = async (e : any) => {
        if(e.target.value.length == 0){
            setFocus(false)
            return
        }
        setSearchList(await searchKindergarten(e.target.value))
        setFocus(true)
    }

    const onComplete = (data : any) => {
        if(kinder) {
            const newKinder : KinderGartenSearchType = {...kinder}
            newKinder.address = data.address
            setKinder(newKinder)
        } else {
            const newKinder : KinderGartenSearchType = {
                kindergartenInfoSeq: 0,
                name: '',
                director: '',
                address: data.address,
            }
            setKinder(newKinder)
        }
        setOpen(false)
    }

    const onChange = (e : any) => {
        if(kinder) {
            const newKinder : KinderGartenSearchType = {...kinder}
            newKinder.name = e.target.value
            setKinder(newKinder)
        } else {
            const newKinder : KinderGartenSearchType = {
                kindergartenInfoSeq: 0,
                name: e.target.value,
                director: '',
                address: '주소 찾기',
            }
            setKinder(newKinder)
        }

    }

    const regist = async () => {
        if(!kinder || kinder.name == '' || kinder.address == '' || kinder.address == '주소 찾기'){
            toastError('어린이집 정보를 입력해주세요.')
            return
        }
        const add = `${kinder.address} ${addressDetail}`;
        const res = await registKindergarten(kinder.name, add)
        if(res) {
            toastOK('등록되었습니다.')
            router.push('/calendar')
        }else {
            toastError('유치원 등록에 실패했습니다.')
            return
        }
    }

    
  return (
    <>
    <div className='px-16 pt-14 flex flex-col items-center bg-white outline-none w-[600px] h-[600px] rounded-lg'>
        {idx == 0 &&
        <>
        <div className='font-preSB text-[28px] text-[#191919] mb-10'>유치원/어린이집 등록하기</div>
        <div onClick={()=>setIdx(1)} className='flex items-center group w-full h-[180px] rounded-xl bg-[#FFCAC8] shadow-lg cursor-pointer hover:bg-[#FFBBB9] mb-8'>
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
        <input onFocus={(e)=>{if(e.target.value) setFocus(true)}} onChange={search} className='w-full bg-stone-100 rounded h-[50px] outline-none px-4' placeholder='이름을 검색해주세요' type="text" />
        {focus && <div className='z-[10] flex flex-col absolute top-[370px] min-h-[100px] max-h-[200px] w-[474px] bg-stone-100 shadow-md rounded overflow-y-scroll [&::-webkit-scrollbar]:w-[10px] [&::-webkit-scrollbar-thumb]:bg-[#D5D5D5] [&::-webkit-scrollbar-thumb]:rounded-[10px] [&::-webkit-scrollbar-track]:hidden'>
        {searchList.length == 0 ?
                <div className={'pt-6 pl-4'}>검색결과가 없습니다.</div>
                :
                searchList.map((value, index)=>{
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
        </div>:
        <div className='h-[190px] w-full'>
            <div className='mt-4 pl-2'>선택한 유치원/어린이집이 없습니다.</div>
        </div>
        }
        <div onClick={()=>regist()} className='flex justify-center items-center w-full h-[60px] bg-m_yellow rounded text-[18px] font-preM mt-12 cursor-pointer hover:bg-h_yellow'>등록하기</div>
        <div onClick={()=>{setIdx(0); setKinder(null)}} className='mt-6 font-preR hover:font-preM cursor-pointer text-stone-700'>뒤로가기</div>
        </>
        }
        {idx == 2 &&
        <>
        <div className='font-preSB text-[28px] text-[#191919] mb-12'>직접 입력해서 등록하기</div>
        <div className='w-full'>
            <div className='font-preM mt-7'>이름</div>
            <input onChange={onChange} className='w-full bg-[#F1F1F1] rounded h-[50px] outline-none px-4' placeholder='어린이집/유치원 이름을 입력해주세요' type="text" />
            <div className='font-preM mt-5'>주소</div>
            <div onClick={()=>setOpen(true)} className='flex items-center w-full bg-[#F1F1F1] rounded h-[50px] outline-none px-4 cursor-pointer' >{kinder? kinder.address : '주소 찾기'}</div>
            <input onChange={(e)=>setAddressDetail(e.target.value)} className='w-full bg-[#F1F1F1] rounded h-[50px] outline-none px-4 mt-2' placeholder='상세주소를 입력해주세요' type="text" />
        </div>
        <div onClick={()=>regist()} className='flex justify-center items-center w-full h-[60px] bg-m_yellow rounded text-[18px] font-preM mt-12 cursor-pointer hover:bg-h_yellow'>등록하기</div>
        <div onClick={()=>{setIdx(0); setKinder(null)}} className='mt-6 font-preR hover:font-preM cursor-pointer text-stone-700'>뒤로가기</div>
        </>
        }
        <Modal className='flex justify-center items-center op' open={open} onClose={()=>setOpen(false)}>
            <div className='flex flex-col items-center pt-10 bg-white w-[600px] h-[600px] rounded-lg outline-none'>
                <DaumPostcode onComplete={onComplete} style={{height: '80%'}} />
                <div onClick={()=>setOpen(false)} className='mt-12 font-preR cursor-pointer hover:font-preM'>닫기</div>
            </div>
        </Modal>
    </div>
    </>
    )
}
