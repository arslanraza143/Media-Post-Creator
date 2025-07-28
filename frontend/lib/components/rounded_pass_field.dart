
import 'package:flutter/material.dart';
import 'package:frontend/components/text_field_container.dart';
import 'package:frontend/constant.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        obscureText: true,
        decoration: InputDecoration(
          icon: Icon(Icons.lock, color: kPrimaryColor),
          border: InputBorder.none,
          hintText: 'Password',
          suffixIcon: Icon(Icons.visibility, color: kPrimaryColor),
        ),
      ),
    );
  }
}
