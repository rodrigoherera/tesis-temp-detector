import 'dart:convert';
import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_temp_detector/User/bloc/config_bloc.dart';
import 'package:flutter_temp_detector/User/bloc/user_bloc.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class UserCard extends StatefulWidget {
  static String wsstr = configBloc.currentConfig.value.config.ws.trim();
  static int wsPort = configBloc.currentConfig.value.config.wsport;
  static String stringConn =
      "ws://" + wsstr.trim() + ":" + wsPort.toString() + "/ws";
  final WebSocketChannel channel = IOWebSocketChannel.connect(stringConn);
  @override
  _UserCardState createState() => _UserCardState(channel: channel);
}

class _UserCardState extends State<UserCard> {
  String value = '';
  bool isLoaded = false;
  final WebSocketChannel channel;

  _UserCardState({this.channel}) {
    channel.stream.listen((event) {
      setState(() {
        try {
          var parsedJson = json.decode(event);
          if (parsedJson['data'] != "") {
            this.value = parsedJson['data'];
            this.isLoaded = true;
          }
        } catch (e) {
          print(e.toString());
        }
      });
    });
    
    getId().then((value) => setDevice(value));
  }

  setDevice(String value) {
    String jsonString =
        '{"user": "${userBloc.currentUser.value.user.email}", "deviceid": "$value", "userid": "${userBloc.currentUser.value.user.id}"}';
    final jsonObj = json.decode(jsonString);
    final prettyString = JsonEncoder.withIndent('  ').convert(jsonObj);
    channel.sink.add(prettyString);
  }

  Future<String> getId() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      IosDeviceInfo iosDeviceInfo = await deviceInfo.iosInfo;
      return iosDeviceInfo.identifierForVendor; // unique ID on iOS
    } else {
      AndroidDeviceInfo androidDeviceInfo = await deviceInfo.androidInfo;
      return androidDeviceInfo.androidId; // unique ID on Android
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    final card = Container(
      width: 300,
      height: 250,
      margin: EdgeInsets.only(
        left: 60,
        top: 240,
      ),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.blueAccent, Color(0xFF584CD1)],
              begin: FractionalOffset(0.2, 0.0),
              end: FractionalOffset(1.0, 0.6),
              stops: [0.0, 0.6],
              tileMode: TileMode.clamp),
          borderRadius: BorderRadius.circular(20)),
    );

    final textsCard = Column(
      children: <Widget>[
        Padding(padding: EdgeInsets.fromLTRB(450, 280, 0, 0)),
        Text.rich(
          TextSpan(
            text: "Today's checking",
            style: TextStyle(
                fontSize: 30.0, fontFamily: "Roboto", color: Colors.white),
          ),
        ),
        Padding(padding: EdgeInsets.fromLTRB(0, 50, 0, 0)),
        !isLoaded
            ? Text(
                "Pending...",
                style: TextStyle(
                  fontSize: 40.0,
                  fontFamily: "Roboto",
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              )
            : Text(
                "${this.value}",
                style: TextStyle(
                  fontSize: 70.0,
                  fontFamily: "Roboto",
                  color: double.parse(this.value) > 37.00
                      ? Colors.red
                      : Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
      ],
    );
    return Stack(
      children: <Widget>[
        card,
        textsCard,
      ],
    );
  }

  // @override
  // void dispose() {
  //   channel.sink.close();
  //   super.dispose();
  // }
}
