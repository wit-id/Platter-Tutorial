import 'package:flutter/material.dart';
import 'package:test_flutter/Screens/Splash/splash_screen.dart';
import 'constant.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Test',
        theme: ThemeData(
          primaryColor: colorGreenLight,
          scaffoldBackgroundColor: Colors.white,
          backgroundColor: Colors.white
        ),
        home: SplashScreen(),
      ),
    );
  }
}