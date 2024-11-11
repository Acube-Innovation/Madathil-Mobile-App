import 'package:flutter/material.dart';
import 'package:madathil/size_config.dart';
import 'package:madathil/utils/color/app_colors.dart';


class RefreshButton extends StatelessWidget {
  const RefreshButton(
      {super.key,
      this.height,
      this.width,
      this.color,
      this.text,
      this.onPressed,
      this.textColor,
      this.child});
  final double? width, height;
  final Color? color, textColor;
  final String? text;
  final Function()? onPressed;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      minWidth: width ?? SizeConfig.screenWidth,
      height: height ?? 45,
      color: color ?? AppColors.primeryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 0,
      child: child ??
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.refresh_rounded,
                color: AppColors.white,
              ),
              const SizedBox(width: 8),
              Text(
                text!,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: AppColors.white),
              ),
            ],
          ),
    );
  }
}
