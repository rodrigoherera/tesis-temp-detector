import 'package:flutter/material.dart';
import 'package:flutter_temp_detector/User/bloc/user_bloc.dart';
import 'package:flutter_temp_detector/Widgets/alert.dart';
import 'package:flutter_temp_detector/Widgets/gradient_background.dart';
import 'package:flutter_temp_detector/Widgets/button_white.dart';
import 'package:flutter_temp_detector/Widgets/custom_text_field.dart';
import 'package:flutter_temp_detector/src/generated/service.pb.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String title;
  String content;
  bool isLoading = false;

  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

  _login() async {
    if (this.controllerEmail.text == "" || this.controllerPassword.text == "") {
      this.title = "Error";
      this.content = "Complete the required fields!";
      _showDialog();
      setState(() {
        isLoading = false;
      });
      return;
    } else {
      var newUser = new User();
      newUser.email = this.controllerEmail.text;
      newUser.password = this.controllerPassword.text;

      await userBloc.login(newUser);
      if (userBloc.currentUser.value.error == "" || userBloc.currentUser.value.user != null) {
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        this.title = "Error";
        this.content = userBloc.currentUser.value.error;
        _showDialog();
      }
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> _showDialog() async {
    return showDialog<void>(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertWidget(title: this.title, content: this.content);
        });
  }

  @override
  Widget build(BuildContext context) {
    return loginUi();
  }

  Widget loginUi() {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          GradientBack(height: null),
          Container(
            padding: EdgeInsets.only(top: 40, left: 5.0),
            child: SizedBox(
              height: 45.0,
              width: 45.0,
              child: IconButton(
                icon: Icon(Icons.keyboard_arrow_left,
                    color: Colors.white, size: 30),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/');
                },
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 37.0,
                    fontFamily: "Roboto",
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 20)),
                CustomTextField(
                  hintText: "Email*",
                  typeState: controllerEmail,
                  inputType: TextInputType.emailAddress,
                  autovalidate: true,
                  obscureText: false,
                  width: 350,
                ),
                Padding(padding: EdgeInsets.only(top: 20)),
                CustomTextField(
                  hintText: "Password*",
                  typeState: controllerPassword,
                  inputType: TextInputType.text,
                  autovalidate: false,
                  obscureText: true,
                  width: 350,
                ),
                !isLoading
                    ? ButtonWhite(
                        text: "Login",
                        onPressed: () {
                          setState(() {
                            isLoading = true;
                          });
                          _login();
                        },
                        height: 50.0,
                        width: 200)
                    : Container(
                        padding: EdgeInsets.only(top: 15),
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
