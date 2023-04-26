import NavBar from '@/components/common/navBar'
import { classType } from '@/types/classType'
import { Chip } from '@mui/material'
import EditNoteOutlinedIcon from '@mui/icons-material/EditNoteOutlined';
import HighlightOffOutlinedIcon from '@mui/icons-material/HighlightOffOutlined';
import CloseIcon from '@mui/icons-material/Close';
import React, { useState } from 'react'

export default function index() {
  const [name, setName] = useState<string>('')
  const [teacher, setTeacher] = useState<string|null>(null)
  const [idx, setIdx] = useState<number>(-1)

  const classList : classType[] = [
    {class_seq: 0, name: '햇님반', teacher: '김교사', age: '5세, 6세'},
    {class_seq: 1, name: '햇살반', teacher: '이교사', age: '3세 이하, 4세, 7세 이상'},
    {class_seq: 2, name: '구름반', teacher: null, age: '4세, 5세'},
    {class_seq: 3, name: '사랑반', teacher: null, age: '4세, 5세'},
    {class_seq: 4, name: '햇님반', teacher: '김교사', age: '4세'},
    {class_seq: 5, name: '햇살반', teacher: '이교사', age: '4세'},
    {class_seq: 6, name: '구름반', teacher: '윤교사', age: '4세'},
    {class_seq: 7, name: '사랑반', teacher: '오교사', age: '4세'},
    {class_seq: 8, name: '햇님반', teacher: '김교사', age: '4세'},
    {class_seq: 9, name: '햇살반', teacher: '이교사', age: '4세'},
  ]
    const chips = ['3세 이하', '4세', '5세', '6세', '7세 이상']
    const [ageList, setAgeList] = useState<string[]>([])
    const select = (value : string) => {
      const newList = ageList
      const idx = ageList.indexOf(value)
      if (idx == -1) {
        newList.push(value)
      }else {
        newList.splice(idx, 1)
      }
      setAgeList([...newList])
    }

    const update = (i : number) => {
      setName(classList[i].name)
      setTeacher(classList[i].teacher)
      setAgeList(classList[i].age.split(', '))
      setIdx(i)
    }

    const close = () => {
      setName('')
      setTeacher(null)
      setAgeList([])
      setIdx(-1)
    }

  return (
    <>
      <div className='grid grid-cols-7'>
        <div className='fixed'>
          <NavBar target='반' />
        </div>
        <div></div>
        <div className='col-span-6 p-20'>
          <div className='flex flex-col border-b mb-8 pl-8'>
            <div className='text-[20px]'>소정어린이집</div>
            <div className='text-[36px] font-preB'>반 목록</div>
            <div className='flex h-[60px]'>
              <span>
                <span></span>
              </span>
            </div>
          </div>
          <div className='flex w-full'>
            {/* 반 목록 */}
            <div className='w-[56%] px-8 h-[600px] overflow-y-scroll [&::-webkit-scrollbar]:w-[10px] [&::-webkit-scrollbar-thumb]:bg-[#D5D5D5] [&::-webkit-scrollbar-thumb]:rounded-[10px] [&::-webkit-scrollbar-track]:hidden'>
              {classList.map((c, i)=>{
                return (
                  <div key={c.class_seq} className='flex items-center px-8 py-4 rounded-lg shadow w-full h-[100px] mb-4 bg-red-100'>
                    <div className='text-[22px] font-preSB pl-6 w-[20%]'>{c.name}</div>
                    <div className='w-[20%]'>{c.age}</div>
                    <div className='flex justify-center w-[50%] pr-20'>
                    {c.teacher ?
                    <div className=''><span className='font-preM'>담당교사</span> : {c.teacher}</div>
                    :
                    <span className='flex justify-center items-center w-[180px] font-preR px-4 py-2 rounded-full bg-red-300 cursor-pointer hover:bg-red-400'>담당 교사 연결하기</span>
                    }
                    </div>
                    <div onClick={()=>{update(i)}}>
                      <EditNoteOutlinedIcon className='mr-10 text-stone-500 hover:text-stone-700 cursor-pointer' />
                    </div>
                    <HighlightOffOutlinedIcon className='text-red-400/80 cursor-pointer hover:text-red-400'/>
                  </div>
                )
              })}
            </div>
            {/* 반 추가하기 */}
            <div className='w-[40%] flex flex-col items-center rounded shadow-lg px-10 ml-10'>
              {idx == -1 ?
              <>
              <div className='font-preM text-[26px] mt-10 mb-16'>반 추가하기</div>
              <div className='w-full'>
                <div className='font-preR text-grey-800 font-preR'>이름</div>
                <input onChange={(e)=>{setName(e.target.value)}} className='outline-none bg-stone-200/50 rounded w-full h-[50px] mt-2 mb-8 px-4' type="text" />
                <div className='font-preR text-grey-800 font-preR'>연령</div>
                <div className='flex mt-2 bg-white/70 rounded w-full p-2'>
                  {chips.map((c, i)=>{
                    return (
                      <Chip key={i} onClick={()=>select(c)} className='cursor-pointer text-black mr-4 text-[16px] p-2 h-[40px] rounded-full' label={c} color='primary' variant={ageList.indexOf(c) == -1 ? 'outlined' : 'filled'}/>
                    )
                  })}
                </div>
                <div className='flex justify-center items-center w-full h-[60px] bg-m_yellow rounded text-[18px] font-preM mt-20 cursor-pointer hover:bg-h_yellow'>등록하기</div>
              </div>
              </>
              :
              <>
              <span onClick={()=>close()} className='cursor-pointer relative top-[10px] right-[-250px]'>
                <CloseIcon className='' />
              </span>
              <div className='font-preM text-[26px] mt-4 mb-10'>반 수정하기</div>
              <div className='w-full'>
                <div className='font-preR text-grey-800 font-preR'>이름</div>
                <input onChange={(e)=>{setName(e.target.value)}} className='outline-none bg-stone-200/50 rounded w-full h-[50px] mt-2 mb-8 px-4' value={name} type="text" />
                <div className='font-preR text-grey-800 font-preR'>나이</div>
                <div className='flex mt-2 bg-white/70 rounded w-full p-2'>
                  {chips.map((c, i)=>{
                    return (
                      <Chip key={i} onClick={()=>select(c)} className='cursor-pointer text-black mr-4 text-[16px] p-2 h-[40px] rounded-full' label={c} color='primary' variant={ageList.indexOf(c) == -1 ? 'outlined' : 'filled'}/>
                      )
                    })}
                </div>
                <div className='font-preR text-grey-800 mt-5 font-preR'>담당 교사</div>
                {}
                <div className='flex w-full mt-2 mb-8'>
                  <input readOnly={true} className='outline-none bg-stone-200/50 rounded w-3/5 h-[50px] px-4 mr-4' value={teacher ? teacher : ''} type="text" />
                  <div className='flex justify-center items-center font-preR bg-stone-200 h-[50px] w-[38%] rounded cursor-pointer hover:bg-stone-300/70'>삭제하기</div>  
                </div>
                <div className='flex justify-center items-center w-full h-[60px] bg-m_yellow rounded text-[18px] font-preM mt-[60px] cursor-pointer hover:bg-h_yellow'>수정하기</div>
              </div>
              </>
              
            }
            </div>
          </div>
        </div>
      </div>
    </>
  )
}
