import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            left: 0,
            top: 0,
            width: size.width * 0.3,
            child: Image.asset("assets/images/main_top.png"),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset(
              'assets/images/main_bottom.png',
              width: size.width * 0.3,
            ),
          ),
          child,
        ],
      ),
    );
  }
}
