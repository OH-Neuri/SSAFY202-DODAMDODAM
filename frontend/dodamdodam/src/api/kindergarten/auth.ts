import { KindergartenType } from "@/types/DataTypes"
import axios from "axios";

export const registKindergarten = async (name: string, address: string) => {
    let bool;
    const data : KindergartenType = {
        name: name,
        address: address
    }
    const token = sessionStorage.getItem('token');
    const config = {
        headers: {
          Authorization: "Bearer " + token || "",
        },
      };
    await axios.post(`https://dodamdodam.site/api/dodam/kindergarten`, data, config
    ).then((res)=>{
        // console.log(res.data)
        sessionStorage.setItem('kindergarten', name);
        bool = true;
    }).catch((err)=>{
        console.log(err)
        bool = false;
    })
    return bool;
}
