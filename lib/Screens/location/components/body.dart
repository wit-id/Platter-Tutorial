import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_progress_button/flutter_progress_button.dart';
import 'package:test_flutter/Blocs/login_bloc/login_bloc.dart';
import 'package:test_flutter/Blocs/login_bloc/login_state.dart';
import 'package:test_flutter/Screens/home/home_screen.dart';
import 'package:test_flutter/Screens/location/components/background.dart';
import 'package:test_flutter/constant.dart';

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
            Spacer(),
            Container(
              margin: EdgeInsets.all(16),
              child: Column(
                children: [
                  ProgressButton(
                    defaultWidget: const Text(
                      'Exit',
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
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(),
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