import 'package:flutter/material.dart';
import 'package:test_flutter/Screens/home/components/body.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      resizeToAvoidBottomPadding: false,
      body: Body(),
    );
  }
}
