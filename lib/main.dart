import 'package:flutter/material.dart';

import './widgets/home_opening.dart';
import './widgets/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Poppins',
        textTheme: ThemeData.light().textTheme.copyWith(
          title: TextStyle(
            color: Colors.black,
            fontSize: 28,
            fontWeight: FontWeight.bold
          ),
          body1: TextStyle(
            color: Colors.black,
            fontSize: 14,
          )
        )
      ),
      home: Home(),
    );
  }
}
