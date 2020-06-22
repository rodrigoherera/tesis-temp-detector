import 'package:flutter/material.dart';

class CustomTextField  extends StatelessWidget {
  
  final TextEditingController typeState;
  final TextInputType inputType;
  final String hintText;
  final bool autovalidate;
  final bool obscureText;
  final double width;

  CustomTextField({Key key, @required this.hintText, @required this.typeState, 
    @required this.inputType, this.autovalidate, this.obscureText, @required this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextFormField(
        controller: typeState,
        keyboardType: inputType,
        style: TextStyle(
          color: Colors.black,
        ),
        decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide:
                  BorderSide(color: Colors.amber, style: BorderStyle.solid),
            ),
            hintText: hintText),
        autovalidate: autovalidate,
        obscureText: obscureText,
      ),
    );
  }
}