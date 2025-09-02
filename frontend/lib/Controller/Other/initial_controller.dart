import 'package:frontend/Controller/Auth/auth_controller.dart';
import 'package:frontend/Core/Constants/app_strings.dart';
import 'package:frontend/Core/Routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class InitialController extends GetxController {
  String appName = AppInfo.appTitle;
  GetStorage? _getStorage;
  @override
  void onInit() {
    _getStorage = GetStorage();
    navigateToNext();
    super.onInit();
  }

  Future<void> navigateToNext() async {
    final authController = Get.find<AuthController>();
    await 1.seconds.delay();
    bool? isFirstTime = _getStorage?.read(GetStorageKeys.firstTime);
    if (isFirstTime == null) {
      _getStorage?.write(GetStorageKeys.firstTime, true);
      Get.offAllNamed(AppRoutes.welcomeScreen);
    } else if (authController.isLoggedIn.value) {
      Get.offAllNamed(AppRoutes.dashboardScreen);
    } else {
      Get.offAllNamed(AppRoutes.loginScreen);
    }
    // if (authController.isLoggedIn.value) {
    //   Get.offAllNamed(AppRoutes.dashboardScreen);
    // } else {
    //   Get.toNamed(AppRoutes.welcomeScreen);
    // }
  }
}
