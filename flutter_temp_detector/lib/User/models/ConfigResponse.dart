import 'package:flutter_temp_detector/User/models/Config.dart';

class ConfigResponse {
  final ConfigModel config;
  final String error;

  ConfigResponse({this.config, this.error});

  ConfigResponse.withError(String errorValue)
      : config = null,
        error = errorValue;
}
