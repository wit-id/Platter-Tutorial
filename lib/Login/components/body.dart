import 'package:flutter/material.dart';
import 'package:test_flutter/Login/components/background.dart';
import 'package:test_flutter/Splash/splash_screen.dart';
import 'package:test_flutter/Welcome/welcome_screen.dart';
import 'package:test_flutter/constant.dart';
import 'package:test_flutter/widget/rounded_button_wide.dart';
import 'package:test_flutter/widget/rounded_input_field.dart';
import 'package:test_flutter/widget/rounded_password_field.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  _showModalBottomSheet(context) {
    return Container(
      height: 400.0,
      width: double.infinity,
      color: Colors.transparent, //could change this to Color(0xFF737373),
      //so you don't have to change MaterialApp canvasColor
      child: Container(
          padding: EdgeInsets.only(top: 16),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Text(
                  "Sign In",
                  style: TextStyle(fontSize: 24),
                  textAlign: TextAlign.left,
                ),
                margin: EdgeInsets.all(16.0),
              ),
              Container(
                margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                child: RoundedInputField(
                  hintText: "Username or Email",
                  onChanged: (value) {},
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 16, right: 16),
                child: RoundedPasswordField(
                  hintText: "Password",
                  onChanged: (value) {},
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                child: FlatButton(
                  textColor: colorBlack,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WelcomeScreen()));
                  },
                  child: Text("Forgot Password?"),
                  shape:
                      CircleBorder(side: BorderSide(color: Colors.transparent)),
                ),
              ),
              Spacer(),
              Container(
                child: Center(
                  child: RoundedButtonWide(
                    text: "Sign In",
                    press: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SplashScreen(),
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: Column(
          children: [_showModalBottomSheet(context)],
        ),
      ),
    );
  }
}
