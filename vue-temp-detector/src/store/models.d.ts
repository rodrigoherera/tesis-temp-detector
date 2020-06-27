export interface IUser {
  id: number;
  name: string;
  lastname: string;
  email: string;
  jwt: string;
}
export interface ILogin {
  email: string;
  password: string;
}
export interface IRegister {
  name: string;
  lastname: string;
  email: string;
  password: string;
}

export interface ITemperature {
  userId: number;
  date: string;
  value: string;
}

export interface IFilters {
  userId: number;
  dateFrom: string;
  dateTo: string;
}