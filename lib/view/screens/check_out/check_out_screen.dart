import 'package:flutter/material.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/view/screens/common_widgets/custom_appbarnew.dart';
import 'package:madathil/view/screens/common_widgets/custom_buttons.dart';
import 'package:madathil/view/screens/common_widgets/custom_images.dart';
import 'package:madathil/view/screens/customer/change_customer.dart';
import 'package:madathil/view/screens/payment_mode/payment_mode.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Check Out",
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.secondaryColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.primeryColor),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image and Text Column
                    Expanded(
                      child: Row(
                        children: [
                          // Image Container
                          Container(
                            decoration: BoxDecoration(
                              color: AppColors.grey.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.all(5),
                            child: const CustomPngImage(
                              imageName: "assets/images/solar.png",
                              height: 121,
                              width: 114,
                              boxFit: BoxFit.contain,
                            ),
                          ),
                          const SizedBox(width: 10),
                          // Text Information
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Brand",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        height: 1.7,
                                        color: AppColors.grey,
                                      ),
                                ),
                                Text(
                                  "Solar Panel ",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                        height: 1.7,
                                        color: AppColors.primeryColor,
                                      ),
                                ),
                                Text(
                                  "Size",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        height: 1.7,
                                        color: AppColors.grey,
                                      ),
                                ),
                                Text(
                                  "1200*100 / 1350 *700",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelSmall!
                                      .copyWith(
                                        height: 1.7,
                                        color: AppColors.primeryColor,
                                      ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(
                                  height: 20,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Right side with Arrow and Text
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        // Vertically centering the arrow icon
                        SizedBox(
                          height: 105, // Same height as the image
                          child: Align(
                            alignment: Alignment.center,
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.grey.withOpacity(0.1)),
                              child: const Icon(Icons.arrow_forward_ios),
                            ),
                          ),
                        ),
                        // Text placed at the bottom right
                        Text(
                          "\$ 1000",
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    height: 1.7,
                                    color: AppColors.primeryColor,
                                  ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Divider(),
              ),
              Text(
                "Customer",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      height: 1.7,
                      color: AppColors.black,
                    ),
              ),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomPngImage(
                    imageName: 'assets/images/gps.png',
                    height: 30,
                    width: 35,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "TestCustomer, 680432",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(height: 1.7, color: AppColors.black),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "House no 3, Advocate Lane\nVyttila p.o Kochi",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(height: 1.7, color: AppColors.black),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Handle change action here

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ChangeCustomer(),
                          ));
                    },
                    child: Text(
                      "Change",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(height: 1.7, color: AppColors.blue),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const CustomPngImage(
                    imageName: 'assets/images/phone-call.png',
                    height: 20,
                    width: 35,
                  ),
                  const SizedBox(width: 9),
                  Text(
                    "+91 9638527410",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: AppColors.black),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Divider(),
              ),
              Text(
                "Price Details",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      height: 1.7,
                      color: AppColors.black,
                    ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    "Price(1 item)",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(height: 1.7, color: AppColors.black),
                  ),
                  const Spacer(),
                  Text(
                    "1000.00",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(height: 1.7, color: AppColors.black),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    "Delivery Charges",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(height: 1.7, color: AppColors.black),
                  ),
                  const Spacer(),
                  Text(
                    "Free",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(height: 1.7, color: AppColors.black),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    "Extra Charges",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(height: 1.7, color: AppColors.black),
                  ),
                  const Spacer(),
                  Text(
                    "0",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(height: 1.7, color: AppColors.black),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    "Amount Payable ",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(height: 1.7, color: AppColors.black),
                  ),
                  const Spacer(),
                  Text(
                    "1000",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(height: 1.7, color: AppColors.black),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Divider(),
              ),
              Row(
                children: [
                  Text(
                    "\$ 1000",
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(height: 1.7, color: AppColors.black),
                  ),
                  const Spacer(),
                  CustomButton(
                    width: 200,
                    text: "Place Order",
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PaymentModeScreen(),
                          ));
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
