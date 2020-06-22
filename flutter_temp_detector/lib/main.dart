import 'package:flutter/material.dart';
import 'package:flutter_temp_detector/Home/ui/screens/home_screen.dart';
import 'package:flutter_temp_detector/User/bloc/config_bloc.dart';
import 'package:flutter_temp_detector/User/bloc/user_bloc.dart';
import 'package:flutter_temp_detector/User/ui/screens/auth_screen.dart';
import 'package:flutter_temp_detector/User/ui/screens/config_screen.dart';
import 'package:flutter_temp_detector/User/ui/screens/login_screen.dart';
import 'package:flutter_temp_detector/User/ui/screens/signin_screen.dart';
import 'package:flutter_temp_detector/common/sqlite.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DB.init();
  await userBloc.checkUserLogin();
  await configBloc.getConfig();
  runApp(Main());
}
class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Temp Detector',
      initialRoute: '/',
      routes: {
        '/': (context) => AuthScreen(),
        '/register': (context) => SignInScreen(),
        '/login': (context) => LoginScreen(),
        '/home': (context) => HomeScreen(),
        '/config': (context) => ConfigScreen(),
      },
    );
  }
}
