export type oneSceduleType = {
  [index: string]: string | number;
  scheduleSeq: number;
  type: string;
  content: string;
};

export type calendarMonthType = {
  [index: string]: string | number | number[] | object;
  year: number;
  month: number;
  dateNumber: number[];
  schedule: {
    [index: string]: oneSceduleType[];
  };
};

export type scheduleTypeType = {
  [index: string]: number | string;
  scheduleTypeSeq: number;
  content: string;
};

export type oneFoodType = {
  [index: string]: number | string | null;
  date: string | null;
  rice: string | null;
  soup: string | null;
  dish1: string | null;
  dish2: string | null;
  dish3: string | null;
  morningSnack1: string | null;
  morningSnack2: string | null;
  afternoonSnack1: string | null;
  afternoonSnack2: string | null;
};

export type foodMonthType = {
  [index: string]: string | number | number[] | object;
  year: number;
  month: number;
  dateNumber: number[];
  food: {
    [index: string]: oneFoodType;
  };
};

// 스케줄 타입 변경을 위한 타입
export type scheduleSendType = {
  [index: string]: number | string | null;
  scheduleTypeSeq: number | null;
  content: string | null;
};
