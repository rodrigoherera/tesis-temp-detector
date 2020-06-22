import 'package:flutter_temp_detector/User/models/Config.dart';
import 'package:flutter_temp_detector/User/models/ConfigResponse.dart';
import 'package:flutter_temp_detector/User/repository/config_repository.dart';
import 'package:rxdart/rxdart.dart';

class ConfigBloc {
  final ConfigRepository _repository = ConfigRepository();
  final BehaviorSubject<ConfigResponse> _currentConfig =
      BehaviorSubject<ConfigResponse>();

  setConfig(ConfigModel config) async {
    await _repository.setConfigDB(config);

    ConfigResponse configData = new ConfigResponse(config: config, error: "");
    _currentConfig.sink.add(configData);
  }

  updateConfig(ConfigModel config) async {
    await _repository.updateConfig(config);

    ConfigResponse configData = new ConfigResponse(config: config, error: "");
    _currentConfig.sink.add(configData);
  }

  getConfig() async {
    List<Map<String, dynamic>> result = await _repository.getConfig();

    if (result.isEmpty) {
      var configData = new ConfigResponse(config: null, error: "Empty");
      _currentConfig.sink.add(configData);
      return;
    } else {
      var itemConfig = result.map((item) => ConfigModel.fromMap(item)).toList();
      var config = new ConfigModel(
        id: itemConfig[0].id,
        grpc: itemConfig[0].grpc.trim(),
        grpcport: itemConfig[0].grpcport,
        ws: itemConfig[0].ws.trim(),
        wsport: itemConfig[0].wsport,
      );

      var configData = new ConfigResponse(config: config, error: "");
      _currentConfig.sink.add(configData);
    }
  }

  dispose() {
    _currentConfig.close();
  }

  BehaviorSubject<ConfigResponse> get currentConfig => _currentConfig;
}

final configBloc = ConfigBloc();
