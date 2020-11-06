import 'package:flutter/material.dart';
import 'package:test_flutter/utils/colors.dart';
import 'package:test_flutter/screens/sign_up_screen.dart';

class SignInScreen extends StatefulWidget {
  static const routeName = 'sign-in';
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextStyle style = TextStyle(fontFamily: 'Poppins', fontSize: 16.0);

  @override
  Widget build(BuildContext context) {
    final emailField = TextField(
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Username or Email",
          fillColor: Colors.grey[200],
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey, width: 0.0),
            borderRadius: BorderRadius.circular(32.0),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32.0),
          )),
    );
    final passwordField = TextField(
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          fillColor: Colors.grey[200],
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey, width: 0.0),
            borderRadius: BorderRadius.circular(32.0),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32.0),
          )),
    );
    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff000000),
      shadowColor: Colors.transparent,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {},
        child: Text("Sign in",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.normal)),
      ),
    );

    final forgotButton = Material(
      elevation: 5.0,
      color: Color(0xffffffff),
      shadowColor: Colors.transparent,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.zero,
        onPressed: () {},
        child: Align(
            alignment: Alignment.centerRight,
            child: Text("Forgot Password?",
                textAlign: TextAlign.right,
                style: style.copyWith(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.normal))),
      ),
    );

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        actions: <Widget>[
          FlatButton(
            textColor: Colors.black,
            onPressed: () =>
                Navigator.of(context).pushNamed(SignUpScreen.routeName),
            child: Text(
              "Register",
              style: style,
            ),
          ),
        ],
      ),
      body: Stack(children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: EdgeInsets.all(0),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  stops: [0.2, 0.7],
                  end: Alignment.bottomCenter,
                  colors: [MyColors.primaryGreen, MyColors.primaryGreenDark]),
            ),
            alignment: Alignment.bottomCenter,
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.only(left: 30, right: 30, bottom: 60),
            height: 380,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40))),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("Sign In",
                      textAlign: TextAlign.left,
                      style: style.copyWith(
                          color: Colors.black,
                          fontSize: 28,
                          fontWeight: FontWeight.w500)),
                  SizedBox(
                    height: 30,
                  ),
                  emailField,
                  SizedBox(
                    height: 16,
                  ),
                  passwordField,
                  Align(
                      alignment: Alignment.centerRight,
                      child: SizedBox(width: 120, child: forgotButton)),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[Expanded(child: loginButon)],
                  ),
                ]),
          ),
        ),
      ]),
    );
  }
}
