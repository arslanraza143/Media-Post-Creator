import 'package:flutter/material.dart';
import 'package:frontend/Controller/Other/connection_manager_controller.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function()? press;
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
    final ConnectionManagerController controller = Get.find();
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.7,
      child: TextButton(
        onPressed: controller.isConnected.value? press: null,
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          backgroundColor: color,
        ),
        child: Text(text, style: TextStyle(color: textColor)),
      ),
    );
  }
}
