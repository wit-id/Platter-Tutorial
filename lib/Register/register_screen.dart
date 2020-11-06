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
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_outlined, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          FlatButton(
            textColor: colorBlack,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginScreen()));
            },
            child: Text("Sign In"),
            shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
          )
        ],
      ),
      resizeToAvoidBottomPadding: false,
      body: Body(),
    );
  }
}
