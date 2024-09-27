import 'package:flutter/material.dart';
import 'package:madathil/app_images.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/view/screens/common_widgets/custom_appbarnew.dart';
import 'package:madathil/view/screens/common_widgets/custom_buttons.dart';
import 'package:madathil/view/screens/common_widgets/custom_images.dart';

class OrderDetailScreen extends StatelessWidget {
  const OrderDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Order Details"),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: AppColors.bgColor,
                      border: Border.all(color: AppColors.black),
                      borderRadius: BorderRadius.circular(10)),
                  child: const CustomPngImage(
                    height: 127,
                    width: 134,
                    boxFit: BoxFit.contain,
                    imageName: AppImages.solarImage,
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Solar Panel",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: AppColors.primeryColor),
                    ),
                    Text(
                      "1200*100",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: AppColors.black,
                          ),
                    ),
                    Text(
                      "Madathil",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: AppColors.black, height: 1.7),
                    ),
                    Text(
                      "\$ 1000",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: AppColors.black,
                          ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                )
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Divider(),
            ),
            Text(
              "Customer",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: AppColors.grey,
                  ),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                const Icon(
                  Icons.person,
                  color: AppColors.reefGold,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "George K",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: AppColors.black, height: 1.7),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.reefGold.withOpacity(0.1)),
                  child: const Icon(
                    Icons.arrow_forward_ios,
                    color: AppColors.reefGold,
                    size: 15,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Delivery Location",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: AppColors.grey,
                  ),
            ),
            Row(
              children: [
                const Icon(
                  Icons.location_on,
                  color: AppColors.reefGold,
                ),
                const SizedBox(
                  width: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: SizedBox(
                    width: 150,
                    child: Text(
                      "VHC house, ABC Street  Kerala, India",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: AppColors.black, height: 1.7),
                    ),
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.reefGold.withOpacity(0.1)),
                  child: const Icon(
                    Icons.arrow_forward_ios,
                    color: AppColors.reefGold,
                    size: 15,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Payment Mode",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: AppColors.grey,
                  ),
            ),
            Row(
              children: [
                const Icon(
                  Icons.attach_money,
                  color: AppColors.reefGold,
                ),
                const SizedBox(
                  width: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Column(
                    children: [
                      Text(
                        "VISA Classic",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: AppColors.black, height: 1.7),
                      ),
                      Text(
                        "******0000",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: AppColors.black, height: 1.7),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.reefGold.withOpacity(0.1)),
                  child: const Icon(
                    Icons.arrow_forward_ios,
                    color: AppColors.reefGold,
                    size: 15,
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Divider(),
            ),
            Text(
              "Order Info",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: AppColors.black, height: 1.7),
            ),
            Row(
              children: [
                Text(
                  "Shipment Status",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: AppColors.grey, height: 1.7),
                ),
                const Spacer(),
                Text(
                  "Delivered",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: AppColors.black, height: 1.7),
                ),
                const SizedBox(
                  width: 5,
                ),
                const Icon(
                  Icons.task_alt,
                  color: AppColors.malachit,
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  "Order Date",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: AppColors.grey, height: 1.7),
                ),
                const Spacer(),
                Text(
                  "17 jul 2023",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: AppColors.black, height: 1.7),
                ),
                const SizedBox(
                  width: 28,
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: CustomButton(
                color: AppColors.reefGold,
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Download Invoice",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: AppColors.white),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Icon(
                      Icons.download,
                      color: AppColors.white,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
