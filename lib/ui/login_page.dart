import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Username"),
            TextField(),
            SizedBox(height: 16),
            Text("Password"),
            TextField(),
            SizedBox(height: 16),
            Container(
              width: MediaQuery.of(context).size.width,
              child: RaisedButton(
                onPressed: (){},
                color: Colors.blue,
                child: Text("LOGIN"),
              ),
            )
          ],
        ),
      ),
    );
  }
}