import 'package:flutter_temp_detector/User/bloc/config_bloc.dart';
import 'package:grpc/grpc.dart';

class GrpcClientSingleton {
  ClientChannel client;
  static final GrpcClientSingleton _singleton =
  new GrpcClientSingleton._internal();

  factory GrpcClientSingleton() => _singleton;

  GrpcClientSingleton._internal() {
    client = ClientChannel(configBloc.currentConfig.value.config.grpc.trim(), // Your IP here, localhost might not work.
        port: configBloc.currentConfig.value.config.grpcport,
        options: ChannelOptions(
          credentials: ChannelCredentials.insecure(),
          idleTimeout: Duration(minutes: 1),
        ));
  }
}