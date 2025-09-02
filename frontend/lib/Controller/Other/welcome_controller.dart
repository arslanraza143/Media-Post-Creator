import 'package:frontend/Core/Routes/app_routes.dart';
import 'package:get/get.dart';

class WelcomeController extends GetxController {
  void login() {
    Get.toNamed(AppRoutes.loginScreen);

    // try {
    //   Get.toNamed(AppRoutes.loginScreen);
    // } catch (e, stack) {
    //   print("Navigation error: $e");
    //   print(stack);
    // }
  }

  void signUp() {
    Get.toNamed(AppRoutes.signUpScreen);
  }
}
