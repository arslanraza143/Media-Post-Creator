import 'package:flutter/material.dart';
import 'package:frontend/Core/Routes/app_routes.dart';
import 'package:get/get.dart';

class SignupController extends GetxController{
  final GlobalKey<FormState> singupFormKey = GlobalKey<FormState>();
  
  var isPasswordVisible = false.obs;
  //var isRememberMe = true.obs;
  var showError = false.obs;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void login() {
    if(singupFormKey.currentState!.validate()){
    Get.toNamed(AppRoutes.loginScreen);
    }
    //some database stuff
 
  }

  void singUp() {
    Get.toNamed(AppRoutes.signUpScreen);
  }
}
