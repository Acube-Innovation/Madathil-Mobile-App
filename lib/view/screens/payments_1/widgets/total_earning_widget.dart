import 'package:flutter/material.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/view/screens/common_widgets/custom_images.dart';

class TotalEarningWidget extends StatelessWidget {
  final String earning;
  const TotalEarningWidget({super.key, required this.earning});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.primeryColor),
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const CustomPngImage(
            imageName: 'assets/images/earning.png',
            height: 80,
            width: 80,
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Total Earnings',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: AppColors.grey,
                    fontSize: 13,
                    fontWeight: FontWeight.normal)),
            Text(
             '₹ $earning',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: AppColors.primaryLightColor, fontSize: 25),
            )
          ])
        ],
      ),
    );
  }
}
