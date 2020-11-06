import 'package:flutter/material.dart';
import 'package:test_flutter/Login/login_screen.dart';
import 'package:test_flutter/Register/components/body.dart';
import 'package:test_flutter/constant.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          FlatButton(
            textColor: colorBlack,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen())
              );
            },
            child: Text("Sign In"),
            shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
          )
        ],
      ),
      body: Body(),
    );
  }
}
