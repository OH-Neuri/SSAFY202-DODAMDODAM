import { defaultAxios } from "@/api/common";
import { ClassType, RegistClassType } from "@/types/classType";
import { useQuery, useMutation, useQueryClient } from "react-query";

// const queryClient = useQueryClient();

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


// export const registClass = (data : RegistClassType) => useMutation({
//     mutationKey: ['class', 'regist'],
//     mutationFn: () => defaultAxios.post(`kindergarten/class`, data
//     ).then((res)=>{
//         console.log(res.data)
//     }).catch((err)=>{
//         console.log(err)
//     }),
//     onSuccess : () => {
//         console.log('성공쓰!')
//         queryClient.invalidateQueries(['class', 'list'])
//     }
// })

export const useRegistClass = () => {
    const queryClient = useQueryClient();
  
    const mutation = useMutation((data: RegistClassType) =>
      defaultAxios.post(`kindergarten/class`, data)
    );
  
    const registClass = async (data: RegistClassType) => {
      try {
        await mutation.mutateAsync(data);
        console.log('실행중...')
        queryClient.invalidateQueries(['class', 'list']);
      } catch (error) {
        console.log(error);
      }
    };
  
    return { registClass, };
  };