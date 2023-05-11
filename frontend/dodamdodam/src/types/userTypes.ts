export type SignupUserType = {
    [index : string] : string | number,
    id : string,
    password : string,
    phone : string,
    name : string,
    role : number
}

export type LoginUserType = {
    [index : string] : string | number,
    id : string,
    name : string,
    role : number,
    token : string
}