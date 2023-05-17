import React, { useEffect, useState } from "react";

export default function PageHeader(props: { name: string }) {
  const { name } = props;
  const [ kindergarten, setKindergarten ] = useState<string>('')

  useEffect(()=>{
    const kinder = sessionStorage.getItem('kindergarten');
    if(kinder){
      setKindergarten(kinder)
    }
  },[])
  return (
    <>
      <div className="flex flex-col mt-10 mb-10 ml-10">
        <div className="flex flex-col justify-center ml-3">
          <div className="text-[20px]">{kindergarten}</div>
          <div className="text-[40px] font-preB text-[#4F4F4F]">{name}</div>
        </div>
        <hr className="mt-[20px]" />
      </div>
    </>
  );
}
