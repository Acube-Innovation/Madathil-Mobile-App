import 'package:flutter/material.dart';
import 'package:madathil/utils/color/app_colors.dart';

class NoDataFOund extends StatelessWidget {
  final void Function()? onRefresh;
  const NoDataFOund({super.key, this.onRefresh});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          // const Image.Asset(
          //   imageName: "assets/images/no_data.png",
          //   height: 60,
          //   width: 60,
          // ),
          const SizedBox(height: 20),
          Text(
            "No Data Found",
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: AppColors.black),
          ),
          if (onRefresh != null)
            IconButton(
                onPressed: onRefresh,
                icon: const Icon(
                  Icons.refresh_rounded,
                  size: 30,
                ))
        ],
      ),
    );
  }
}
