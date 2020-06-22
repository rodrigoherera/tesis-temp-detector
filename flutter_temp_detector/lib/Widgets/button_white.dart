import 'package:flutter/material.dart';

class ButtonWhite extends StatelessWidget {

  final String text;
  final double width;
  final double height;
  final VoidCallback onPressed;
  
  ButtonWhite({Key key, @required this.text, @required this.onPressed, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: this.onPressed,
      child: Container(
        margin: EdgeInsets.only(
          top: 70.0,
          left: 20.0,
          right: 20.0
        ),
        height: this.height,
        width: this.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: Colors.white,
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
              color: Colors.grey[800]
            ),
          ),
        ),
      ),
    );
  }
}