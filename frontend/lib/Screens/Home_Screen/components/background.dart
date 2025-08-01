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
            top: 0,
            right: 0,
            child: IgnorePointer(
              child: Image.asset('assets/images/home_top.png', width: size.width * 0.5),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: IgnorePointer(
              child: Image.asset(
                'assets/images/main_bottom.png',
                width: size.width * 0.3,
              ),
            ),
          ),
          child,
        ],
      ),
    );
  }
}
