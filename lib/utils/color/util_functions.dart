import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:shimmer/shimmer.dart';

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

  static String? validatepincode(String? value) {
    return value == null || value.isEmpty ? 'pincode is required' : null;
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

  static bool checkAPIStatus(bool? status) {
    if (status == true) {
      return true;
    } else {
      return false;
    }
  }

  static String? validateItemName(String? value) {
    return value == null || value.isEmpty ? 'Item name is required' : null;
  }

  static String? validateClosedKw(String? value) {
    return value == null || value.isEmpty ? 'Closed Kw is required' : null;
  }

  static String? validateItemMargin(String? value) {
    return value == null || value.isEmpty ? 'Item margin is required' : null;
  }

  static String? validateItemExpense(String? value) {
    return value == null || value.isEmpty ? 'Item expense is required' : null;
  }

  static String? validateBusiness(String? value) {
    return value == null || value.isEmpty ? 'Business is required' : null;
  }

  static String? validateCalltitle(String? value) {
    return value == null || value.isEmpty ? 'Call title is required' : null;
  }

  static String? validatePoints(String? value) {
    return value == null || value.isEmpty ? 'Call title is required' : null;
  }

  static String? validateNote(String? value) {
    return value == null || value.isEmpty ? 'Note is required' : null;
  }

  static Future<void> selectDate(
      BuildContext context, Function(DateTime) onDateSelected) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), // Default to current date
      firstDate: DateTime(2000), // Minimum date
      lastDate: DateTime(2100), // Maximum date
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.primeryColor, // Header color
              onPrimary: Colors.white, // Header text color
              onSurface: Colors.black, // Text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: AppColors.primeryColor, // Button color
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (selectedDate != null) {
      onDateSelected(selectedDate); // Pass the selected date back to the caller
    }
  }

  static loaderPopup(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      useSafeArea: false,
      context: context,
      barrierColor: Colors.transparent,
      builder: (BuildContext context) {
        return Center(
            child: Card(
          color: AppColors.screenBgColor,
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
            child: CupertinoActivityIndicator(
              animating: true,
              radius: 15,
              color: AppColors.territoryColor,
            ),
          ),
        ));
      },
    );
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
