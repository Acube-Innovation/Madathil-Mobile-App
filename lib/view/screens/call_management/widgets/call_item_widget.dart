import 'package:flutter/material.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/view/screens/call_management/call_details_screen.dart';
import 'package:madathil/view/screens/common_widgets/custom_images.dart';

class CallItemWidget extends StatelessWidget {
  const CallItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 10,
          );
        },
        itemCount: 3,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const CallDetailsScreen()));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 4),
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors.amber100!.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Complaint for AC",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .copyWith(
                                            height: 0,
                                            color: AppColors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.normal),
                                  ),
                                  const Icon(
                                    Icons.notifications_outlined,
                                    color: AppColors.secondaryColor,
                                    size: 18,
                                  )
                                ],
                              ),
                              Text(
                                "Vidya Menon",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                        height: 0,
                                        color: AppColors.primeryColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal),
                              ),
                              Text(
                                "22 Mar 2022",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                        height: 0,
                                        color: AppColors.primeryColor,
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal),
                              ),
                            ],
                          ),
                          const CustomPngImage(
                            imageName: "assets/images/arrow_forward.png",
                            boxFit: BoxFit.contain,
                            height: 23,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
