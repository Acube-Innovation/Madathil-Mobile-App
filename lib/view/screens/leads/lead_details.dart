import 'package:flutter/material.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/view/screens/common_widgets/custom_appbarnew.dart';
import 'package:madathil/view/screens/common_widgets/custom_buttons.dart';
import 'package:madathil/view/screens/common_widgets/custom_images.dart';
import 'package:madathil/view/screens/profile/widgets/detail_card.dart';

class LeadDetailScreen extends StatelessWidget {
  const LeadDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.secondaryColor,
          ),
        ),
        title: "Lead Details",
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                height: 80,
                width: 80,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.secondaryColor,
                ),
                child: const Center(
                  child: CustomPngImage(
                    imageName: 'assets/images/user_account.png',
                    height: 50,
                    width: 50,
                    boxFit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Center(
              child: Text(
                "Test User 1",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      height: 1.7,
                      color: AppColors.black,
                    ),
              ),
            ),
            Center(
              child: Text(
                "testuser@gmail.com",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      height: 1.7,
                      color: AppColors.grey,
                    ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                "Lead Details",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      height: 1.7,
                      color: AppColors.grey,
                    ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const ProfileCards(
              data: "Lead Source",
              value: "N/A",
              data2: "Lead Category",
              value2: "N/A",
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                "Contact Details",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      height: 1.7,
                      color: AppColors.grey,
                    ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const ProfileCards(
              data: "Contact Number",
              value: "N/A",
              data2: "Contact Email",
              value2: "N/A",
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                "Identifiers",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      height: 1.7,
                      color: AppColors.grey,
                    ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const ProfileCards(
              data: "Aadhar Number",
              value: "147852963078",
              data2: "Consumer Number",
              value2: "8529631470",
            ),
            const SizedBox(
              height: 25,
            ),
            CustomButton(
              text: "Order Product",
              height: 60,
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
