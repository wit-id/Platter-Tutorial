import 'package:flutter/material.dart';
import 'package:test_flutter/screens/sign_in_screen.dart';
import 'package:test_flutter/screens/sign_up_screen.dart';
import 'package:test_flutter/utils/colors.dart';

class MyHomePage extends StatefulWidget {
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextStyle style = TextStyle(fontFamily: 'Poppins', fontSize: 16.0);

  @override
  Widget build(BuildContext context) {
    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff000000),
      shadowColor: Colors.transparent,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () =>
            Navigator.of(context).pushNamed(SignInScreen.routeName),
        child: Text("Sign in",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.normal)),
      ),
    );

    final signupButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xffffffff),
      shadowColor: Colors.transparent,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () =>
            Navigator.of(context).pushNamed(SignUpScreen.routeName),
        child: Text("Sign up",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.black, fontWeight: FontWeight.normal)),
      ),
    );

    return Scaffold(
      body: Column(children: [
        Expanded(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.only(bottom: 20),
              color: Colors.transparent,
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: 155.0,
                child: Image.asset(
                  "assets/flask.png",
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.only(left: 30, right: 30, bottom: 60),
              height: 320,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        MyColors.primaryGreen,
                        MyColors.primaryGreenDark
                      ]),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40))),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Welcome",
                        textAlign: TextAlign.left,
                        style: style.copyWith(
                            color: Colors.black,
                            fontSize: 28,
                            fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                        textAlign: TextAlign.left,
                        style: style.copyWith(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.normal)),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(child: loginButon),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(child: signupButton)
                      ],
                    ),
                  ]),
            ),
          ),
        )
      ]),
    );
  }
}
