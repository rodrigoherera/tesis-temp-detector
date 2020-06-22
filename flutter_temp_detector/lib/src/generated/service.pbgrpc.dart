///
//  Generated code. Do not modify.
//  source: service.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'service.pb.dart' as $0;
export 'service.pb.dart';

class BasicServiceClient extends $grpc.Client {
  static final _$setUser = $grpc.ClientMethod<$0.User, $0.ServerResponse>(
      '/proto.BasicService/SetUser',
      ($0.User value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ServerResponse.fromBuffer(value));
  static final _$getUser = $grpc.ClientMethod<$0.User, $0.GetUsers>(
      '/proto.BasicService/GetUser',
      ($0.User value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetUsers.fromBuffer(value));
  static final _$login = $grpc.ClientMethod<$0.User, $0.ServerResponse>(
      '/proto.BasicService/Login',
      ($0.User value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ServerResponse.fromBuffer(value));
  static final _$get = $grpc.ClientMethod<$0.Temperature, $0.GetTemperatures>(
      '/proto.BasicService/Get',
      ($0.Temperature value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetTemperatures.fromBuffer(value));

  BasicServiceClient($grpc.ClientChannel channel, {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseFuture<$0.ServerResponse> setUser($0.User request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$setUser, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.GetUsers> getUser($0.User request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$getUser, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.ServerResponse> login($0.User request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$login, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.GetTemperatures> get($0.Temperature request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$get, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }
}

abstract class BasicServiceBase extends $grpc.Service {
  $core.String get $name => 'proto.BasicService';

  BasicServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.User, $0.ServerResponse>(
        'SetUser',
        setUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.User.fromBuffer(value),
        ($0.ServerResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.User, $0.GetUsers>(
        'GetUser',
        getUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.User.fromBuffer(value),
        ($0.GetUsers value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.User, $0.ServerResponse>(
        'Login',
        login_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.User.fromBuffer(value),
        ($0.ServerResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Temperature, $0.GetTemperatures>(
        'Get',
        get_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Temperature.fromBuffer(value),
        ($0.GetTemperatures value) => value.writeToBuffer()));
  }

  $async.Future<$0.ServerResponse> setUser_Pre(
      $grpc.ServiceCall call, $async.Future<$0.User> request) async {
    return setUser(call, await request);
  }

  $async.Future<$0.GetUsers> getUser_Pre(
      $grpc.ServiceCall call, $async.Future<$0.User> request) async {
    return getUser(call, await request);
  }

  $async.Future<$0.ServerResponse> login_Pre(
      $grpc.ServiceCall call, $async.Future<$0.User> request) async {
    return login(call, await request);
  }

  $async.Future<$0.GetTemperatures> get_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Temperature> request) async {
    return get(call, await request);
  }

  $async.Future<$0.ServerResponse> setUser(
      $grpc.ServiceCall call, $0.User request);
  $async.Future<$0.GetUsers> getUser($grpc.ServiceCall call, $0.User request);
  $async.Future<$0.ServerResponse> login(
      $grpc.ServiceCall call, $0.User request);
  $async.Future<$0.GetTemperatures> get(
      $grpc.ServiceCall call, $0.Temperature request);
}
