import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frontend/Controller/Other/initial_controller.dart';
import 'package:frontend/Core/Constants/app_strings.dart';
import 'package:frontend/Core/Utils/app_colors.dart';
import 'package:get/get.dart';

class SplashScreen extends GetView<InitialController> {
  
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
        //final controller = Get.find<InitialController>();

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            //spacing: 10.w,
            children: [
              Icon(
                Icons.local_post_office_sharp,
                size: 50.w,
                color: Colors.white,
              ),
              Text(
                controller.appName,
                style: Get.textTheme.bodyLarge?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
