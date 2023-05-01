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
