import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  final Map<String, String> arguments;
  Login(this.arguments);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("2017313670 ParkSeYeon"),
        automaticallyImplyLeading: false, // AppBar에 있는 뒤로가기 버튼 제거
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
              SizedBox(
                width: double.infinity,
                child:
                  Image.asset("assets/images/corona_image.jpg"),
              ),
              ElevatedButton(
                  child: Text("Start CORONA LIVE"),
                  onPressed: () {
                    Navigator.pushNamed(context, '/navigation');
                  },
              ),
            ],
        ),
      )
    );
  }
}