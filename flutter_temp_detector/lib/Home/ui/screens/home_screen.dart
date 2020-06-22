import 'package:flutter/material.dart';
import 'package:flutter_temp_detector/Home/ui/widgets/body_widget.dart';
import 'package:flutter_temp_detector/Home/ui/widgets/card.dart';
import 'package:flutter_temp_detector/Home/ui/widgets/header.dart';
import 'package:flutter_temp_detector/Home/ui/widgets/temperature_list.dart';
import 'package:flutter_temp_detector/User/bloc/user_bloc.dart';
import 'package:flutter_temp_detector/User/models/UserResponse.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UserResponse>(
        stream: userBloc.currentUser.stream,
        builder: (context, AsyncSnapshot<UserResponse> snapshot) {
          if (!snapshot.hasData || snapshot.hasError || snapshot.data.user == null) {
            return Container(
              padding: EdgeInsets.only(top: 15),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else
            return Scaffold(
              body: Stack(
                children: <Widget>[
                  Container(
                    child: Header(
                      height: 220.0,
                      userName: snapshot.data.user.name,
                    ),
                  ),
                  Container(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: UserCard(),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 500, 0, 0),
                    child: BodyUi(),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 550, 0, 0),
                    child: TemperatureList(),
                  ),
                ],
              ),
            );
        });
  }
}
