export type oneDayType = {
  [index: string]: string | Date;
  date: Date;
  content: string;
};

export type calendarMonthType = {
  [index: string]: string | number | oneDayType[];
  year: number;
  month: number;
  result: oneDayType[];
};
