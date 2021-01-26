import 'package:flutter/material.dart';
import 'package:test_flutter/Screens/Welcome/welcome_screen.dart';
import 'package:test_flutter/Screens/home/components/background.dart';
import 'package:test_flutter/Screens/location/location_screen.dart';
import 'package:test_flutter/constant.dart';
import 'package:flutter_progress_button/flutter_progress_button.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  _showModalBottomSheet(context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      margin: EdgeInsets.only(top: 16),
      color: Colors.transparent, //could change this to Color(0xFF737373),
      //so you don't have to change MaterialApp canvasColor
      child: Container(
        padding: EdgeInsets.only(top: 16),
        constraints: BoxConstraints.expand(),
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              child: Text(
                "Home Screen",
                style: TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
              ),
              margin: EdgeInsets.all(16.0),
            ),
            Container(
              margin: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  ProgressButton(
                    defaultWidget: const Text(
                      'Location',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    progressWidget: const CircularProgressIndicator(),
                    width: double.infinity,
                    height: 70,
                    borderRadius: 10,
                    animate: true,
                    color: colorGreenDark,
                    type: ProgressButtonType.Raised,
                    onPressed: () async {
                      int score = await Future.delayed(
                          const Duration(milliseconds: 1000), () => 100);
                      // After [onPressed], it will trigger animation running backwards, from end to beginning
                      return () {
                        print(score);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LocationScreen(),
                          ),
                        );
                      };
                    },
                  ),
                ],
              ),
            ),
            Spacer(),
            Container(
              margin: EdgeInsets.all(16),
              child: Column(
                children: [
                  ProgressButton(
                    defaultWidget: const Text(
                      'Sign Out',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    progressWidget: const CircularProgressIndicator(),
                    width: double.infinity,
                    height: 70,
                    borderRadius: 10,
                    animate: true,
                    color: colorGreyDark,
                    type: ProgressButtonType.Raised,
                    onPressed: () async {
                      int score = await Future.delayed(
                          const Duration(milliseconds: 1000), () => 42);
                      // After [onPressed], it will trigger animation running backwards, from end to beginning
                      return () {
                        print(score);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WelcomeScreen(),
                          ),
                        );
                      };
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Background(
      child: _showModalBottomSheet(context),
    );
  }
}
