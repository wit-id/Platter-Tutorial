import 'package:flutter/material.dart';
import 'package:test_flutter/constant.dart';

class RoundedButtonWide extends StatelessWidget {
  final String text;
  final Function press;
  final Color color, textColor;
  const RoundedButtonWide({
    Key key,
    this.text,
    this.press,
    this.color = colorBlack,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(16),
      width: size.width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: FlatButton(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
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
