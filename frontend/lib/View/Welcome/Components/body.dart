import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frontend/Controller/Other/welcome_controller.dart';
import 'package:frontend/Core/Constants/app_strings.dart';
import 'package:frontend/Core/Utils/app_colors.dart';
import 'package:frontend/View/Welcome/Components/background.dart';
import 'package:frontend/Core/Common/Widgets/custom_headin_text.dart';
import 'package:frontend/Core/Common/Widgets/rounded_button.dart';
import 'package:get/get.dart';

class Body extends GetView<WelcomeController> {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomHeadingText(title: AppInfo.welcomeTitle,),
          SizedBox(height: size.height * 0.03),
          SvgPicture.asset(ImagePath.welcomeLogo, height: size.height * 0.5),
          SizedBox(height: size.height * 0.03),
          RoundedButton(
            press: controller.login,
            text: AppInfo.signIn,
            color: AppColors.primary,
          ),
          RoundedButton(
            press: controller.signUp,
            text: AppInfo.signUp,
            color: AppColors.secondary,
            textColor: Colors.black,
          ),
        ],
      ),
    );
  }
}
