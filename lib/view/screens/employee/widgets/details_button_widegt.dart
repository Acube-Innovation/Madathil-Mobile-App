import 'package:flutter/material.dart';
import 'package:madathil/app_images.dart';
import 'package:madathil/utils/color/app_colors.dart';

class DetailsButtonWidegt extends StatelessWidget {
  final String? data;
  final VoidCallback? onTap;

  const DetailsButtonWidegt({
    super.key,
    this.data, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.grey),
            color: AppColors.grey.withOpacity(0.1)),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  data ?? "",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        height: 1.7,
                        color: AppColors.black,
                      ),
                ),
                const Spacer(),
                Image.asset(AppImages.forward, width: 20)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
