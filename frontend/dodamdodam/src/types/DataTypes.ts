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

export type kindergartenType = {
    [index: string] : string
    name: string
    address: string
    phone_number: string
}
