import 'package:flutter/material.dart';
import 'package:madathil/app_images.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/view/screens/statments/closing_statment_details.dart';

class ClosingStatementItem extends StatelessWidget {
  const ClosingStatementItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return const SizedBox(height: 0);
      },
      itemCount: 2,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ClosingStatmentDetails()));
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 8),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.primeryColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Left icon container
                    Center(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(AppImages.statementImage, width: 60),
                    )),

                    // Text column
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Customer Name",
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      height: 0,
                                      color: AppColors.black.withOpacity(0.5),
                                    ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "Jhone F K",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                    height: 0,
                                    color: AppColors.primeryColor,
                                    fontSize: 15),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Business name",
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      height: 0,
                                      color: AppColors.black.withOpacity(0.5),
                                    ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "Solar Panel Install",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                    height: 0,
                                    color: AppColors.primeryColor,
                                    fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    // Right column with amount and date
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Close Amount",
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    height: 0,
                                    color: AppColors.black.withOpacity(0.5),
                                  ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "10000.0",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(
                                  height: 0,
                                  color: AppColors.primeryColor,
                                  fontSize: 15),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Closed Date",
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    height: 0,
                                    color: AppColors.black.withOpacity(0.5),
                                  ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "10 Sept 2024",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(
                                  height: 0,
                                  color: AppColors.primeryColor,
                                  fontSize: 15),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
