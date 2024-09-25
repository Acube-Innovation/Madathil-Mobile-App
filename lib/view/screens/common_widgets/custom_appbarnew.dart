import 'package:flutter/material.dart';
import 'package:madathil/utils/color/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  // final String title;
  final String title;
  final Widget? leading;
  final List<Widget>? actions;
  final Color? bgcolor;

  const CustomAppBar(
      {super.key,
      required this.title,
      this.leading,
      this.actions,
      this.bgcolor});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      // title: title,
      centerTitle: true,
      title: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .headlineMedium!
            .copyWith(color: AppColors.primeryColor),
      ),
      backgroundColor: bgcolor ?? AppColors.white,
      leading: leading ??
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: AppColors.secondaryColor,
            ),
          ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
