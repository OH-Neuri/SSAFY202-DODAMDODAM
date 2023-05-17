import router from "next/router";

export default function index() {
  return (
    <div className="flex justify-center items-center h-screen bg-b_yellow">
      <div className="absolute flex justify-center top-0 left-0 w-[280px] mt-10">
        <img
          onClick={() => router.push("/")}
          className="cursor-pointer w-1/2"
          src="/images/logo.png"
          alt=""
        />
      </div>
      <div className="flex w-[1200px] h-[680px] bg-white rounded-xl">
        <div className="flex justify-center items-center w-1/2 h-full">
          <img src="/images/user/kids.gif" className="w-4/5" />
        </div>
        <div className="flex flex-col items-center pt-[200px] px-16 w-1/2 h-full bg-m_yellow rounded-r-xl">
          <div className="font-preSB text-[26px]">
            로그인이 필요한 페이지입니다!
          </div>

          <div
            onClick={() => {
              router.push("/user/login");
            }}
            className="flex items-center justify-center text-[20px] font-preSB text-m_yellow mt-10 w-[400px] h-[60px] bg-white rounded
             cursor-pointer hover:bg-stone-100"
          >
            로그인 하러가기
          </div>

          <div className="cursor-pointer font-preM hover:font-preB mt-16 mb-2">
            문제가 있으신가요?
          </div>
          <div>
            <span className="mr-3">아직 회원이 아니신가요?</span>
            <span
              onClick={() => {
                router.push("/user/signup");
              }}
              className="cursor-pointer underline font-preM hover:font-preB"
            >
              회원가입 하러가기
            </span>
          </div>
        </div>
      </div>
    </div>
  );
}
