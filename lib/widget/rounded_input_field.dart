import 'package:flutter/material.dart';
import 'package:test_flutter/widget/text_field_container.dart';
import 'package:test_flutter/constant.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const RoundedInputField({
    Key key,
    this.hintText,
    this.icon = Icons.person,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        cursorColor: colorGreenLight,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: colorGreenLight,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
