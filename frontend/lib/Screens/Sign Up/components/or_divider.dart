
import 'package:flutter/material.dart';
import 'package:frontend/constant.dart';

class orDivider extends StatelessWidget {
  const orDivider({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
      //width: size.width * 0.8,
      child: Row(
        children: [
          BuildDivider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text('Or', style: TextStyle(fontWeight: FontWeight.w600, color: kPrimaryColor),),
          ),
          BuildDivider(),
        ],
      ),
    );
  }
}

class BuildDivider extends StatelessWidget {
  const BuildDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Divider(color: Color(0xFFD9D9d9), height: 1.5));
  }
}
