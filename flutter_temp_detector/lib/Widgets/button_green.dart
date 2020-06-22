import 'package:flutter/material.dart';

class ButtonGreen extends StatelessWidget {

  final String text;
  final double width;
  final double height;
  final VoidCallback onPressed;
  
  ButtonGreen({Key key, @required this.text, @required this.onPressed, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: this.onPressed,
      child: Container(
        margin: EdgeInsets.only(
          top: 30.0,
          left: 20.0,
          right: 20.0
        ),
        height: this.height,
        width: this.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          gradient: LinearGradient(colors: [
              Color(0xFF87F476),
              Color(0XFF18B36B)
            ],
            begin: FractionalOffset(0.2, 0.0),
            end: FractionalOffset(1.0, 0.6),
            stops: [0.0, 0.6],
            tileMode: TileMode.clamp
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(4, 3),
            ),
          ],
        ),

        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 22.0,
              fontFamily: "Roboto",
              color: Colors.white
            ),
          ),
        ),
      ),
    );
  }
}