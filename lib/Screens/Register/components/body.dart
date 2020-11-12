import 'package:flutter/material.dart';
import 'package:test_flutter/Screens/Register/components/background.dart';
import 'package:test_flutter/Screens/Welcome/welcome_screen.dart';
import 'package:test_flutter/Widgets/rounded_button_wide.dart';
import 'package:test_flutter/Widgets/rounded_input_field.dart';
import 'package:test_flutter/Widgets/rounded_password_field.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 24),
                  textAlign: TextAlign.left,
                ),
                margin: EdgeInsets.all(16.0),
              ),
              Container(
                margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                child: RoundedInputField(
                  hintText: "Email",
                  onChanged: (value) {},
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                child: RoundedInputField(
                  hintText: "Username",
                  onChanged: (value) {},
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                child: RoundedPasswordField(
                  hintText: "Password",
                  onChanged: (value) {},
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 16, right: 16),
                child: RoundedPasswordField(
                  hintText: "Confirm Password",
                  onChanged: (value) {},
                ),
              ),
              Spacer(),
              RoundedButtonWide(
                text: "Sign Up",
                press: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WelcomeScreen(),
                    ),
                  );
                },
              ),
            ],
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Container(
        child: _showModalBottomSheet(context),
      ),
    );
  }
}
