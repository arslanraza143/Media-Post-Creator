import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:frontend/Controller/Auth/auth_controller.dart';
import 'package:frontend/Core/Constants/app_strings.dart';
import 'package:frontend/Core/Routes/app_routes.dart';
import 'package:frontend/Repository/auth_repo.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  var isPasswordVisible = false.obs;
  //var isRememberMe = true.obs;
  var showError = false.obs;

  final emailController = TextEditingController();
  final usernameController = TextEditingController(
    text: kDebugMode ? "emilys" : "",
  );
  final passwordController = TextEditingController(
    text: kDebugMode ? "emilyspass" : "",
  );
  GetStorage? _getStorage;
  AuthRepo? authRepo;

  @override
  void onInit() {
    _getStorage = GetStorage();
    authRepo = AuthRepo();
    super.onInit();
  }

  //LoginResModel loginResModel = LoginResModel();

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  Future<void> login() async {
    if (loginFormKey.currentState!.validate()) {
      final authController = Get.find<AuthController>();

      final username = usernameController.text.toString();
      final password = passwordController.text.toString();
      final loginResponse = await authController.login(
        username: username,
        password: password,
      );
      if (loginResponse != null) {
        //print(loginResponse.accessToken);

        await _getStorage!.write(
          GetStorageKeys.authInfo,
          loginResponse.toJson(),
        );
      }
      //Get.offAllNamed(AppRoutes.dashboardScreen);
    }
    // if (passwordController.text != '12345678') {
    //   showError.value = true;
    // } else {
    //   Get.toNamed(AppRoutes.dashboardScreen);
    // }
  }

  void singUp() {
    Get.offAllNamed(AppRoutes.signUpScreen);
  }
}
