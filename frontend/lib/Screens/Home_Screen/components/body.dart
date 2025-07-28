import 'package:flutter/material.dart';
import 'package:frontend/Screens/Home_Screen/components/background.dart';
import 'package:frontend/components/custom_headin_text.dart';
import 'package:frontend/components/rounded_button.dart';
import 'package:frontend/components/rounded_input_field.dart';
import 'package:frontend/constant.dart';

class Body extends StatelessWidget {
  const Body({
    super.key,
    
  });
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomHeadingText(title: 'CREATE NEW POST'),
            //Image.asset('assets/images/home.png', height: size.height * 0.35),
            Image.asset(
              'assets/images/home_center.png',
              height: size.height * 0.35,
            ),
            RoundedInputField(
              hintText: 'Post Title',
              color: kPrimaryColor,
              textColor: kPrimaryColor,
              onChange: (value) {},
              icon: Icons.title,
            ),
            RoundedInputField(
              hintText: 'Description',
              color: kPrimaryColor,
              textColor: kPrimaryColor,
              onChange: (value) {},
              icon: Icons.description,
              maxLines: 5,
            ),
            RoundedButton(
              text: 'CREATE POST',
              press: () {},
              color: kPrimaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
