import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter/constant/Constant.dart';
import 'package:test_flutter/route/Routes.dart';
import 'package:test_flutter/widget/QuarterCirclePainter.dart';

class RegisterScreen extends StatefulWidget {
  @override
  RegisterScreenState createState() => new RegisterScreenState();
}

class RegisterScreenState extends State<RegisterScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.chevron_left,
              size: 50.0,
              color: Colors.black,
            )),
        actions: [
          Align(
            alignment: Alignment.center,
            child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, LOGIN_SCREEN);
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 8.0, left: 8.0, bottom: 8.0, right: 20.0),
                  child: Text('Login', style: TextStyle(color: Colors.black)),
                )),
          )
        ],
      ),
      body: Container(
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: new LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [colorSemiPrimary, colorPrimary]),
          ),
          child: SafeArea(
              child: Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 10.0),
            padding: EdgeInsets.all(40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Sign Up',
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.w600)),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0, bottom: 10.0),
                  child: new TextField(
                    style: TextStyle(fontSize: 12.0),
                    keyboardType: TextInputType.emailAddress,
                    decoration: new InputDecoration(
                        contentPadding:
                            EdgeInsets.only(left: 20.0, right: 20.0),
                        border: new OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(90.0)),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        hintStyle: new TextStyle(
                            color: Color(0xFFAFAFAF), fontSize: 12.0),
                        hintText: "Email",
                        fillColor: Color(0xFFECECEC)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: new TextField(
                    style: TextStyle(fontSize: 12.0),
                    decoration: new InputDecoration(
                        contentPadding:
                            EdgeInsets.only(left: 20.0, right: 20.0),
                        border: new OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(90.0)),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        hintStyle: new TextStyle(
                            color: Color(0xFFAFAFAF), fontSize: 12.0),
                        hintText: "Username",
                        fillColor: Color(0xFFECECEC)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: new TextField(
                    obscureText: true,
                    style: TextStyle(fontSize: 12.0),
                    decoration: new InputDecoration(
                        contentPadding:
                            EdgeInsets.only(left: 20.0, right: 20.0),
                        border: new OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(90.0)),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        hintStyle: new TextStyle(
                            color: Color(0xFFAFAFAF), fontSize: 12.0),
                        hintText: "Password",
                        fillColor: Color(0xFFECECEC)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: new TextField(
                    obscureText: true,
                    style: TextStyle(fontSize: 12.0),
                    decoration: new InputDecoration(
                        contentPadding:
                            EdgeInsets.only(left: 20.0, right: 20.0),
                        border: new OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(90.0)),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        hintStyle: new TextStyle(
                            color: Color(0xFFAFAFAF), fontSize: 12.0),
                        hintText: "Confirm Password",
                        fillColor: Color(0xFFECECEC)),
                  ),
                ),
                Expanded(child: Container()),
                SizedBox(
                    width: double.infinity,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0),
                          side: BorderSide(color: Colors.black)),
                      onPressed: () {},
                      color: Colors.black,
                      padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
                      textColor: Colors.white,
                      child: Text("Sign Up", style: TextStyle(fontSize: 12)),
                    ))
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.white,
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
          ))),
    );
  }
}
