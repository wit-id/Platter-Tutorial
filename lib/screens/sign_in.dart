import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  static const routeName = '/sign-in';
  @override
  Widget build(BuildContext context) {
    final _mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          FlatButton(
            child: Text("Register"),
            textColor: Colors.black,
            onPressed: (){},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: _mediaQuery.size.height * 0.5,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color.fromRGBO(3, 182, 156, 1), Color.fromRGBO(9, 253, 171, 1)],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}