import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter/screens/login_screen.dart';
import 'package:test_flutter/screens/onboarding_screen.dart';
import 'package:test_flutter/utils/app_keys.dart';
import 'package:test_flutter/utils/slide_right_route.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: FlatButton(
          child: Image.asset('assets/images/back.png'),
          key: ValueKey(BACK_REGISTER_BUTTON),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              SlideRightRoute(
                page: OnBoardingScreen(),
              ),
            );
          },
        ),
        actions: [
          FlatButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) {
                    return LoginScreen();
                  },
                ),
              );
            },
            key: ValueKey(LOGIN_ONREGISTER_BUTTON),
            child: Text(
              "Login",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF09FDAB),
                  Color(0xFF03B69C),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              margin: const EdgeInsets.only(top: 78.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(31.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 28.0),
                              child: Text(
                                "Sign Up",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24.0,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              bottom: 28.0,
                            ),
                            child: TextField(
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                hintText: "Email",
                                contentPadding: const EdgeInsets.only(
                                  top: 14.0,
                                  bottom: 14.0,
                                  left: 31.0,
                                  right: 31.0,
                                ),
                                fillColor: Color(0xFFECECEC),
                                filled: true,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              bottom: 28.0,
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "Username",
                                contentPadding: const EdgeInsets.only(
                                  top: 14.0,
                                  bottom: 14.0,
                                  left: 31.0,
                                  right: 31.0,
                                ),
                                fillColor: Color(0xFFECECEC),
                                filled: true,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              bottom: 28.0,
                            ),
                            child: TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: "Password",
                                contentPadding: const EdgeInsets.only(
                                  top: 14.0,
                                  bottom: 14.0,
                                  left: 31.0,
                                  right: 31.0,
                                ),
                                fillColor: Color(0xFFECECEC),
                                filled: true,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              bottom: 28.0,
                            ),
                            child: TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: "Confirm Password",
                                contentPadding: const EdgeInsets.only(
                                  top: 14.0,
                                  bottom: 14.0,
                                  left: 31.0,
                                  right: 31.0,
                                ),
                                fillColor: Color(0xFFECECEC),
                                filled: true,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              right: 5.0,
                            ),
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              color: Color(0xFF171D1C),
                              onPressed: () {
                                // navigate(isLogin: true);
                              },
                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
