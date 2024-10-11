
import 'package:flutter/material.dart';
import 'package:madathil/app_images.dart';
import 'package:madathil/model/model_class/api_response_model/monthly_salary_list_response.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/view/screens/salary/components/salary_detail_screen.dart';

class SalaryListItem extends StatelessWidget {
  final Summary? data;
  const SalaryListItem({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(context,
          MaterialPageRoute(builder: (context) => SalaryDetailScreen(month: data?.month))),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child:
                    Image.asset(AppImages.salaryItem, height: 100, width: 100),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text(
                    //   "D72",
                    //   style: Theme.of(context)
                    //       .textTheme
                    //       .bodySmall
                    //       ?.copyWith(color: AppColors.black),
                    // ),
                    Text(
                      "Salary Date: ",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: AppColors.grey),
                    ),
                    Text(
                      data?.monthString ?? 'N/A',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(color: AppColors.black, fontSize: 22),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 1, // Adjust thickness of the divider
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.transparent, // Start with transparency
                                  AppColors.black, // Middle with solid color
                                  Colors.transparent, // End with transparency
                                ],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Total Points",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(color: AppColors.grey),
                              ),
                              Text(
                                data?.points.toString() ?? 'N/A',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(
                                        color: AppColors.primaryLightColor,
                                        fontSize: 22),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Total Salary",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(color: AppColors.grey),
                              ),
                              Text(
                                data?.salary.toString() ?? 'N/A',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(
                                        color: AppColors.primaryLightColor,
                                        fontSize: 22),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
