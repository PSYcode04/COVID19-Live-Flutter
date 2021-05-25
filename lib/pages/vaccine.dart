import 'package:flutter/material.dart';


class Vaccine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Basic List';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(title: Text(title)),
        body: Center(
          child: Text("hello"),
        ),
      ),
    );
  }

}