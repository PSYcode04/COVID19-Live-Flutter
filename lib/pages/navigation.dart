import 'package:flutter/material.dart';

class Navigation extends StatelessWidget {
  final Map<String, String> arguments;
  Navigation(this.arguments);
  // Receive arguments from onGenerateRouter

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu"),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Welcome! " + arguments["user-id"]),
              Text("Previous: " + arguments["page-name"]),
            ]
        ),
      ),
    );
  }
}