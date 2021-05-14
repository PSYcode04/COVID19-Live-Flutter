import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key key, this.title}) : super(key: key);
  final String title;

  final String id = "skku";
  final String pw = "1234";

  final idController = TextEditingController();
  final pwController = TextEditingController();

  bool _checkIdPw() {
    if(id.compareTo(idController.text) == 0 && pw.compareTo(pwController.text) == 0)
      return true;
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("2017313670 ParkSeYeon"),
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
                'Login Please...',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
              Container(
                  margin: EdgeInsets.all(30),
                  padding: EdgeInsets.only(left: 30, right: 30),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 3,
                      color: Colors.black38,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child:
                              Text(
                                'ID:',
                                style: TextStyle(
                                  fontSize: 25,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 8,
                              child:
                              TextField(
                                controller: idController,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child:
                              Text(
                                'PW:',
                                style: TextStyle(
                                  fontSize: 25,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 8,
                              child:
                              TextField(
                                controller: pwController,
                              ),
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        child: Text("Login"),
                        onPressed: () {
                          if(_checkIdPw())
                            Navigator.pushNamed(
                                context,
                                '/loginSuccess',
                                arguments: {
                                  "user-id" : idController.text,
                                });
                          },
                      ),
                    ],
                  ),
              ),
            ]
          ),
        ),
    );
  }
}