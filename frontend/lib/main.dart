import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frontend/Controller/Other/connection_manager_controller.dart';
import 'package:frontend/Core/Constants/app_strings.dart';
import 'package:frontend/Core/Routes/app_pages.dart';
import 'package:frontend/Core/Routes/app_routes.dart';
import 'package:frontend/Core/Theme/app_theme.dart';
import 'package:frontend/app_config.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppConfig.initialize();
  Get.find<ConnectionManagerController>();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder:
          (_, child) => GetMaterialApp(
            navigatorKey: Get.key,
            title: AppInfo.appTitle,
            getPages: AppPages.pages,
            initialRoute: AppRoutes.initial,
            debugShowCheckedModeBanner: false,
            scrollBehavior: ScrollConfiguration.of(context).copyWith(
              physics: const BouncingScrollPhysics(),
              overscroll: false,
            ),
            theme: AppTheme.lightTheme,
          ),
    );

    // MaterialApp(
    //   title: 'Post Maker',
    //   debugShowCheckedModeBanner: false,
    //   theme: ThemeData(
    //     primaryColor: kPrimaryColor,
    //     scaffoldBackgroundColor: Colors.white,
    //   ),
    //   home: WelcomeScreen(),
    // );
  }
}
