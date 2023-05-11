export type student = {
    [index: string]: string | number;
    image: string;
    name: string;
    birth: string;
    gender: string;
    class: string;
};

export type teacher = {
    [index: string]: string | number;
    name: string;
    class: string;
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