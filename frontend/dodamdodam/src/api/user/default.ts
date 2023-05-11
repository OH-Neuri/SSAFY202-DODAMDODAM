import { SignupUserType } from "@/types/userTypes";
import { defaultAxios } from "../common";

export const sendAuthSMS = (phone: string, role: number) => {
    const data = {
        phone: phone,
        role: role,
    }
    defaultAxios.post(`sms/user`, data
    ).then((res)=>{
        console.log(res.data.result)
    }).catch((err)=>{
        console.log(err)
    })
};

export const checkAuthSMS = async (phone: string, code: string) => {
    let bool;
    const data = {
        phone: phone,
        code: code
    }
    await defaultAxios.post(`sms/user/check`, data
    ).then((res)=>{
        console.log(res.data.result)
        bool = true
    }).catch((err)=>{
        console.log(err)
        bool = false
    })
    return bool
};

export const userSignup = async (user : SignupUserType) => {
    let bool;
    await defaultAxios.post(`user`, user
    ).then((res)=>{
        console.log(res.data.result)
        sessionStorage.setItem('isLogin', 'true')
        sessionStorage.setItem('token', res.data.result.token)
        sessionStorage.setItem('name', res.data.result.name)
        bool = true
    }).catch((err)=>{
        console.log(err)
        bool = false
    })
    return bool
}

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
            sessionStorage.setItem('isLogin', 'true')
            sessionStorage.setItem('token', res.data.result.loginResponseDto.token)
            sessionStorage.setItem('name', res.data.result.loginResponseDto.name)
            payload.bool = true
            payload.kinder = res.data.result.kindergarten
        }
    }).catch((err)=>{
        console.log(err)
    })
    return payload
}