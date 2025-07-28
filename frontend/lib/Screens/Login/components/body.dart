import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frontend/Screens/Home_Screen/home_screen.dart';
import 'package:frontend/Screens/Sign%20Up/sign_up_screen.dart';
import 'package:frontend/components/already_have_account_check.dart';
import 'package:frontend/components/custom_headin_text.dart';
import 'package:frontend/components/rounded_button.dart';
import 'package:frontend/components/rounded_input_field.dart';
import 'package:frontend/components/rounded_pass_field.dart';

import 'package:frontend/Screens/Welcome/Components/background.dart';
import 'package:frontend/constant.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomHeadingText(title: 'LOGIN'),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              'assets/icons/login.svg',
              height: size.height * 0.4,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: 'Enter Your Email',
              color: kPrimaryColor,
              textColor: Colors.white,
              onChange: (String value) {},
            ),
            RoundedPasswordField(
              onChanged: (String value) {
                
              },
            ),
            RoundedButton(text: 'LOGIN', press: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
            }, color: kPrimaryColor),
            SizedBox(height: size.height * 0.01),
            AlreadyAccountCheck(
              login: true,
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
            ),
          ],
        ),
      ),
    );
  }
}
