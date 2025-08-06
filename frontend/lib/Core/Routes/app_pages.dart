import 'package:frontend/Core/Routes/app_routes.dart';
import 'package:frontend/View/Dashboard/Main/home_nav_screen.dart';
import 'package:frontend/View/Auth/Login/login_screen.dart';
import 'package:frontend/View/Auth/Sign%20Up/sign_up_screen.dart';
import 'package:frontend/View/Welcome/welcome_screen.dart';
import 'package:frontend/View/Auth/Bindings/login_binding.dart';
import 'package:frontend/View/Auth/Bindings/signup_binding.dart';
import 'package:frontend/View/Dashboard/Main/main_binding.dart';
import 'package:frontend/View/Initial/initial_binding.dart';
import 'package:frontend/View/Initial/splash_screen.dart';
import 'package:frontend/View/Welcome/welcome_binding.dart';
import 'package:get/get.dart';

class AppPages {
  static List<GetPage> pages = [
    GetPage(
      name: AppRoutes.initial,
      page: () => SplashScreen(),
      binding: InitialBinding(),
    ),

    GetPage(
      name: AppRoutes.welcomeScreen,
      page: () => WelcomeScreen(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: AppRoutes.loginScreen,
      page: () => LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.signUpScreen,
      page: () => SignUpScreen(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: AppRoutes.dashboardScreen,
      page: () => HomeScreen(),
      binding: MainBinding(),
    ),
  ];
}
