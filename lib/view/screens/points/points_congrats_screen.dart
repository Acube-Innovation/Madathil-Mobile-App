import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/view/screens/common_widgets/custom_images.dart';

class CongratulationsScreen extends StatelessWidget {
  const CongratulationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.amber, // Background color
      body: Center(
        child: Container(
          width: 300, // Define the card width
          padding: const EdgeInsets.all(20), // Padding for the card content
          decoration: BoxDecoration(
            color: AppColors.white, // Card background color
            borderRadius: BorderRadius.circular(20), // Rounded corners
            boxShadow: [
              BoxShadow(
                color:
                    AppColors.black.withOpacity(0.1), // Light shadow for effect
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Sparkle Lottie animation
              Lottie.asset(
                'assets/lottie/sparkle.json',
                width: 100, // Adjust as per your design
                height: 100,
                fit: BoxFit.fill,
              ),
              const SizedBox(height: 10),

              // Display points
              Text(
                '+1000',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    height: 0,
                    color: AppColors.green,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 10),

              // Gift Box Lottie animation
              const CustomPngImage(
                imageName: 'assets/images/gift_box.png',
                width: 100, // Adjust as per your design
                height: 100,
                boxFit: BoxFit.fill,
              ),

              const SizedBox(height: 20),

              // Congratulatory text
              Text(
                'Congratulations!',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    height: 0,
                    color: AppColors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w800),
              ),

              const SizedBox(height: 10),

              // Description text
              Text(
                'You received 1000 points\nwith the sale of 4 solar panels',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    height: 0,
                    color: AppColors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.normal),
              ),

              const SizedBox(height: 20),

              // Forward arrow icon
              const Icon(
                Icons.arrow_forward,
                size: 24,
                color: AppColors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
