import * as grpcWeb from 'grpc-web';

import {
  GetTemperatures,
  GetUsers,
  ServerResponse,
  Temperature,
  User} from './service_pb';

export class BasicServiceClient {
  constructor (hostname: string,
               credentials?: null | { [index: string]: string; },
               options?: null | { [index: string]: string; });

  setUser(
    request: User,
    metadata: grpcWeb.Metadata | undefined,
    callback: (err: grpcWeb.Error,
               response: ServerResponse) => void
  ): grpcWeb.ClientReadableStream<ServerResponse>;

  getUser(
    request: User,
    metadata: grpcWeb.Metadata | undefined,
    callback: (err: grpcWeb.Error,
               response: GetUsers) => void
  ): grpcWeb.ClientReadableStream<GetUsers>;

  login(
    request: User,
    metadata: grpcWeb.Metadata | undefined,
    callback: (err: grpcWeb.Error,
               response: ServerResponse) => void
  ): grpcWeb.ClientReadableStream<ServerResponse>;

  get(
    request: Temperature,
    metadata: grpcWeb.Metadata | undefined,
    callback: (err: grpcWeb.Error,
               response: GetTemperatures) => void
  ): grpcWeb.ClientReadableStream<GetTemperatures>;

}

export class BasicServicePromiseClient {
  constructor (hostname: string,
               credentials?: null | { [index: string]: string; },
               options?: null | { [index: string]: string; });

  setUser(
    request: User,
    metadata?: grpcWeb.Metadata
  ): Promise<ServerResponse>;

  getUser(
    request: User,
    metadata?: grpcWeb.Metadata
  ): Promise<GetUsers>;

  login(
    request: User,
    metadata?: grpcWeb.Metadata
  ): Promise<ServerResponse>;

  get(
    request: Temperature,
    metadata?: grpcWeb.Metadata
  ): Promise<GetTemperatures>;

}

