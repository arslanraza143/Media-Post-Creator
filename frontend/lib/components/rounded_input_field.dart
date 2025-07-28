import 'package:flutter/material.dart';
import 'package:frontend/components/text_field_container.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final Color color, textColor;
  final ValueChanged<String> onChange;
  final int maxLines;

  const RoundedInputField({
    super.key,
    required this.hintText,
    this.icon = Icons.person,
    required this.color,
    required this.textColor,
    required this.onChange,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        maxLines: maxLines,
        onChanged: onChange,
        decoration: InputDecoration(
          icon: Icon(icon, color: color),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
