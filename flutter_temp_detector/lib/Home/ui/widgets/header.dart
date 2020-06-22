import 'package:flutter/material.dart';
import 'package:flutter_temp_detector/User/bloc/user_bloc.dart';

class Header extends StatelessWidget {
  String userName = "";
  double height = 0.0;

  Header({Key key, this.height, this.userName});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidht = MediaQuery.of(context).size.width;

    _logOut() async {
      int id = userBloc.currentUser.value.user.id;
      await userBloc.logOut(id);
      if (userBloc.currentUser.value == null) {
        Navigator.pushReplacementNamed(context, '/');
      }
    }

    if (height == null) {
      height = screenHeight;
    }
    return Container(
      width: screenWidht,
      height: height,
      decoration: BoxDecoration(
        color: Color(0xFF4652E2),
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              "Welcome, \n $userName \n have a nice day",
              style: TextStyle(
                fontSize: 37.0,
                fontFamily: "Roboto",
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          GestureDetector(
            child: Container(
              padding: EdgeInsets.only(bottom: 100, right: 10),
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
            onTap: () {
              _logOut();
            },
          ),
        ],
      ),
      alignment: Alignment(-0.9, 0),
    );
  }
}
