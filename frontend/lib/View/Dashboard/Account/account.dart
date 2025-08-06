import 'package:flutter/material.dart';
import 'package:frontend/View/Dashboard/Main/Components/background.dart';
import 'package:frontend/Core/Common/Widgets/custom_headin_text.dart';
import 'package:frontend/Core/Common/Widgets/rounded_button.dart';
import 'package:frontend/constant.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomHeadingText(title: 'Account'),
          Image.asset('assets/images/home.png', height: size.height * 0.35),
          RoundedButton(text: 'LOGOUT', press: () {}, color: kPrimaryColor),
        ],
      ),
    );
  }
}
