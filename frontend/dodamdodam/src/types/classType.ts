export type ClassType = {
    [index : string] : string | number | ClassTeacherType[]
    classSeq : number
    className : string
    age : string
    teacherInfo : ClassTeacherType[]
}

export type ClassTeacherType = {
    [index: string] : number | string,
    teacherSeq : number,
    teacherName : string
}

export type RegistClassType = {
    [index : string] : string,
    name : string,
    age : string
}