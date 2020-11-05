import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter/route/Routes.dart';
import 'package:test_flutter/widget/QuarterCirclePainter.dart';

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => new SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> animation;

  startTime() async {
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed(ONBOARD_SCREEN);
  }

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
        vsync: this, duration: new Duration(seconds: 2));
    animation =
        new CurvedAnimation(parent: animationController, curve: Curves.easeOut);

    animation.addListener(() => this.setState(() {}));
    animationController.forward();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Stack(children: <Widget>[
          Align(
              alignment: Alignment.topRight,
              child: CustomPaint(
                painter: QuarterCirclePainter(
                    circleAlignment: CircleAlignment.topRight,
                    color: Colors.blue),
                size: Size(200, 200),
              )),
          Align(
              alignment: Alignment.bottomLeft,
              child: CustomPaint(
                painter: QuarterCirclePainter(
                    circleAlignment: CircleAlignment.bottomLeft,
                    color: Colors.blue),
                size: Size(300, 300),
              )),
          Center(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              "assets/images/flask.png",
              fit: BoxFit.cover,
            ),
          )
              // child: SizedBox(
              //   width: 300.0,
              //   height: 300.0,
              //   child: Image.asset(
              //     "assets/images/ic_logo_login.png",
              //   ),
              // ),
              ),
        ]),
      ),
    );
  }
}
