import { KindergartenType } from "@/types/DataTypes"
import { authAxios } from "../common";

export const registKindergarten = async (name: string, address: string) => {
    let bool;
    const data : KindergartenType = {
        name: name,
        address: address
    }
    console.log(data)
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