import 'dart:async';

import 'package:flutter/material.dart';
import 'package:test_flutter/screens/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    splashScreenNavigator();
  }

  splashScreenNavigator() async {
    var duration = const Duration(seconds: 2);
    return Timer(
      duration,
      () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (_) {
              return OnBoardingScreen();
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Image(
              image: AssetImage(
                'assets/images/splash.png',
              ),
              width: 120.0,
            ),
          ),
        ),
      ),
    );
  }
}
