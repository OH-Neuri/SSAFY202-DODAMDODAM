import { KinderGartenSearchType } from "@/types/DataTypes";
import { defaultAxios } from "../common";

export const searchKindergarten = async (keyword : string) => {
    let list : KinderGartenSearchType[] = [];
    await defaultAxios.get(`kindergarten/search`, {
        params : {keyword : keyword}
    }).then((res)=>{
        list = res.data.result
    }).catch((err)=>{
        console.log(err)
    })
    return list;
} 