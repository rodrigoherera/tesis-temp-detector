import 'package:flutter_temp_detector/User/models/User.dart';

class UserResponse { 

  final UserModel user;
  final String error;

  UserResponse({this.user, this.error});

  UserResponse.withError(String errorValue)
    : user = null,
    error = errorValue;
}