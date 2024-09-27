import 'package:flutter/material.dart';
import 'package:madathil/utils/color/app_colors.dart';

class AppTheme {
  static ThemeData appTheme = ThemeData(
    useMaterial3: false,
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColors.primeryColor)),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primeryColor,
      textStyle: const TextStyle(
          color: AppColors.white,
          fontSize: 14,
          fontWeight: FontWeight.bold,
          fontFamily: "Poppins"),
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
    )),
    textTheme: const TextTheme(
      labelMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: AppColors.primeryColor,
          fontFamily: "Poppins"),
      headlineLarge: TextStyle(
          fontSize: 25, color: AppColors.primeryColor, fontFamily: "Poppins"),
      headlineMedium: TextStyle(
          fontSize: 20, color: AppColors.primeryColor, fontFamily: "Poppins"),
      displayLarge: TextStyle(
          fontSize: 25, color: AppColors.primeryColor, fontFamily: "Poppins"),
      displayMedium: TextStyle(
          fontSize: 20, color: AppColors.primeryColor, fontFamily: "Poppins"),
      titleLarge: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.bold,
          color: AppColors.primeryColor,
          fontFamily: "Poppins"),
      titleMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: AppColors.primeryColor,
          fontFamily: "Poppins"),
      titleSmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: AppColors.primeryColor,
          fontFamily: "Poppins"),
      bodyLarge: TextStyle(
          fontSize: 20, color: AppColors.black, fontFamily: "Poppins"),
      bodyMedium: TextStyle(
          fontSize: 14, color: AppColors.black, fontFamily: "Poppins"),
      bodySmall: TextStyle(
          fontSize: 12, color: AppColors.black, fontFamily: "Poppins"),
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: const TextStyle(
          fontSize: 14, color: AppColors.grey, fontFamily: "Poppins"),
      floatingLabelStyle:
          const TextStyle(color: AppColors.primeryColor, fontFamily: "Poppins"),
      contentPadding:
          const EdgeInsetsDirectional.symmetric(horizontal: 20, vertical: 5),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(color: AppColors.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(color: AppColors.primeryColor),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(color: AppColors.red),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(color: AppColors.red),
      ),
    ),
  );
}
