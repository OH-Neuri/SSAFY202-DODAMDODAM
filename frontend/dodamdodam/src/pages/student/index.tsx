import React from 'react'
import Image from 'next/image'
import Divider from '@mui/material/Divider';
import StudentCard from '@/components/studentCard';
import { student } from '@/types/DataTypes';
export default function index() {
    const studentList:student []= [
        {
            Image:"https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMzAzMjdfMTM3%2FMDAxNjc5ODk4NTIzNzM3.xEf48fNa0V0QslABtxDPF-zf18D1wRzRfnBYC_SSvLcg.ABbfBy5tGWrYz5NMqiRrGelbRVmgEtqNdpK9nwX7SEwg.PNG.rawebi1503%2F20230321_134448.png&type=l340_165",
            name: "여니",
            age: 5,
            gender: "w",
            class: "꽃님반"
        },
        {
            Image:"https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMzAzMjdfMTM3%2FMDAxNjc5ODk4NTIzNzM3.xEf48fNa0V0QslABtxDPF-zf18D1wRzRfnBYC_SSvLcg.ABbfBy5tGWrYz5NMqiRrGelbRVmgEtqNdpK9nwX7SEwg.PNG.rawebi1503%2F20230321_134448.png&type=l340_165",
            name: "느리스키",
            age: 6,
            gender: "m",
            class: "햇살반"
        },
        {
            Image:"https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMzAzMjdfMTM3%2FMDAxNjc5ODk4NTIzNzM3.xEf48fNa0V0QslABtxDPF-zf18D1wRzRfnBYC_SSvLcg.ABbfBy5tGWrYz5NMqiRrGelbRVmgEtqNdpK9nwX7SEwg.PNG.rawebi1503%2F20230321_134448.png&type=l340_165",
            name: "줼레나",
            age: 5,
            gender: "w",
            class: "나무반"
        },
        {
            Image:"https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMzAzMjdfMTM3%2FMDAxNjc5ODk4NTIzNzM3.xEf48fNa0V0QslABtxDPF-zf18D1wRzRfnBYC_SSvLcg.ABbfBy5tGWrYz5NMqiRrGelbRVmgEtqNdpK9nwX7SEwg.PNG.rawebi1503%2F20230321_134448.png&type=l340_165",
            name: "줼레나",
            age: 5,
            gender: "w",
            class: "나무반"
        },
        {
            Image:"https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMzAzMjdfMTM3%2FMDAxNjc5ODk4NTIzNzM3.xEf48fNa0V0QslABtxDPF-zf18D1wRzRfnBYC_SSvLcg.ABbfBy5tGWrYz5NMqiRrGelbRVmgEtqNdpK9nwX7SEwg.PNG.rawebi1503%2F20230321_134448.png&type=l340_165",
            name: "줼레나",
            age: 5,
            gender: "w",
            class: "나무반"
        },
        {
            Image:"https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMzAzMjdfMTM3%2FMDAxNjc5ODk4NTIzNzM3.xEf48fNa0V0QslABtxDPF-zf18D1wRzRfnBYC_SSvLcg.ABbfBy5tGWrYz5NMqiRrGelbRVmgEtqNdpK9nwX7SEwg.PNG.rawebi1503%2F20230321_134448.png&type=l340_165",
            name: "줼레나",
            age: 5,
            gender: "w",
            class: "나무반"
        },
        {
            Image:"https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMzAzMjdfMTM3%2FMDAxNjc5ODk4NTIzNzM3.xEf48fNa0V0QslABtxDPF-zf18D1wRzRfnBYC_SSvLcg.ABbfBy5tGWrYz5NMqiRrGelbRVmgEtqNdpK9nwX7SEwg.PNG.rawebi1503%2F20230321_134448.png&type=l340_165",
            name: "줼레나",
            age: 5,
            gender: "w",
            class: "나무반"
        },
        {
            Image:"https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMzAzMjdfMTM3%2FMDAxNjc5ODk4NTIzNzM3.xEf48fNa0V0QslABtxDPF-zf18D1wRzRfnBYC_SSvLcg.ABbfBy5tGWrYz5NMqiRrGelbRVmgEtqNdpK9nwX7SEwg.PNG.rawebi1503%2F20230321_134448.png&type=l340_165",
            name: "줼레나",
            age: 5,
            gender: "w",
            class: "나무반"
        },

        {
            Image:"https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMzAzMjdfMTM3%2FMDAxNjc5ODk4NTIzNzM3.xEf48fNa0V0QslABtxDPF-zf18D1wRzRfnBYC_SSvLcg.ABbfBy5tGWrYz5NMqiRrGelbRVmgEtqNdpK9nwX7SEwg.PNG.rawebi1503%2F20230321_134448.png&type=l340_165",
            name: "줼레나",
            age: 5,
            gender: "w",
            class: "나무반"
        },
        {
            Image:"https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMzAzMjdfMTM3%2FMDAxNjc5ODk4NTIzNzM3.xEf48fNa0V0QslABtxDPF-zf18D1wRzRfnBYC_SSvLcg.ABbfBy5tGWrYz5NMqiRrGelbRVmgEtqNdpK9nwX7SEwg.PNG.rawebi1503%2F20230321_134448.png&type=l340_165",
            name: "줼레나",
            age: 5,
            gender: "w",
            class: "나무반"
        },
        {
            Image:"https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMzAzMjdfMTM3%2FMDAxNjc5ODk4NTIzNzM3.xEf48fNa0V0QslABtxDPF-zf18D1wRzRfnBYC_SSvLcg.ABbfBy5tGWrYz5NMqiRrGelbRVmgEtqNdpK9nwX7SEwg.PNG.rawebi1503%2F20230321_134448.png&type=l340_165",
            name: "줼레나",
            age: 5,
            gender: "w",
            class: "나무반"
        },
        {
            Image:"https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMzAzMjdfMTM3%2FMDAxNjc5ODk4NTIzNzM3.xEf48fNa0V0QslABtxDPF-zf18D1wRzRfnBYC_SSvLcg.ABbfBy5tGWrYz5NMqiRrGelbRVmgEtqNdpK9nwX7SEwg.PNG.rawebi1503%2F20230321_134448.png&type=l340_165",
            name: "줼레나",
            age: 5,
            gender: "w",
            class: "나무반"
        },
        {
            Image:"https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMzAzMjdfMTM3%2FMDAxNjc5ODk4NTIzNzM3.xEf48fNa0V0QslABtxDPF-zf18D1wRzRfnBYC_SSvLcg.ABbfBy5tGWrYz5NMqiRrGelbRVmgEtqNdpK9nwX7SEwg.PNG.rawebi1503%2F20230321_134448.png&type=l340_165",
            name: "줼레나",
            age: 5,
            gender: "w",
            class: "나무반"
        },
    

        
    ]

    
    return (
        <div className='grid grid-cols-7 h-full'>
        <div className='bg-blue-100 h-full'></div>
        <div className='col-span-6'>
            <div>
            {/* <Image className='absolute opacity-25 ml-[-500px]' src='/images/student/목업4.png' alt='' width={10000} height={0}></Image> */}
            </div>
            <div className=' absolute mt-[100px]  w-[680px] h-[120px]'>
                <div className=' font-preM text-[32px] text-[#4F4F4F]'>
                    소정 어린이집
                </div>
                <div className='mt-[-4px] font-preBl text-[60px] text-[#494949]'>
                    원생 목록
                </div>
            </div>
            <div className='absolute overflow-hidden w-[2000px] h-[10px] mt-[270px] ml-[-50px]'>
                <Divider variant="middle" />
            </div>
            <div className='grid grid-cols-5 gap-3 w-[1930px] h-[800px] mt-[330px]'>
                {studentList.map((v, i) => { 
                    return (
                            <StudentCard key={i} student={v}></StudentCard>
                    )
                })}
            </div>
            </div>
     </div>
  )
}
// return (
//     <div className="grid grid-cols-7">
//       <div className="bg-blue-100">test</div>
//       <div className="col-span-6 bg-red-100">test</div>
//     </div>
//   );