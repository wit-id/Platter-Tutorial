import 'package:flutter/material.dart';
import 'package:test_flutter/Widgets/text_field_container.dart';
import 'package:test_flutter/constant.dart';

class RoundedPasswordField extends StatelessWidget {
  final String hintText;
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    Key key,
    this.hintText,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: true,
        onChanged: onChanged,
        cursorColor: colorGreyLight,
        decoration: InputDecoration(
          hintText: hintText,
          icon: Icon(
            Icons.lock,
            color: colorGreyLight,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
