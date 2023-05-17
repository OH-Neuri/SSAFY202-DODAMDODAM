import { SignupUserType } from "@/types/userTypes";
import { defaultAxios } from "../common";
import { toastError } from "@/components/common/toast";
import Cookies from 'js-cookie';

export const sendAuthSMS = (phone: string, role: number) => {
  let bool = false;
  const data = {
    phone: phone,
    role: role,
  };
  defaultAxios
    .post(`sms/user`, data)
    .then(() => {
      bool = true;
    })
    .catch((err) => {
      if (err.response.status == 500) {
        toastError("이미 가입된 유저입니다.");
      } else {
        console.log(err);
      }
    });
    return bool;
};

export const checkAuthSMS = async (phone: string, code: string) => {
  let bool;
  const data = {
    phone: phone,
    code: code,
  };
  await defaultAxios
    .post(`sms/user/check`, data)
    .then((res) => {
      console.log(res.data.result);
      bool = true;
    })
    .catch((err) => {
      console.log(err);
      bool = false;
    });
  return bool;
};

export const userSignup = async (user: SignupUserType) => {
  let bool;
  await defaultAxios
    .post(`user`, user)
    .then((res) => {
      console.log(res.data.result);
      sessionStorage.setItem("isLogin", "true");
      sessionStorage.setItem("token", res.data.result.token);
      Cookies.set("token", res.data.result.token);
      sessionStorage.setItem("name", res.data.result.name);
      bool = true;
    })
    .catch((err) => {
      console.log(err);
      bool = false;
    });
  return bool;
};

export const userLogin = async (id: string, pw: string, role: number) => {
    const payload = {
        bool: false,
        kinder: false,
    }
    const data = {
        id: id,
        password: pw,
        role : role
    }
    await defaultAxios.post(`user/login`, data
    ).then((res)=>{
        console.log(res.data.result)
        if(res.data.isSuccess){
            sessionStorage.setItem('reload', 'false')
            sessionStorage.setItem('isLogin', 'true')
            sessionStorage.setItem('token', res.data.result.loginResponseDto.token)
            sessionStorage.setItem('name', res.data.result.loginResponseDto.name)
            payload.bool = true
            if(res.data.result.kindergarten){
              sessionStorage.setItem('kindergarten', res.data.result.kindergarten)
              payload.kinder = true;
            }else{
              payload.kinder = false;
            }
        }
    }).catch((err)=>{
        console.log(err)
    })
    .catch((err) => {
      console.log(err);
    });
  return payload;
};

export const checkIdDuplicate = async (id: string) => {
  let re = false;
  await defaultAxios
    .get(`user/check/${id}`)
    .then((res) => {
      if (res.data.result) {
        re = true;
      } else {
        re = false;
      }
    })
    .catch((err) => {
      console.log(err);
      re = false;
    });
  return re;
};
