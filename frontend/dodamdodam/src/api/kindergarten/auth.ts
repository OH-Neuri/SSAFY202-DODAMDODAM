import { KindergartenType } from "@/types/DataTypes"
import { authAxios } from "../common";

export const registKindergarten = async (name: string, address: string) => {
    let bool;
    const data : KindergartenType = {
        name: name,
        address: address
    }
    await authAxios.post(`kindergarten`, data
    ).then((res)=>{
        console.log(res.data)
        bool = true;
    }).catch((err)=>{
        console.log(err)
        bool = false;
    })
    return bool;
}

export const getKindergartenInfo = async () => {
    let info : KindergartenType = {
        name: '',
        address: ''
    }
    await authAxios.get(`kindergarten`
    ).then((res)=>{
        info = res.data.result
    }).catch((err)=>{
        console.log(err)
    })
    return info
}

export const modifyKindergarten = () => {
    
}