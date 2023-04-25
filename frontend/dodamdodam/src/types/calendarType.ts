export type oneDayType = {
  [index: string]: string[] | number;
  date: number;
  content: string[];
};

export type calendarMonthType = {
  [index: string]: string | number | oneDayType[];
  year: number;
  month: number;
  result: oneDayType[];
};
