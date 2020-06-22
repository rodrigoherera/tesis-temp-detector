import 'package:fixnum/fixnum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_temp_detector/Home/bloc/temperature_bloc.dart';
import 'package:flutter_temp_detector/User/bloc/user_bloc.dart';
import 'package:flutter_temp_detector/src/generated/service.pb.dart';
import 'package:intl/intl.dart';

class BodyUi extends StatefulWidget {
  @override
  _BodyUiState createState() => _BodyUiState();
}

class _BodyUiState extends State<BodyUi> {

  final List<String> _dropValue = ['7 days', '30 days', 'All'].toList();
  String _selection = '7 days';

  filterTemperature(String s) async {
    int filter = s=="7 days"? 7 : s=='30 days'? 30 : 0;
    var temperature = new Temperature();
    var castInt = Int64(userBloc.currentUser.value.user.id);
    temperature.userId = castInt;
    if (filter != 0) {
      var now = DateTime.now();
      var end = now.subtract(Duration(days: filter));
      String from = DateFormat('yyyy-MM-dd').format(now);
      String to = DateFormat('yyyy-MM-dd').format(end);
      temperature.from = from + " 23:59:59";
      temperature.to = to + " 23:59:59";
    }
    await temperatureBloc.getTemperature(temperature);
  }

  @override
  void initState() {
    super.initState();
    filterTemperature("7 days");
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    
 
    final dropdownMenuOptions = _dropValue
      .map((String item) =>
        new DropdownMenuItem<String>(value: item, child: new Text(item))
      )
      .toList();

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            width: screenHeight,
            // height: screenWidth * 1,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFF2F2F2), Color(0xFFE6E6E6)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              color: Color(0xFFE6E6E6),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 10.0),
                padding: EdgeInsets.only(right: 35.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      "Filter by",
                      style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: "Roboto",
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 5),
                    DropdownButton<String>(
                      value: _selection,
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 20,
                      elevation: 16,
                      style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: "Roboto",
                          color: Colors.black),
                      onChanged: (s) {
                        filterTemperature(s);
                        setState(() {
                          _selection = s;
                        });
                      },
                      items:dropdownMenuOptions,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 50.0),
            alignment: Alignment.center,
            height: 270,
            width: 400,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.all(Radius.circular(screenHeight / 40))),
          ),
        ],
      ),
    );
  }
}
