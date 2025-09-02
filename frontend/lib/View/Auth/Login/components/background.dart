
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Background extends StatelessWidget {
  
  const Background({super.key});

  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    return SizedBox.expand(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: Image.asset(
              'assets/images/main_top.png',
              width: MediaQuery.of(context).size.width * 0.3,
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Image.asset(
              'assets/images/login_bottom.png',
              width: MediaQuery.of(context).size.width * 0.3,
            ),
          ),
        ],
      ),
    );
  }
}
