import 'package:flutter/material.dart';
import 'package:flutter_temp_detector/User/bloc/user_bloc.dart';
import 'package:flutter_temp_detector/Widgets/alert.dart';
import 'package:flutter_temp_detector/Widgets/gradient_background.dart';
import 'package:flutter_temp_detector/Widgets/button_white.dart';
import 'package:flutter_temp_detector/Widgets/custom_text_field.dart';
import 'package:flutter_temp_detector/src/generated/service.pb.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  String res;
  String err;
  bool result;
  String title;
  String content;
  bool isLoading = false;

  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerLastName = TextEditingController();
  
  _register() async {
    if (this.controllerEmail.text == "" || this.controllerLastName.text == "" || this.controllerName.text == "" || this.controllerPassword.text == "" ){
      this.title = "Error";
      this.content = "Complete the required fields!";
      _showDialog();
      setState(() {
        isLoading = false;
      });
      return;
    }else{
      var newUser = new User();
      newUser.name = this.controllerName.text.trim();
      newUser.lastName = this.controllerLastName.text.trim();
      newUser.email = this.controllerEmail.text.trim();
      newUser.password = this.controllerPassword.text;
      
      await userBloc.setUser(newUser);
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
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return signInUi();
  }

  Widget signInUi() {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          GradientBack(height: null),
          Container(
            padding: EdgeInsets.only(top:40, left: 5.0),
            child: SizedBox(
              height: 45.0,
              width: 45.0,
              child: IconButton(
                icon: Icon(Icons.keyboard_arrow_left, color: Colors.white, size: 30), 
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
                  "Register",
                  style: TextStyle(
                    fontSize: 37.0,
                    fontFamily: "Roboto",
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 20)),
                CustomTextField(
                  hintText: "Name*", 
                  typeState: controllerName,
                  inputType: TextInputType.text,
                  autovalidate: true,
                  obscureText: false,
                  width: 350,
                ),
                Padding(padding: EdgeInsets.only(top: 10)),
                CustomTextField(
                  hintText: "Last Name*", 
                  typeState: controllerLastName,
                  inputType: TextInputType.text,
                  autovalidate: true,
                  obscureText: false,
                  width: 350,
                ),
                Padding(padding: EdgeInsets.only(top: 10)),
                CustomTextField(
                  hintText: "Email*", 
                  typeState: controllerEmail,
                  inputType: TextInputType.emailAddress,
                  autovalidate: true,
                  obscureText: false,
                  width: 350,
                ),
                Padding(padding: EdgeInsets.only(top: 10)),
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
                      text: "Send", 
                      onPressed:() {
                        setState(() {
                          isLoading = true;
                        });
                        _register();
                      }, 
                      height: 50.0, 
                      width: 300)
                  : Container(
                      padding:EdgeInsets.only(top: 15),
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                Padding(padding: EdgeInsets.only(top: 20)),
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
          ),
        ],
      ),
    );
  }
}
