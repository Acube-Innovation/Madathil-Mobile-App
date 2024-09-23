import 'package:flutter/material.dart';
import 'package:madathil/utils/color/app_colors.dart';

class UtilFunctions {
  static String? validateName(String? value) {
    return value == null || value.isEmpty ? 'Name is required' : null;
  }

  static String? validateMobileNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Mobile number is required';
    } else if (!RegExp(r'^\d{10}$').hasMatch(value)) {
      return 'Enter a valid 10-digit mobile number';
    }
    return null;
  }

  static String? validateAddress(String? value) {
    return value == null || value.isEmpty ? 'address is required' : null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    return value == null || value.isEmpty ? 'Password is required' : null;
  }
}

void toast(msg, BuildContext context, {bool? isError = false}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        msg,
        textAlign: TextAlign.start,
        style: Theme.of(context)
            .textTheme
            .bodySmall!
            .copyWith(fontSize: 17, color: AppColors.white),
      ),
      backgroundColor: isError! ? AppColors.green : AppColors.red,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(32),
      elevation: 18,
      duration: const Duration(seconds: 3),
    ),
  );
}
