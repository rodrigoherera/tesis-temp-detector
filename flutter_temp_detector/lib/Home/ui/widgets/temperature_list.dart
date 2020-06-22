import 'dart:ffi';

import 'package:fixnum/fixnum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_temp_detector/Home/bloc/temperature_bloc.dart';
import 'package:flutter_temp_detector/Home/ui/widgets/temperature.dart';
import 'package:flutter_temp_detector/User/bloc/user_bloc.dart';
import 'package:flutter_temp_detector/src/generated/service.pb.dart';

class TemperatureList extends StatefulWidget {
  @override
  _TemperatureListState createState() => _TemperatureListState();
}

class _TemperatureListState extends State<TemperatureList> {
  @override
  void initState() {
    super.initState();

    var temperature = new Temperature();
    var castInt = Int64(userBloc.currentUser.value.user.id);
    temperature.userId = castInt;
    temperatureBloc..getTemperature(temperature);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Temperature>>(
        stream: temperatureBloc.subject.stream,
        builder:
            (BuildContext context, AsyncSnapshot<List<Temperature>> snapshot) {
          if (snapshot.hasData) {
            return _buildTemperatureWidget(snapshot.data);
          } else {
            return _buildLoadingWidget();
          }
        });
  }

  Widget _buildLoadingWidget() {
    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 25.0,
              width: 25.0,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),
          ]),
    );
  }

  Widget _buildTemperatureWidget(List<Temperature> temperature) {
    if (temperature.length == 0) {
      return Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "There's no data",
              style: TextStyle(
                fontFamily: "Roboto",
                fontSize: 30,
              ),
            )
          ],
        ),
      );
    } else
      return Container(
        child: ListView.builder(
          padding: EdgeInsets.only(top: 5),
          physics: BouncingScrollPhysics(),
          itemCount: temperature.length,
          itemBuilder: (BuildContext context, int index) => Column(
            children: <Widget>[
              TemperatureWidget(
                  temperature[index].value, temperature[index].date),
              SizedBox(
                height: 10,
              )
            ],
          ),
      ));
  }
}
