import 'package:flutter/material.dart';
import 'package:frontend/Core/Routes/app_routes.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  var isPasswordVisible = false.obs;
  //var isRememberMe = true.obs;
  var showError = false.obs;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void login() {
    if (loginFormKey.currentState!.validate()) {
      Get.offAllNamed(AppRoutes.dashboardScreen);
    }
    // if (passwordController.text != '12345678') {
    //   showError.value = true;
    // } else {
    //   Get.toNamed(AppRoutes.dashboardScreen);
    // }
  }

  void singUp() {
    Get.toNamed(AppRoutes.signUpScreen);
  }
}
