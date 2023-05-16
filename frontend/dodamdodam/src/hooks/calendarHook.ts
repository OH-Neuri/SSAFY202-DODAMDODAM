import { authAxios, defaultAxios } from "@/api/common";
import {
  calendarMonthType,
  foodMonthType,
  oneFoodType,
  oneSceduleType,
  scheduleSendType,
  scheduleTypeType,
} from "@/types/calendarType";
import { useQuery, useMutation, useQueryClient } from "react-query";

// 한 달의 일정 받아오기
export const useMonthCalendar = (year: number, month: number) =>
  useQuery<calendarMonthType>({
    queryKey: ["calendar", year, month],
    queryFn: () =>
      authAxios
        .get(`kindergarten/schedule/month`, {
          params: { year: year, month: month },
        })
        .then((res) => {
          return res.data.result;
        })
        .catch((err) => {
          console.log(err);
        }),
  });

// 하루의 일정
export const useDayCalendar = (year: number, month: number, day: number) =>
  useQuery<oneSceduleType[]>({
    queryKey: ["calendarDay", year, month, day],
    queryFn: () =>
      authAxios
        .get(`kindergarten/schedule`, {
          params: { year: year, month: month, day: day },
        })
        .then((res) => {
          return res.data.result;
        })
        .catch((err) => {
          console.log(err);
        }),
  });

export const useManageDayCalendar = () => {
  const queryClient = useQueryClient();

  //등록
  const regist = useMutation(
    (data: {
      scheduleTypeSeq: number;
      content: string;
      date: string;
      year: number;
      month: number;
      day: number;
    }) =>
      authAxios.post(`kindergarten/schedule`, {
        scheduleTypeSeq: data.scheduleTypeSeq,
        content: data.content,
        date: data.date,
      })
  );
  const registSchedule = async (data: {
    scheduleTypeSeq: number;
    content: string;
    date: string;
    year: number;
    month: number;
    day: number;
  }) => {
    try {
      await regist.mutateAsync(data);
      queryClient.invalidateQueries([
        "calendarDay",
        data.year,
        data.month,
        data.day,
      ]);
      queryClient.invalidateQueries(["calendar", data.year, data.month]);
    } catch (e) {
      console.log(e);
    }
  };

  // 삭제
  const deleteSchedule = useMutation((scheduleSeq: number) =>
    authAxios.delete(`kindergarten/schedule/${scheduleSeq}`)
  );
  const deleteFunction = async (data: {
    scheduleSeq: number;
    year: number;
    month: number;
    day: number;
  }) => {
    try {
      await deleteSchedule.mutateAsync(data.scheduleSeq);
      queryClient.invalidateQueries([
        "calendarDay",
        data.year,
        data.month,
        data.day,
      ]);
      queryClient.invalidateQueries(["calendar", data.year, data.month]);
    } catch (e) {
      console.log(e);
    }
  };

  return { registSchedule, deleteFunction };
};

// 일정 분류 관리
export const useCalendarType = () =>
  useQuery<scheduleTypeType[]>({
    queryKey: ["calendar", "type"],
    queryFn: () =>
      authAxios
        .get(`kindergarten/scheduleType`)
        .then((res) => {
          return res.data.result;
        })
        .catch((err) => {
          console.log(err);
        }),
  });

export const useManageCalendarType = () => {
  const queryClient = useQueryClient();

  //등록
  const regist = useMutation((data: scheduleSendType[]) =>
    authAxios.post(`kindergarten/scheduleType`, data)
  );
  const registScheduleType = async (data: scheduleSendType[]) => {
    try {
      console.log(data);
      await regist.mutateAsync(data);
      queryClient.invalidateQueries(["calendar", "type"]);
    } catch (e) {
      console.log(e);
    }
  };

  return { registScheduleType };
};

// 한 달 식단 받아오기
export const useMonthFood = (year: number, month: number) =>
  useQuery<foodMonthType>({
    queryKey: ["food", year, month],
    queryFn: () =>
      authAxios
        .get(`kindergarten/food/month`, {
          params: { year: year, month: month },
        })
        .then((res) => {
          return res.data.result;
        })
        .catch((err) => {
          console.log(err);
        }),
  });

// 하루의 식단
export const useDayFood = (year: number, month: number, day: number) =>
  useQuery<oneFoodType>({
    queryKey: ["foodDay", year, month, day],
    queryFn: () =>
      authAxios
        .get(`kindergarten/food`, {
          params: { year: year, month: month, day: day },
        })
        .then((res) => {
          return res.data.result;
        })
        .catch((err) => {
          if (err.response.status == 500)
            console.log("해당 날의 식단이 없습니다.");
          else {
            console.log(err);
          }
        }),
  });

export const useManageDayFood = () => {
  const queryClient = useQueryClient();

  const regist = useMutation((data: oneFoodType) =>
    authAxios.post(`kindergarten/food`, data)
  );

  const registFood = async (data: {
    foodData: oneFoodType;
    year: number;
    month: number;
    day: number;
  }) => {
    try {
      await regist.mutateAsync(data.foodData);
      queryClient.invalidateQueries([
        "foodDay",
        data.year,
        data.month,
        data.day,
      ]);
      queryClient.invalidateQueries(["food", data.year, data.month]);
    } catch (e) {
      console.log(e);
    }
  };

  return { registFood };
};
