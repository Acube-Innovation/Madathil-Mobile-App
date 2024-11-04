import 'package:flutter/material.dart';
import 'package:madathil/size_config.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButtonWithIcon extends StatelessWidget {
  const CustomButtonWithIcon({
    super.key,
    this.height,
    this.width,
    this.color,
    this.text,
    this.onPressed,
    this.textColor,
    this.child,
    this.icon,
  });

  final double? width, height;
  final Color? color, textColor;
  final String? text;
  final Function()? onPressed;
  final Widget? child;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      minWidth: width ?? SizeConfig.screenWidth,
      height: height ?? 45,
      color: color ?? AppColors.primeryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0,
      child: child ??
          Row(
            mainAxisSize: MainAxisSize.min, // Adjusts size based on content
            children: [
              Text(
                text!,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: textColor ?? AppColors.white,
                    ),
              ),
              if (icon != null) // Display icon only if it's passed
                Padding(
                  padding: const EdgeInsets.only(
                      left: 8.0), // Space between text and icon
                  child: Icon(
                    icon,
                    color: textColor ?? AppColors.white,
                  ),
                ),
            ],
          ),
    );
  }
}
