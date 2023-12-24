import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infrastrukturdigitaledukasi_techincaltest/app/utils/colors.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
        elevation: 0
      ),
      fontFamily: 'Poppins',
      textTheme: TextTheme(
        headlineLarge: TextStyle(
          fontSize: 28.sp,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
        headlineMedium: TextStyle(
          fontSize: 26.sp,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
        headlineSmall: TextStyle(
          fontSize: 24.sp,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
        displayLarge: TextStyle(
          fontSize: 22.sp,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        displayMedium: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        displaySmall: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        bodyLarge: TextStyle(
          fontSize: 18.sp,
          color: Colors.black,
        ),
        bodyMedium: TextStyle(
          fontSize: 16.sp,
          color: Colors.black,
        ),
        bodySmall: TextStyle(
          fontSize: 14.sp,
          color: Colors.black,
        )
      ),
      colorScheme: const ColorScheme.light(primary: AppColors.primaryColor)
    );
  }

  static List<BoxShadow> boxShadows = [
    BoxShadow(
      blurRadius: 10,
      spreadRadius: 0,
      color: AppColors.shadowColor,
      offset: const Offset(0, 2)
    )
  ];
}