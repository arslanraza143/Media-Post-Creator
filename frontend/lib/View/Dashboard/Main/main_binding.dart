import 'package:frontend/Controller/Auth/auth_controller.dart';
import 'package:frontend/Controller/Other/Dashboard/main_controller.dart';
import 'package:get/get.dart';

class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AuthController(), permanent: true);
    Get.lazyPut(() => MainController(), fenix: true);
  }
}
