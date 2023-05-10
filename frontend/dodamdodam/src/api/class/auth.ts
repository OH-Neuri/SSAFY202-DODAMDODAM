import { defaultAxios } from "../common"

export const getClassList = async () => {
    const res = await defaultAxios.get(`kindergarten/class`)
    return res.data.result;
};