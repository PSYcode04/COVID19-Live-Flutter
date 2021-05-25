import 'package:flutter/material.dart';

class Navigation extends StatelessWidget {
  final Map<String, String> arguments;
  Navigation(this.arguments);
  // Receive arguments from onGenerateRouter

  void _click() {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu"),
        automaticallyImplyLeading: false,
      ),
      body: Center (
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                child: ListView(
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.coronavirus),
                      title: Text('Cases/Deaths'),
                      onTap: (){
                        Navigator.pushNamed(context, '/caseAndDeath');
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.local_hospital),
                      title: Text('Vaccine'),
                      onTap: (){
                        Navigator.pushNamed(context, '/vaccine');
                      },
                    )
                  ],
                ),
              )
            ),
            Expanded(
              child: Container(
                child:Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                          "Welcome! " + arguments["user-id"],
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey,
                        )
                      ),
                      Text(
                          "Previous: " + arguments["page-name"],
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ]
                ),
              )
            )
          ],
        ),

      ),

      // body: Center(
      //   child:Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: <Widget>[
      //         Text("Welcome! " + arguments["user-id"]),
      //         Text("Previous: " + arguments["page-name"]),
      //       ]
      //   ),
      // ),
    );
  }
}