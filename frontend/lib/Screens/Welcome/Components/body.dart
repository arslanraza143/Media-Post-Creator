import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frontend/Screens/Login/login_screen.dart';
import 'package:frontend/Screens/Sign%20Up/sign_up_screen.dart';
import 'package:frontend/Screens/Welcome/Components/background.dart';
import 'package:frontend/components/custom_headin_text.dart';
import 'package:frontend/components/rounded_button.dart';
import 'package:frontend/constant.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomHeadingText(title: 'Welcome to Post Creater',),
          SizedBox(height: size.height * 0.03),
          SvgPicture.asset('assets/icons/chat.svg', height: size.height * 0.5),
          SizedBox(height: size.height * 0.03),
          RoundedButton(
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return LoginScreen();
                  },
                ),
              );
            },
            text: 'LOGIN',
            color: kPrimaryColor,
          ),
          RoundedButton(
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SignUpScreen();
                  },
                ),
              );
            },
            text: 'SIGNUP',
            color: kPrimaryLightColor,
            textColor: Colors.black,
          ),
        ],
      ),
    );
  }
}
