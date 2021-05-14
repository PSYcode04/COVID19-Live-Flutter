import 'package:flutter/material.dart';

class LoginSuccess extends StatelessWidget {
  final Map<String, String> arguments;
  LoginSuccess(this.arguments);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("2017313670 ParkSeYeon"),
          automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          Text(
          'CORONA LIVE',
          style: TextStyle(
            fontSize: 35,
            color: Colors.blueGrey,
          ),
        ),
        Text(
          'Login Success. Hello ' + arguments["user-id"] + '!!',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.blue,
          ),
        ),
        ]
        ),
      )
    );
  }
}