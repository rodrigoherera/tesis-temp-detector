import 'package:flutter/material.dart';

class TemperatureWidget extends StatelessWidget {
  TemperatureWidget(this.valueTemp, this.date);

  final String valueTemp;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                this.valueTemp,
                style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: double.parse(this.valueTemp) > 37.00 ? Colors.red: Colors.green),
              ),
              Text(
                this.date,
                style: TextStyle(
                    fontFamily: "Roboto", fontSize: 15.0, color: Colors.grey),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
