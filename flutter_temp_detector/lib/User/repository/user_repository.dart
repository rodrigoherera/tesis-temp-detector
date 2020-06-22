import 'package:flutter_temp_detector/User/models/User.dart';
import 'package:flutter_temp_detector/common/grpc_commons.dart';
import 'package:flutter_temp_detector/src/generated/service.pb.dart';
import 'package:flutter_temp_detector/src/generated/service.pbgrpc.dart';
import 'package:flutter_temp_detector/common/sqlite.dart';

class UserRepository {

  Future<ServerResponse> setUser(User user) async {
    try {
      var client = BasicServiceClient(GrpcClientSingleton().client);
      return await client.setUser(user);
    } catch (e) {
      print(e.toString());
      return ServerResponse();
    }
  }

  Future<ServerResponse> login(User user) async {
    try {
      var client = BasicServiceClient(GrpcClientSingleton().client);
      return await client.login(user);
    } catch (e) {
      print(e.toString());
      return ServerResponse();
    }
  }

  Future<List<Map<String, dynamic>>> getUser() async {
    try {
      List<Map<String, dynamic>> _result = await DB.query('users');
      return _result;
    } catch (e) {
      print(e.toString());
      return List();
    }
  }

  Future<int> setUserDB(UserModel user) async {
    try {
      var result = await DB.insert('users', user);
      return result;
    } catch (e) {
      print(e.toString());
      return 0;
    }
  } 

  Future<int> deleteUserDB(int id) async {
    try {      
      var result = await DB.delete('users', id);
      return result;
    } catch (e) {
      print(e.toString());
      return 0;
    }
  }
}