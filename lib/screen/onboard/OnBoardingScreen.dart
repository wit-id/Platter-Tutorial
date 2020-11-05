import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter/constant/Constant.dart';
import 'package:test_flutter/route/Routes.dart';
import 'package:test_flutter/widget/QuarterCirclePainter.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  OnBoardingScreenState createState() => new OnBoardingScreenState();
}

class OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: <Widget>[
        Expanded(
            child: Center(
                child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            "assets/images/flask.png",
            fit: BoxFit.cover,
          ),
        ))),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Welcome',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600)),
              Padding(
                padding: const EdgeInsets.only(top: 30.0, bottom: 30.0),
                child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                    style: TextStyle(fontSize: 12)),
              ),
              Row(
                children: [
                  Expanded(
                      child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0),
                        side: BorderSide(color: Colors.black)),
                    onPressed: () {
                      Navigator.pushNamed(context, LOGIN_SCREEN);
                    },
                    color: Colors.black,
                    padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
                    textColor: Colors.white,
                    child: Text("Sign In", style: TextStyle(fontSize: 12)),
                  )),
                  SizedBox(width: 10),
                  Expanded(
                      child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0),
                        side: BorderSide(color: Colors.white)),
                    onPressed: () {
                      Navigator.pushNamed(context, REGISTER_SCREEN);
                    },
                    color: Colors.white,
                    padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
                    textColor: Colors.black,
                    child: Text("Sign Up", style: TextStyle(fontSize: 12)),
                  )),
                ],
              )
            ],
          ),
          decoration: BoxDecoration(
            gradient: new LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [colorSemiPrimary, colorPrimary]),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 3,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
        ),
      ])
      ),
    );
  }
}
