import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/view/screens/common_widgets/custom_appbarnew.dart';
import 'package:madathil/view/screens/common_widgets/custom_buttons.dart';
import 'package:madathil/view/screens/common_widgets/custom_images.dart';
import 'package:madathil/view/screens/payment_mode/payment_mode.dart';
import 'package:madathil/view/screens/profile/widgets/detail_card.dart';

class CustomerDetailScreen extends StatelessWidget {
  const CustomerDetailScreen({super.key});

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
        title: "Customer Details",
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
              child: SizedBox(
                width: 150,
                child: Text(
                  "ABC House, efc street, ghi P.O, kfc Taluk, Mlp Kerala, India,125647",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        height: 1.7,
                        color: AppColors.grey,
                      ),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
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
              value: "9638527410",
              data2: "Contact email",
              value2: "abc@mail.com",
            ),
            const SizedBox(
              height: 10,
            ),
            const Spacer(),
            CustomButton(
              text: "Order Product",
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PaymentModeScreen(),
                    ));
              },
            )
          ],
        ),
      ),
    );
  }
}
