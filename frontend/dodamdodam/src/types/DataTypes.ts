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

export const studentInit : student = {
  kidSeq: 0,
  photo: '',
  kidName: '',
  birth: '2012-05-14',
  gender: '',
  classSeq: 0,
  className: '',
  parentSeq: 0,
}

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

export type teacherList = {
  [index: string]: string | number;
  teacherName: string,
  className: string,
  teacherSeq: number,
}

export type KindergartenType = {
    [index: string] : string
    name: string
    address: string
}

export type KinderGartenSearchType = {
    [index : string] : number | string,
    kindergartenInfoSeq : number,
    name : string,
    director : string,
    address : string,
}

export type KindergartenInfoType = {
    [index : string] : string | number,
    kindergartenSeq : number,
    name : string, 
    address : string,
    createdAt : number,
    updatedAt : number,
}