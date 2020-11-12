import 'package:flutter/material.dart';
import 'package:test_flutter/constant.dart';

class RoundedButtonWhite extends StatelessWidget {
  final String text;
  final Function press;
  final Color color, textColor;
  const RoundedButtonWhite({
    Key key,
    this.text,
    this.press,
    this.color = Colors.white,
    this.textColor = colorBlack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: FlatButton(
          padding: EdgeInsets.symmetric(vertical: 18, horizontal: 50),
          color: color,
          onPressed: press,
          child: Text(
            text,
            style: TextStyle(color: textColor),
          ),
        ),
      ),
    );
  }
}
