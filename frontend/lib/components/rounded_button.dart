import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final VoidCallback press;
  final Color color, textColor;

  const RoundedButton({
    super.key,
    required this.text,
    required this.press,
    required this.color,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.7,
      child: TextButton(
        onPressed: press,
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          backgroundColor: color,
        ),
        child: Text(text, style: TextStyle(color: textColor)),
      ),
    );
  }
}
