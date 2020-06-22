import 'package:flutter/material.dart';

class AlertWidget extends StatelessWidget {

  final String title;
  final String content;
  
  AlertWidget({Key key, @required this.title, @required this.content});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(this.title),
      content: Text(this.content),
      actions: <Widget>[
        FlatButton(
          child: Text("OK"),
          onPressed: () {
            Navigator.of(context).pop();
          }, 
        ),
      ],
    );
  }
}