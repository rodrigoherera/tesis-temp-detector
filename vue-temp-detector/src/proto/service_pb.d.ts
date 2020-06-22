import * as jspb from "google-protobuf"

export class User extends jspb.Message {
  getId(): number;
  setId(value: number): User;

  getName(): string;
  setName(value: string): User;

  getLastName(): string;
  setLastName(value: string): User;

  getEmail(): string;
  setEmail(value: string): User;

  getPassword(): string;
  setPassword(value: string): User;

  getAdmin(): boolean;
  setAdmin(value: boolean): User;

  serializeBinary(): Uint8Array;
  toObject(includeInstance?: boolean): User.AsObject;
  static toObject(includeInstance: boolean, msg: User): User.AsObject;
  static serializeBinaryToWriter(message: User, writer: jspb.BinaryWriter): void;
  static deserializeBinary(bytes: Uint8Array): User;
  static deserializeBinaryFromReader(message: User, reader: jspb.BinaryReader): User;
}

export namespace User {
  export type AsObject = {
    id: number,
    name: string,
    lastName: string,
    email: string,
    password: string,
    admin: boolean,
  }
}

export class Temperature extends jspb.Message {
  getUserId(): number;
  setUserId(value: number): Temperature;

  getDate(): string;
  setDate(value: string): Temperature;

  getValue(): string;
  setValue(value: string): Temperature;

  getFrom(): string;
  setFrom(value: string): Temperature;

  getTo(): string;
  setTo(value: string): Temperature;

  serializeBinary(): Uint8Array;
  toObject(includeInstance?: boolean): Temperature.AsObject;
  static toObject(includeInstance: boolean, msg: Temperature): Temperature.AsObject;
  static serializeBinaryToWriter(message: Temperature, writer: jspb.BinaryWriter): void;
  static deserializeBinary(bytes: Uint8Array): Temperature;
  static deserializeBinaryFromReader(message: Temperature, reader: jspb.BinaryReader): Temperature;
}

export namespace Temperature {
  export type AsObject = {
    userId: number,
    date: string,
    value: string,
    from: string,
    to: string,
  }
}

export class GetUsers extends jspb.Message {
  getUserList(): Array<User>;
  setUserList(value: Array<User>): GetUsers;
  clearUserList(): GetUsers;
  addUser(value?: User, index?: number): User;

  serializeBinary(): Uint8Array;
  toObject(includeInstance?: boolean): GetUsers.AsObject;
  static toObject(includeInstance: boolean, msg: GetUsers): GetUsers.AsObject;
  static serializeBinaryToWriter(message: GetUsers, writer: jspb.BinaryWriter): void;
  static deserializeBinary(bytes: Uint8Array): GetUsers;
  static deserializeBinaryFromReader(message: GetUsers, reader: jspb.BinaryReader): GetUsers;
}

export namespace GetUsers {
  export type AsObject = {
    userList: Array<User.AsObject>,
  }
}

export class GetTemperatures extends jspb.Message {
  getTemperaturesList(): Array<Temperature>;
  setTemperaturesList(value: Array<Temperature>): GetTemperatures;
  clearTemperaturesList(): GetTemperatures;
  addTemperatures(value?: Temperature, index?: number): Temperature;

  serializeBinary(): Uint8Array;
  toObject(includeInstance?: boolean): GetTemperatures.AsObject;
  static toObject(includeInstance: boolean, msg: GetTemperatures): GetTemperatures.AsObject;
  static serializeBinaryToWriter(message: GetTemperatures, writer: jspb.BinaryWriter): void;
  static deserializeBinary(bytes: Uint8Array): GetTemperatures;
  static deserializeBinaryFromReader(message: GetTemperatures, reader: jspb.BinaryReader): GetTemperatures;
}

export namespace GetTemperatures {
  export type AsObject = {
    temperaturesList: Array<Temperature.AsObject>,
  }
}

export class ServerResponse extends jspb.Message {
  getSuccess(): boolean;
  setSuccess(value: boolean): ServerResponse;

  getValue(): Uint8Array | string;
  getValue_asU8(): Uint8Array;
  getValue_asB64(): string;
  setValue(value: Uint8Array | string): ServerResponse;

  getError(): string;
  setError(value: string): ServerResponse;

  serializeBinary(): Uint8Array;
  toObject(includeInstance?: boolean): ServerResponse.AsObject;
  static toObject(includeInstance: boolean, msg: ServerResponse): ServerResponse.AsObject;
  static serializeBinaryToWriter(message: ServerResponse, writer: jspb.BinaryWriter): void;
  static deserializeBinary(bytes: Uint8Array): ServerResponse;
  static deserializeBinaryFromReader(message: ServerResponse, reader: jspb.BinaryReader): ServerResponse;
}

export namespace ServerResponse {
  export type AsObject = {
    success: boolean,
    value: Uint8Array | string,
    error: string,
  }
}

