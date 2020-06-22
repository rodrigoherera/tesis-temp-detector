import 'package:flutter/material.dart';
import 'package:flutter_temp_detector/Home/ui/screens/home_screen.dart';
import 'package:flutter_temp_detector/User/bloc/user_bloc.dart';
import 'package:flutter_temp_detector/User/models/UserResponse.dart';
import 'package:flutter_temp_detector/Widgets/gradient_background.dart';
import 'package:flutter_temp_detector/Widgets/button_green.dart';
import 'package:flutter_temp_detector/Widgets/button_white.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {

  @override
  Widget build(BuildContext context) {
    return _handleCurrentSession();
  }

  Widget _handleCurrentSession() {
    return StreamBuilder<UserResponse>(
      stream: userBloc.currentUser.stream,
      builder: (BuildContext context, AsyncSnapshot<UserResponse> snapshot) {
        if (!snapshot.hasData) {
          return authUi();
        } else if (!snapshot.hasError) {
          return HomeScreen();
        } else {
          return loading();
        }
      },
    );
  }

  Widget loading() {
    return Container(
      padding: EdgeInsets.only(top: 15),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget authUi() {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF4268DE),
        actions: <Widget>[
          GestureDetector(
            child: Icon(
              Icons.build
            ),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/config');
            },
          ),
          Padding(padding: EdgeInsets.only(right:10)),
        ],
      ),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          GradientBack(height: null),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Welcome \n This is Temp Detector",
                style: TextStyle(
                  fontSize: 37.0,
                  fontFamily: "Roboto",
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ButtonWhite(
                  text: "Login",
                  onPressed: () =>
                      {Navigator.pushReplacementNamed(context, '/login')},
                  height: 50.0,
                  width: 300),
              ButtonGreen(
                  text: "Register",
                  onPressed: () => {
                        Navigator.pushReplacementNamed(context, '/register'),
                      },
                  height: 50.0,
                  width: 300),
              Container(
                margin: EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
              ),
              Text(
                "Other options",
                style: TextStyle(
                  fontSize: 15.0,
                  fontFamily: "Roboto",
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
