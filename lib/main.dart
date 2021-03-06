import 'package:flutter/material.dart';
import 'package:corona_live_app/pages/login.dart';
import 'package:corona_live_app/pages/loginSuccess.dart';
import 'package:corona_live_app/pages/navigation.dart';
import 'package:corona_live_app/pages/casesAnddeaths.dart';
import 'package:corona_live_app/pages/vaccine.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => VaccineProvider()),
      ],
      child: MaterialApp(
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
                return MaterialPageRoute(builder: (_) => Login(routerSettings.arguments));
                break;
              case '/navigation':
                return MaterialPageRoute(builder: (_) => Navigation(routerSettings.arguments));
                break;
              case '/caseAndDeath':
                return MaterialPageRoute(builder: (_) => CaseDeaths(routerSettings.arguments));
                break;
              case '/vaccine':
                return MaterialPageRoute(builder: (_) => Vaccine(routerSettings.arguments));
                break;
              default:
                return MaterialPageRoute(builder: (_) => LoginPage(title: "2017313670 ParkSeYeon"));
            }
          }
      ),
    );
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
              return MaterialPageRoute(builder: (_) => Login(routerSettings.arguments));
              break;
            case '/navigation':
              return MaterialPageRoute(builder: (_) => Navigation(routerSettings.arguments));
              break;
            case '/caseAndDeath':
              return MaterialPageRoute(builder: (_) => CaseDeaths(routerSettings.arguments));
              break;
            case '/vaccine':
              return MaterialPageRoute(builder: (_) => Vaccine(routerSettings.arguments));
              break;
            default:
              return MaterialPageRoute(builder: (_) => LoginPage(title: "2017313670 ParkSeYeon"));
          }
        }
    );
  }
}


