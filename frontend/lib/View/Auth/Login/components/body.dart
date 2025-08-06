import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frontend/Controller/Auth/login_controller.dart';
import 'package:frontend/Core/Common/Widgets/validation_helper.dart';
import 'package:frontend/Core/Constants/app_strings.dart';
import 'package:frontend/Core/Utils/app_colors.dart';
import 'package:frontend/Core/Common/Widgets/already_have_account_check.dart';
import 'package:frontend/Core/Common/Widgets/custom_headin_text.dart';
import 'package:frontend/Core/Common/Widgets/rounded_button.dart';
import 'package:frontend/Core/Common/Widgets/rounded_input_field.dart';
import 'package:frontend/Core/Common/Widgets/rounded_pass_field.dart';
import 'package:frontend/View/Auth/Login/components/background.dart';
import 'package:get/state_manager.dart';

class Body extends GetView<LoginController> {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Stack(
      children: [
        const Background(),
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          padding: EdgeInsets.only(
            left: 24,
            right: 24,
            bottom: MediaQuery.of(context).viewInsets.bottom + 24,
            top: size.height * 0.1,
          ),
          child: Form(
            key: controller.loginFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomHeadingText(title: AppInfo.signIn),
                SizedBox(height: size.height * 0.03),
                SvgPicture.asset(
                  ImagePath.loginLogo,
                  height: size.height * 0.3,
                  fit: BoxFit.contain,
                  placeholderBuilder: (context) => CircularProgressIndicator(),
                ),

                SizedBox(height: size.height * 0.03),
                RoundedInputField(
                  controller: controller.emailController,
                  validator: (value) => ValidationHelper.validateEmail(value),
                  hintText: AppInfo.enterEmail,
                  color: AppColors.primary,
                  textColor: Colors.white,
                ),
                RoundedPasswordField(
                  validator: ValidationHelper.validatePassword,
                  controller: controller.passwordController,
                ),
                RoundedButton(
                  text: AppInfo.signIn,
                  press: controller.login,
                  color: AppColors.primary,
                ),
                SizedBox(height: size.height * 0.01),
                AlreadyAccountCheck(login: true, press: controller.singUp),
              ],
            ),
          ),
        ),
      ],
    );
  }
}


// class Body extends GetView<LoginController> {
//   const Body({super.key});

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return SingleChildScrollView(
//       physics: const BouncingScrollPhysics(),
//       keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
    
//       padding: EdgeInsets.only(
//         left: 24,
//         right: 24,
//         bottom: MediaQuery.of(context).viewInsets.bottom + 24,
//       ),
//       child: Form(
//         key: controller.loginFormKey,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             CustomHeadingText(title: AppInfo.signIn),
//             SizedBox(height: size.height * 0.03),
//             SvgPicture.asset(
//               ImagePath.loginLogo,
//               height: size.height * 0.3,
//               fit: BoxFit.contain,
//             ),
//             SizedBox(height: size.height * 0.03),
//             RoundedInputField(
//               controller: controller.emailController,
//               validator: (value) => ValidationHelper.validateEmail(value),
//               hintText: AppInfo.enterEmail,
//               color: AppColors.primary,
//               textColor: Colors.white,
//             ),
//             RoundedPasswordField(
//               validator: ValidationHelper.validatePassword,
//               controller: controller.passwordController,
//             ),
//             RoundedButton(
//               text: AppInfo.signIn,
//               press: controller.login,
//               color: AppColors.primary,
//             ),
//             SizedBox(height: size.height * 0.01),
//             AlreadyAccountCheck(login: true, press: controller.singUp),
//           ],
//         ),
//       ),
//     );
//   }
// }
