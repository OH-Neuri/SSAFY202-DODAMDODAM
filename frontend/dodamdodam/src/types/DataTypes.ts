export type student = {
  [index: string]: string | number;
  kidSeq: number;
  photo: string;
  kidName: string;
  birth: string;
  gender: string;
  classSeq: string;
  className: string;
};

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
