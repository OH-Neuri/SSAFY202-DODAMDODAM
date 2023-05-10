import { defaultAxios } from "../common"

export const getClassList = async () => {
    console.log('this is function')
    const res = await defaultAxios.get(`kindergarten/class`)
    return res.data.result;
};