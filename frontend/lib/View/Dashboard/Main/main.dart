import 'package:flutter/material.dart';
import 'package:frontend/Controller/Other/Dashboard/main_controller.dart';
import 'package:frontend/Core/Constants/app_strings.dart';
import 'package:frontend/View/Dashboard/Main/Components/background.dart';
import 'package:frontend/Core/Common/Widgets/custom_headin_text.dart';
import 'package:frontend/Core/Common/Widgets/rounded_button.dart';
import 'package:frontend/Core/Common/Widgets/rounded_input_field.dart';
import 'package:frontend/constant.dart';
import 'package:get/get.dart';

class Body extends GetView<MainController> {
  const Body({super.key});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomHeadingText(title: AppInfo.createPostTitle),
            //Image.asset('assets/images/home.png', height: size.height * 0.35),
            Image.asset(ImagePath.postLogo, height: size.height * 0.35),
            RoundedInputField(
              controller: controller.postDescController,
              hintText: AppInfo.postTitle,
              color: kPrimaryColor,
              textColor: kPrimaryColor,
              onChange: (value) {},
              icon: Icons.title,
            ),
            RoundedInputField(
              controller: controller.postDescController,
              hintText: AppInfo.postDesc,
              color: kPrimaryColor,
              textColor: kPrimaryColor,
              onChange: (value) {
                value.length < 10;
              },
              icon: Icons.description,
              maxLines: 5,
            ),
            RoundedButton(
              text: AppInfo.createPost,
              press: controller.createPost,
              color: kPrimaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
