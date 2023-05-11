export type student = {
  [index: string]: string | number;
  kidSeq: number;
  photo: string;
  kidName: string;
  birth: string;
  gender: string;
  classSeq: number;
  className: string;
  parentSeq: number;
};

export type classList = {
  [index: string]: string | number;
  classSeq: number;
  className: string;
  age: string;
  teacherInfo : any
}

export type teacher = {
  [index: string]: string | number;
  name: string;
  class: string;
};

export type kindergartenType = {
  [index: string]: string;
  name: string;
  address: string;
  phone_number: string;
};

export type teacherList = {
  [index: string]: string | number;
  teacherName: string,
  className: string,
  teacherSeq: number,
}