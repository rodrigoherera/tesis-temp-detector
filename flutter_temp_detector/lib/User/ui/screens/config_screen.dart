import 'package:flutter/material.dart';
import 'package:flutter_temp_detector/User/bloc/config_bloc.dart';
import 'package:flutter_temp_detector/User/models/Config.dart';
import 'package:flutter_temp_detector/User/models/ConfigResponse.dart';
import 'package:flutter_temp_detector/Widgets/alert.dart';
import 'package:flutter_temp_detector/Widgets/button_white.dart';
import 'package:flutter_temp_detector/Widgets/custom_text_field.dart';
import 'package:flutter_temp_detector/Widgets/gradient_background.dart';

class ConfigScreen extends StatefulWidget {
  @override
  _ConfigScreenState createState() => _ConfigScreenState();
}

class _ConfigScreenState extends State<ConfigScreen> {
  TextEditingController controllerGRPC = TextEditingController();
  TextEditingController controllerGRPCPORT = TextEditingController();
  TextEditingController controllerWS = TextEditingController();
  TextEditingController controllerWSPORT = TextEditingController();

  String title;
  String content;

  String grpc = "GRPC HOST*";
  String grpcport = "PORT*";
  String ws = "WEBSOCKET HOST*";
  String wsport = "PORT*";

  _save() async {
    if (this.controllerGRPC.text == "" ||
        this.controllerGRPCPORT.text == "" ||
        this.controllerWS.text == "" ||
        this.controllerWSPORT.text == "") {
      this.title = "Error";
      this.content = "Complete the required fields!";
      _showDialog();
      return;
    } else {
      ConfigModel newConfig = new ConfigModel(
          id: 1,
          grpc: this.controllerGRPC.text,
          grpcport: int.parse(this.controllerGRPCPORT.text),
          ws: this.controllerWS.text,
          wsport: int.parse(this.controllerWSPORT.text));

      if (configBloc.currentConfig.value.config != null) {
        await configBloc.updateConfig(newConfig);
      } else {
        await configBloc.setConfig(newConfig);
      }

      if (configBloc.currentConfig.value.error == "" ||
          configBloc.currentConfig.value.config != null) {
        Navigator.pushReplacementNamed(context, '/');
      } else {
        this.title = "Error";
        this.content = configBloc.currentConfig.value.error;
        _showDialog();
      }
    }
  }

  Future<void> _showDialog() async {
    return showDialog<void>(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertWidget(title: this.title, content: this.content);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<ConfigResponse>(
          stream: configBloc.currentConfig.stream,
          builder:
              (BuildContext context, AsyncSnapshot<ConfigResponse> snapshot) {
            if (snapshot.hasData &&
                !snapshot.hasError &&
                snapshot.data.config != null) {
              grpc = snapshot.data.config.grpc;
              grpcport = snapshot.data.config.grpcport.toString();
              ws = snapshot.data.config.ws;
              wsport = snapshot.data.config.wsport.toString();
            }
            return Stack(
              children: <Widget>[
                GradientBack(height: null),
                Container(
                  padding: EdgeInsets.only(top: 40, left: 5.0),
                  child: SizedBox(
                    height: 45.0,
                    width: 45.0,
                    child: IconButton(
                      icon: Icon(Icons.keyboard_arrow_left,
                          color: Colors.white, size: 30),
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
                        "Configuration",
                        style: TextStyle(
                          fontSize: 37.0,
                          fontFamily: "Roboto",
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 20)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          CustomTextField(
                            hintText: grpc,
                            typeState: controllerGRPC,
                            inputType: TextInputType.emailAddress,
                            autovalidate: false,
                            obscureText: false,
                            width: 200,
                          ),
                          Padding(padding: EdgeInsets.only(top: 20)),
                          CustomTextField(
                            hintText: grpcport,
                            typeState: controllerGRPCPORT,
                            inputType: TextInputType.text,
                            autovalidate: false,
                            obscureText: false,
                            width: 100,
                          ),
                        ],
                      ),
                      Padding(padding: EdgeInsets.only(top: 10)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          CustomTextField(
                            hintText: ws,
                            typeState: controllerWS,
                            inputType: TextInputType.emailAddress,
                            autovalidate: false,
                            obscureText: false,
                            width: 200,
                          ),
                          Padding(padding: EdgeInsets.only(top: 20)),
                          CustomTextField(
                            hintText: wsport,
                            typeState: controllerWSPORT,
                            inputType: TextInputType.text,
                            autovalidate: false,
                            obscureText: false,
                            width: 100,
                          ),
                        ],
                      ),
                      ButtonWhite(
                          text: "Save",
                          onPressed: () {
                            _save();
                          },
                          height: 50.0,
                          width: 200)
                    ],
                  ),
                ),
              ],
            );
          }),
    );
  }
}
