import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/Controller/Auth/signup_controller.dart';
import 'package:frontend/Core/Common/Widgets/validation_helper.dart';
import 'package:frontend/Core/Constants/app_strings.dart';
import 'package:frontend/Core/Utils/app_colors.dart';
import 'package:frontend/View/Auth/Sign%20Up/components/background.dart';
import 'package:frontend/View/Auth/Sign%20Up/components/or_divider.dart';
import 'package:frontend/View/Auth/Sign%20Up/components/social_icon.dart';
import 'package:frontend/Core/Common/Widgets/already_have_account_check.dart';
import 'package:frontend/Core/Common/Widgets/custom_headin_text.dart';
import 'package:frontend/Core/Common/Widgets/rounded_button.dart';
import 'package:frontend/Core/Common/Widgets/rounded_input_field.dart';
import 'package:frontend/Core/Common/Widgets/rounded_pass_field.dart';
import 'package:frontend/constant.dart';
import 'package:get/state_manager.dart';

class Body extends GetView<SignupController> {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Form(
          key: controller.singupFormKey,
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
                controller: controller.emailController,
                hintText: AppInfo.enterEmail,
                color: kPrimaryColor,
                textColor: kPrimaryColor,
                validator: (value) => ValidationHelper.validateEmail(value),
                
              ),
          
              // SizedBox(height: size.height * 0.3),
              RoundedPasswordField(
                controller: controller.passwordController,
                validator: (value) => ValidationHelper.validatePassword(value),
          
              ),
              RoundedButton(
                text: AppInfo.signUp,
                press: controller.login,
          
                color: AppColors.primary,
              ),
              AlreadyAccountCheck(
                login: false,
                press: controller.login,
                // () {
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) {
                //         return LoginScreen();
                //       },
                //     ),
                //   );
                // },
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
      ),
    );
  }
}
