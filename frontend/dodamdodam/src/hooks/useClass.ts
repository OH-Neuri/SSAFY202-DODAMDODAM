import { defaultAxios } from "@/api/common";
import { ClassType } from "@/types/classType";
import { useQuery } from "react-query";

export const useClass = () => useQuery<ClassType[]>({
queryKey: ['class', 'list'],
queryFn: () => defaultAxios.get(`kindergarten/class`
).then((res)=>{
    console.log(res.data.result)
    return res.data.result
}).catch((err)=>{
    console.log(err)
})
});