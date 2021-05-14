import 'package:flutter/material.dart';
import 'package:corona_live_app/pages/login.dart';
import 'package:corona_live_app/pages/loginSuccess.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: '2017313670 ParkSeYeon',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        onGenerateRoute: (routerSettings) {
          switch(routerSettings.name) {
            case '/':
              return MaterialPageRoute(builder: (_) => LoginPage(title: "2017313670 ParkSeYeon"));
            case '/loginSuccess':
              return MaterialPageRoute(builder: (_) => LoginSuccess(routerSettings.arguments));
              break;
            default:
              return MaterialPageRoute(builder: (_) => LoginPage(title: "2017313670 ParkSeYeon"));
          }
        }
    );
  }
}

