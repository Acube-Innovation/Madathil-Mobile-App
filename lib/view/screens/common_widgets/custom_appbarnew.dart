import 'package:flutter/material.dart';
import 'package:madathil/utils/color/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  // final String title;
  final Widget title;
  final Widget? leading;
  List<Widget>? actions;

  CustomAppBar({super.key, required this.title, this.leading, this.actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      title: title,
      centerTitle: true,
      // title: Text(
      //   title,
      //   style: const TextStyle(color: AppColors.black),
      // ),
      backgroundColor: AppColors.white, // Set your custom background color

      leading: leading,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
