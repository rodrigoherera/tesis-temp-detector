import 'package:flutter_temp_detector/common/grpc_commons.dart';
import 'package:flutter_temp_detector/src/generated/service.pb.dart';
import 'package:flutter_temp_detector/src/generated/service.pbgrpc.dart';

class TemperatureRepository {

  Future<GetTemperatures> getTemperature(Temperature temperature) async {
    var client = BasicServiceClient(GrpcClientSingleton().client);
    return await client.get(temperature);
  }
}