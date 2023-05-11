import { authAxios } from "@/api/common";
import { KindergartenInfoType, KindergartenType } from "@/types/DataTypes";
import { useQuery, useMutation, useQueryClient } from "react-query";

export const useKindergarten = () => useQuery<KindergartenInfoType>({
  queryKey: ['kindergarten', 'info'],
  queryFn: () => authAxios.get(`kindergarten`
  ).then((res)=>{
    return res.data.result
  }).catch((err)=>{
    console.log(err)
  })
})

export const useModifyKindergarten = () => {
  const queryClient = useQueryClient();
  
  const modify = useMutation((data : KindergartenType) => 
    authAxios.put(`kindergarten`, data)
  );
  const modifyKindergarten = async (data: KindergartenType) => {
    try {
      await modify.mutateAsync(data)
      queryClient.invalidateQueries(['kindergarten', 'info'])
    } catch (e) {
      console.log(e)
    }
  }
  return { modifyKindergarten }
}
