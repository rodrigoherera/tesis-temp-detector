import 'package:flutter_temp_detector/User/models/Config.dart';
import 'package:flutter_temp_detector/common/sqlite.dart';

class ConfigRepository {

  Future<List<Map<String, dynamic>>> getConfig() async {
    try {
      List<Map<String, dynamic>> _result = await DB.query('configs');
      return _result;
    } catch (e) {
      print(e.toString());
      return List();
    }
  }

  Future<int> setConfigDB(ConfigModel config) async {
    try {
      var result = await DB.insertConfig('configs', config);
      return result;
    } catch (e) {
      print(e.toString());
      return 0;
    }
  } 

    Future<int> updateConfig(ConfigModel config) async {
    try {
      var result = await DB.updateConfig('configs', config);
      return result;
    } catch (e) {
      print(e.toString());
      return 0;
    }
  } 
}