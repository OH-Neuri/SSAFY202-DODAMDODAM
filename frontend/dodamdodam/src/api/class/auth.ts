import { SendTeacherAuthType } from "@/types/classType";
import { defaultAxios } from "../common";

export const sendAddTeacherAuthCode = (data : SendTeacherAuthType) => {
    defaultAxios.post(`sms/teacher`, data
    ).then((res)=>{
        // console.log(res.data)
    }).catch((err)=>{
        console.log(err)
    })
}