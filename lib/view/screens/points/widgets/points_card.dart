import 'package:flutter/material.dart';

import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/view/screens/common_widgets/custom_images.dart';

class PointsCard extends StatelessWidget {
  final String points; // Dynamic points

  const PointsCard({
    Key? key,
    required this.points, // Required dynamic parameter for points
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Fetch screen size
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
        color: AppColors.secondaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.08, // Responsive horizontal padding
        ),
        child: Row(
          children: [
            const CustomPngImage(
              imageName: "assets/images/points_icon.png", // Static image
              boxFit: BoxFit.fitWidth,
              height: 200, // Static height for the image
              width: 100, // Static width for the image
            ),
            SizedBox(width: screenWidth * 0.05), // Responsive spacing
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  points, // Dynamic points
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      height: 0,
                      color: AppColors.white,
                      fontSize: screenWidth * 0.1, // Responsive font size
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  "Total points achieved", // Static description
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      height: 0,
                      color: AppColors.white,
                      fontSize: screenWidth * 0.04, // Responsive font size
                      fontWeight: FontWeight.normal),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
