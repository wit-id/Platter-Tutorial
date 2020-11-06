import 'package:flutter/material.dart';
import 'package:test_flutter/widget/text_field_container.dart';
import 'package:test_flutter/constant.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    Key key,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: true,
        onChanged: onChanged,
        cursorColor: colorGreenLight,
        decoration: InputDecoration(
          hintText: "Password",
          icon: Icon(
            Icons.lock,
            color: colorGreenLight,
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: colorGreenLight,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
