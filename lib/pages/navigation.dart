import 'package:flutter/material.dart';

class Navigation extends StatelessWidget {
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
              Text("Hello"),
            ]
        ),
      ),
    );
  }
}