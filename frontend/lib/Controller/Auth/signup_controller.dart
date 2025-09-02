import 'package:flutter/material.dart';
import 'package:frontend/Controller/Auth/auth_controller.dart';
import 'package:frontend/Core/Common/Widgets/toasts.dart';
import 'package:frontend/Core/Routes/app_routes.dart';
import 'package:frontend/Core/Utils/app_colors.dart';
import 'package:frontend/Model/SignUp/signup_req_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SignupController extends GetxController {
  final GlobalKey<FormState> singupFormKey = GlobalKey<FormState>();
  GetStorage? _getStorage;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _getStorage = GetStorage();
  }

  var isPasswordVisible = false.obs;
  //var isRememberMe = true.obs;
  var showError = false.obs;

  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void login() {
    Get.offAllNamed(AppRoutes.loginScreen);

    //some database stuff
  }

  Future<void> singUp() async {
    if (singupFormKey.currentState!.validate()) {
      final authController = Get.find<AuthController>();

      final email = emailController.text.toString();
      final username = emailController.text.toString();
      final password = emailController.text.toString();

      final signUpResponse = await authController.singUp(
        username: username,
        email: email,
        password: password,
      );
      if (signUpResponse != null && signUpResponse.id != null) {
        ToastAndDialog.showCustomSnackBar(
          "${signUpResponse.email} account has been created successfully",
          backgroundColor: AppColors.darkGreyColor,
        );
        //Get.offAllNamed(AppRoutes.loginScreen);
      }
    }
  }
}
