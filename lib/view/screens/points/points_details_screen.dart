import 'package:flutter/material.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/view/screens/common_widgets/custom_appbarnew.dart';
import 'package:madathil/view/screens/common_widgets/custom_images.dart';

class PointsDetailsScreen extends StatelessWidget {
  const PointsDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Details"),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 60,
                ),
                const CustomPngImage(
                  imageName: "assets/images/point_detail_icon.png",
                  boxFit: BoxFit.fitWidth,
                  width: 130,
                  height: 130,
                ),
                const SizedBox(
                  height: 25,
                ),
                Text(
                  "You earned points",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      height: 0,
                      color: AppColors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "+100",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      height: 1.3, color: AppColors.green, fontSize: 28),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  "By selling 4 solar panels",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      height: 0,
                      color: AppColors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.normal),
                ),
                const SizedBox(
                  height: 90,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: AppColors.grey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.all(25),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Customer Name",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                      height: 0,
                                      color: AppColors.grey,
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal),
                            ),
                            Text(
                              'Rahul',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                      height: 0,
                                      color: AppColors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w800),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Date",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                      height: 0,
                                      color: AppColors.grey,
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal),
                            ),
                            Text(
                              '26 May 2024',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                      height: 0,
                                      color: AppColors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w800),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Credit amount",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                      height: 0,
                                      color: AppColors.grey,
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal),
                            ),
                            Text(
                              '2300.00',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                      height: 0,
                                      color: AppColors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w800),
                            )
                          ],
                        ),

                          const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Product",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                      height: 0,
                                      color: AppColors.grey,
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal),
                            ),
                            Text(
                              'Solar Panel',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                      height: 0,
                                      color: AppColors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w800),
                            )
                          ],
                        ),
                             const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Product count",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                      height: 0,
                                      color: AppColors.grey,
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal),
                            ),
                            Text(
                              '4',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                      height: 0,
                                      color: AppColors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w800),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
