import 'package:flutter/material.dart';
import 'package:test_flutter/constant.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(4),
      width: size.width,
      decoration: BoxDecoration(
        color: colorGreyLight,
        borderRadius: BorderRadius.circular(29),
      ),
      child: child,
    );
  }
}
