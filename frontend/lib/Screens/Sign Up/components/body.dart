import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/Screens/Login/login_screen.dart';
import 'package:frontend/Screens/Sign Up/components/background.dart';
import 'package:frontend/Screens/Sign%20Up/components/or_divider.dart';
import 'package:frontend/Screens/Sign%20Up/components/social_icon.dart';
import 'package:frontend/components/already_have_account_check.dart';
import 'package:frontend/components/custom_headin_text.dart';
import 'package:frontend/components/rounded_button.dart';
import 'package:frontend/components/rounded_input_field.dart';
import 'package:frontend/components/rounded_pass_field.dart';
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
            CustomHeadingText(title: 'SIGN UP'),
            // SizedBox(height: size.height * 0.35),
            SvgPicture.asset(
              'assets/icons/signup.svg',
              height: size.height * 0.35,
            ),
            // SizedBox(height: size.height * 0.3),
            RoundedInputField(
              hintText: 'Your Email',
              color: kPrimaryColor,
              textColor: kPrimaryColor,
              onChange: (value) {},
            ),

            // SizedBox(height: size.height * 0.3),
            RoundedPasswordField(onChanged: (input) {}),
            RoundedButton(text: 'SIGNUP', press: () {}, color: kPrimaryColor),
            AlreadyAccountCheck(
              login: false,
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
            ),
            orDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SocialIcon(iconSrc: 'assets/icons/facebook.svg', press: () {}),
                SocialIcon(
                  iconSrc: 'assets/icons/google-plus.svg',
                  press: () {},
                ),
                SocialIcon(iconSrc: 'assets/icons/twitter.svg', press: () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
