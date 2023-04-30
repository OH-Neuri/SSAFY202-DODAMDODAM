export type oneSceduleType = {
  [index: string]: string;
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

export type classificationType = {
  [index: string]: number | string;
  scheduleTypeSeq: number;
  content: string;
};

export type classificationNullType = {
  [index: string]: number | string | null;
  scheduleTypeSeq: number | null;
  content: string | null;
};
