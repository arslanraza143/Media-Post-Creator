import 'package:flutter/material.dart';
import 'package:frontend/Core/Common/Widgets/text_field_container.dart';
import 'package:frontend/Core/Common/helper.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final Color color, textColor;
  final ValueChanged<String>? onChange;
  final int maxLines;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const RoundedInputField({
    super.key,
    this.validator,
    required this.hintText,
    this.icon = Icons.person,
    required this.color,
    required this.textColor,
    this.onChange,
    this.maxLines = 1,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        onTapOutside: (event) {
          Helper.unFocusScope();
        },
        validator: validator,
        controller: controller,
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
