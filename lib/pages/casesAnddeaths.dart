import 'package:flutter/material.dart';

class CaseDeaths extends StatelessWidget {
  final Map<String, String> arguments;
  CaseDeaths(this.arguments);

  final String pageName = "Cases/Deaths Page";

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        body: Center(
          child: Text("cases"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
            Navigator.pushNamed(
                context,
                '/navigation',
                arguments: {
                  "user-id" : arguments["user-id"],
                  "page-name" : pageName,
                });
          },
          tooltip: 'Back',
          child: Icon(Icons.list),
        ),
      ),
      onWillPop: () {},
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //
  //   return MaterialApp(
  //     home: Scaffold(
  //       body: Center(
  //         child: Text("cases"),
  //       ),
  //       floatingActionButton: FloatingActionButton(
  //         onPressed: () {
  //           Navigator.pop(context);
  //           Navigator.pushNamed(
  //               context,
  //               '/navigation',
  //               arguments: {
  //                 "user-id" : arguments["user-id"],
  //                 "page-name" : pageName,
  //               });
  //         },
  //         tooltip: 'Decrement',
  //         child: Icon(Icons.list),
  //       ),
  //     ),
  //   );
  // }

}