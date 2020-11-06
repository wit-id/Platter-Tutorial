import 'package:flutter/material.dart';
import 'package:test_flutter/Login/components/body.dart';
import 'package:test_flutter/Register/register_screen.dart';
import 'package:test_flutter/constant.dart';

class LoginScreen extends StatelessWidget {
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
                MaterialPageRoute(builder: (context) => RegisterScreen()),
              );
            },
            child: Text("Sign Up"),
            shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
          )
        ],
      ),
      body: Body(),
    );
  }
}
