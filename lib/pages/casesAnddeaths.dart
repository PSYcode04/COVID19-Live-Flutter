import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CaseDeaths extends StatelessWidget {
  final Map<String, String> arguments;
  CaseDeaths(this.arguments);
  final String pageName = "Cases/Deaths Page";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              // margin: EdgeInsets.only(left:30, right: 30),
                margin: EdgeInsets.all(30),
                padding: EdgeInsets.only(left:30, right: 30),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 3,
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column (
                    children: [
                      Container(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Total Cases.', textAlign: TextAlign.left),
                            Text('Parsed latest date', textAlign: TextAlign.right),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(' people', textAlign: TextAlign.left),
                            Text('', textAlign: TextAlign.right),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Total Deaths', textAlign: TextAlign.left),
                            Text('Daily Cases', textAlign: TextAlign.right),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(' people', textAlign: TextAlign.left),
                            Text(' people', textAlign: TextAlign.right),
                          ],
                        ),
                      ),
                    ]
                ),
            ),
          ]
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
          Navigator.pushNamed(
              context,
              '/navigation',
              arguments: {
                "user-id": arguments["user-id"],
                "page-name": pageName,
              });
        },
        tooltip: 'Back',
        child: Icon(Icons.list),
      ),
    );
  }
}
