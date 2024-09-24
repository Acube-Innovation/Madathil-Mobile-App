import 'package:flutter/material.dart';
import 'package:madathil/app_colors.dart';

class AppTheme {
  static ThemeData appTheme = ThemeData(
    useMaterial3: false,
    scaffoldBackgroundColor: AppColors.white,
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primaryColor,
      textStyle: const TextStyle(
          fontSize: 14, fontWeight: FontWeight.bold, fontFamily: "Poppins"),
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
    )),
    textTheme: const TextTheme(
      labelMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: AppColors.primaryColor,
          fontFamily: "Poppins"),
      headlineLarge: TextStyle(
          fontSize: 35, color: AppColors.primaryColor, fontFamily: "Poppins"),
      headlineMedium: TextStyle(
          fontSize: 25, color: AppColors.primaryColor, fontFamily: "Poppins"),
      displayLarge: TextStyle(
          fontSize: 25, color: AppColors.primaryColor, fontFamily: "Poppins"),
      displayMedium: TextStyle(
          fontSize: 20, color: AppColors.primaryColor, fontFamily: "Poppins"),
      titleLarge: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: AppColors.primaryColor,
          fontFamily: "Poppins"),
      titleMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: AppColors.primaryColor,
          fontFamily: "Poppins"),
      titleSmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: AppColors.primaryColor,
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
          const TextStyle(color: AppColors.primaryColor, fontFamily: "Poppins"),
      contentPadding:
          const EdgeInsetsDirectional.symmetric(horizontal: 20, vertical: 5),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(color: AppColors.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(color: AppColors.primaryColor),
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
