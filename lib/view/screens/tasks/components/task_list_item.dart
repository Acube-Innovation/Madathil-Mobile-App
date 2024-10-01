import 'package:flutter/material.dart';
import 'package:madathil/app_images.dart';
import 'package:madathil/utils/color/app_colors.dart';

class TaskListItem extends StatelessWidget {
  const TaskListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Image.asset(getImage("Money"), width: 50),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Check Payment",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: AppColors.primeryColor,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "Customer: User Name",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: AppColors.black),
                    ),
                    Text(
                      "22-09-2024 before 5pm",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: AppColors.primeryColor),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Text(
                    "1",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(color: AppColors.black),
                  ),
                  Text(
                    "Hrs",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: AppColors.black),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColors.green),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Completed",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: AppColors.white, fontSize: 10),
                      ),
                    ),
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

String getImage(String? status) {
  switch (status?.toLowerCase()) {
    case "money":
      return AppImages.moneyImage;
    case "assign":
      return AppImages.assignImage;
    case "sheet":
      return AppImages.sheetsImage;
    default:
      return AppImages.moneyImage;
  }
}
