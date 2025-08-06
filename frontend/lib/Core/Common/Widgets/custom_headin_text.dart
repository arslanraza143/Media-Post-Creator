
import 'package:flutter/material.dart';
import 'package:frontend/constant.dart';

class CustomHeadingText extends StatelessWidget {
  final String title;
  const CustomHeadingText({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontWeight: FontWeight.w900,
        fontSize: 20,
        color: kPrimaryColor,
      ),
    );
  }
}
