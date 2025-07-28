import 'package:flutter/material.dart';
import 'package:frontend/constant.dart';

class AlreadyAccountCheck extends StatelessWidget {
  final bool login;
  final VoidCallback press;
  const AlreadyAccountCheck({
    super.key,
    required this.login,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          login ? "Don't have Account? " : 'Already have Account? ',
          style: TextStyle(color: kPrimaryColor),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login ? "Sign Up" : 'Sign In',
            style: TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColor),
          ),
        ),
      ],
    );
  }
}
