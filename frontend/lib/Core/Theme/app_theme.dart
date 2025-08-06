import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frontend/Core/Utils/app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: Colors.white,
    useMaterial3: true,

    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primary,
      surfaceTintColor: AppColors.primary,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w600,
        fontSize: 20.sp,
      ),

      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColors.primary,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
      iconTheme: IconThemeData(color: Colors.white),

    ),

    textTheme: TextTheme(
      displayLarge: TextStyle(
        
        fontSize: 32.sp,
        fontWeight: FontWeight.bold,
      ),
      displayMedium: TextStyle(
        
        fontSize: 28.sp,
        fontWeight: FontWeight.bold,
      ),
      displaySmall: TextStyle(
        
        fontSize: 24.sp,
        fontWeight: FontWeight.w600,
      ),

      headlineLarge: TextStyle(
        
        fontSize: 22.sp,
        fontWeight: FontWeight.w600,
      ),
      headlineMedium: TextStyle(
        
        fontSize: 20.sp,
        fontWeight: FontWeight.w500,
      ),
      headlineSmall: TextStyle(
        
        fontSize: 18.sp,
        fontWeight: FontWeight.w500,
      ),

      titleLarge: TextStyle(
        
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
      ),
      titleMedium: TextStyle(
        
        fontSize: 15.sp,
        fontWeight: FontWeight.w500,
      ),
      titleSmall: TextStyle(
        
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
      ),

      bodyLarge: TextStyle(
        
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: TextStyle(
        
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
      ),
      bodySmall: TextStyle(
        
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
      ),

      labelLarge: TextStyle(
        
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
      ),
      labelMedium: TextStyle(
        
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
      ),
      labelSmall: TextStyle(
        
        fontSize: 10.sp,
        fontWeight: FontWeight.w400,
      ),
    ),

  );


}
