import 'package:flutter/material.dart';
// import 'package:test_flutter/Screens/Login/login_screen.dart';
import 'package:test_flutter/Screens/Register/register_screen.dart';
import 'package:test_flutter/Screens/Welcome/components/background.dart';
import 'package:test_flutter/Screens/location/location_screen.dart';
import 'package:test_flutter/Widgets/rounded_button_black.dart';
import 'package:test_flutter/Widgets/rounded_button_white.dart';
import 'package:test_flutter/constant.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  _showModalBottomSheet(context) {
    return Container(
      height: 300.0,
      width: double.infinity,
      color: Colors.transparent, //could change this to Color(0xFF737373),
      //so you don't have to change MaterialApp canvasColor
      child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [colorGreenLight, colorGreenDark]),
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
                  "Welcome",
                  style: TextStyle(fontSize: 24),
                  textAlign: TextAlign.left,
                ),
                margin: EdgeInsets.all(16.0),
              ),
              Container(
                child: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                    style: TextStyle(fontSize: 12),
                    textAlign: TextAlign.left),
                margin: EdgeInsets.all(16.0),
              ),
              Container(
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RoundedButtonBlack(
                        text: "SIGN IN",
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LocationScreen(),
                            ),
                          );
                        },
                      ),
                      SizedBox(width: 20),
                      RoundedButtonWhite(
                        text: "SIGN UP",
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterScreen()),
                          );
                        },
                      ),
                    ],
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
      child: Container(
        child: Column(
          children: [
            Spacer(),
            Container(
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.only(bottom: 16),
              child: Column(
                children: <Widget>[
                Image.asset('assets/images/flask.png', scale: 1.5),
              ]),
            ),
            Spacer(),
            _showModalBottomSheet(context)
          ],
        ),
      ),
    );
  }
}
