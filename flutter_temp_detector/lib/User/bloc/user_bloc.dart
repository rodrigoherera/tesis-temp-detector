import 'dart:convert';

import 'package:flutter_temp_detector/User/models/User.dart';
import 'package:flutter_temp_detector/User/models/UserResponse.dart';
import 'package:flutter_temp_detector/User/repository/user_repository.dart';
import 'package:flutter_temp_detector/src/generated/service.pb.dart';
import 'package:rxdart/rxdart.dart';

class UserBloc {
  final UserRepository _repository = UserRepository();
  final BehaviorSubject<UserResponse> _currentUser = BehaviorSubject<UserResponse>();

  login(User user) async {
    ServerResponse response = await _repository.login(user);
    if (!response.success || response.hasError()) {
      var userData = new UserResponse(user: null, error: response.error);
      _currentUser.sink.add(userData);
      return;
    }
    var ret = fromIntToJson(response.value);
    var userMod = new UserModel(
      id: ret['id'],
      name: ret['name'],
      email: ret['email'],
      jwt: ret['jwt'],
      isLoged: 1,
    );
    
    var userData = new UserResponse(user: userMod, error: "");
    _currentUser.sink.add(userData);
    _repository.setUserDB(userMod);
  }

  setUser(User user) async {
    ServerResponse response = await _repository.setUser(user);
    if (!response.success || response.hasError()) {
      var userData = new UserResponse(user: null, error: response.error);
      _currentUser.sink.add(userData);
      return;
    }
    var ret = fromIntToJson(response.value);
    var userMod = new UserModel(
      id: ret['id'],
      name: ret['name'],
      email: ret['email'],
      jwt: ret['jwt'],
      isLoged: 1,
    );
    var userData = new UserResponse(user: userMod, error: "");
    _currentUser.sink.add(userData);
    _repository.setUserDB(userMod);
  }

  checkUserLogin() async{
    List<Map<String, dynamic>> result = await _repository.getUser();
    if (result.isEmpty) {
      return;
    } else {
      var itemUser = result.map((item) => UserModel.fromMap(item)).toList();
      var userMod = new UserModel(
        id: itemUser[0].id,
        name: itemUser[0].name,
        email: itemUser[0].email,
        jwt: itemUser[0].jwt,
        isLoged: itemUser[0].isLoged,
      );
      var userData = new UserResponse(user: userMod, error: "");
      _currentUser.sink.add(userData);
    }
  }

  logOut(int id) async {
    await _repository.deleteUserDB(id)
    .then((value) => _currentUser.sink.add(null));
  }

  fromIntToJson(List<int> list) {
    var decoder = new Utf8Codec();
    var result = decoder.decode(list);
    var jsonResult = json.decode(result);
    return jsonResult;
  }
  
  dispose() {
    _currentUser.close();
  }

  BehaviorSubject<UserResponse> get currentUser => _currentUser;

}

final userBloc = UserBloc();