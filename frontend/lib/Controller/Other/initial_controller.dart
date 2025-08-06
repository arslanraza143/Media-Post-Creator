import 'package:frontend/Core/Constants/app_strings.dart';
import 'package:frontend/Core/Routes/app_routes.dart';
import 'package:get/get.dart';

class InitialController extends GetxController {
  String appName = AppInfo.appTitle;
  @override
  void onInit() {
    navigateToNext();
    super.onInit();
  }

  Future<void> navigateToNext() async {
    await 3.seconds.delay();
    Get.toNamed(AppRoutes.welcomeScreen);
  }
}
