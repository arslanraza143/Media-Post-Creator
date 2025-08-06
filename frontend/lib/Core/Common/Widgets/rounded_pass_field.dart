import 'package:flutter/material.dart';
import 'package:frontend/Core/Common/Widgets/text_field_container.dart';
import 'package:frontend/Core/Common/helper.dart';
import 'package:frontend/constant.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  
  const RoundedPasswordField({
    super.key,
    this.onChanged,
    required this.controller,
    this.validator
  });

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        onTapOutside: (event){
          Helper.unFocusScope();
        },
        onChanged: onChanged,
        controller: controller,
        validator: validator,
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
