import { useRouter } from "next/router"
import { useEffect } from "react"


export default function Home() {
  useEffect(()=>{
    console.log('소정 하이')
    console.log('소정 바이......')
    console.log('가지마.......')
    console.log('아니야 가.....')
    console.log('지마')
  },[])
  const router = useRouter()
  return (
    <>
      <img className="absolute top-[300px] left-[400px]" src="/images/main/tree.png" alt="" />
      <img className="absolute top-[100px] right-[400px]" src="/images/main/cloud.png" alt="" />
      <div className="flex flex-col justify-center items-center bg-b_yellow h-screen">
        <img src="/images/logo.png" alt="" />
        <div className="font-KCC text-[28px] text-stone-700">소중한 우리아이 유치원 생활</div>
        <div onClick={()=>router.push('/user/login')} className="cursor-pointer flex justify-center items-center w-[280px] font-preR text-[20px] mt-10 bg-yellow-400 hover:bg-yellow-500 text-white rounded-full px-6 py-3">관리자로 로그인하기</div>
        <div className="cursor-pointer flex justify-center items-center w-[280px] font-preR text-[20px] mt-3 bg-blue-400 hover:bg-blue-500 text-white rounded-full px-6 py-3">교사/학부모로 로그인하기</div>
      </div>
    </>
  )
}
