import 'package:flutter/material.dart';
import 'package:madathil/size_config.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/view/screens/common_widgets/custom_appbarnew.dart';
import 'package:madathil/view/screens/common_widgets/custom_buttons.dart';

class TaskDetailScreen extends StatelessWidget {
  const TaskDetailScreen({super.key});

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
        title: "Task Details",
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "Check Payments",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      height: 1.7,
                      color: AppColors.black,
                    ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Customer: User Name",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: AppColors.black,
                      ),
                ),
                Text(
                  "1 hr left",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: AppColors.black,
                      ),
                ),
              ],
            ),
            const SizedBox(height: 25),
            Container(
              width: SizeConfig.screenWidth,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.grey),
                  color: AppColors.white.withOpacity(0.1)),
              child: const Text("task description given here"),
            ),
            const SizedBox(height: 25),
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.grey),
                  color: AppColors.white.withOpacity(0.1)),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Task Type",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              height: 1.7,
                              color: AppColors.black,
                            ),
                      ),
                      const Spacer(),
                      Text(
                        "Task",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              height: 1.7,
                              color: AppColors.black,
                            ),
                      ),
                    ],
                  ),
                  const Divider(),
                  Row(
                    children: [
                      Text(
                        "Time",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              height: 1.7,
                              color: AppColors.black,
                            ),
                      ),
                      const Spacer(),
                      Text(
                        "22-09-2024 before 5pm",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              height: 1.7,
                              color: AppColors.black,
                            ),
                      ),
                    ],
                  ),
                  const Divider(),
                  Row(
                    children: [
                      Text(
                        "Assignor",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              height: 1.7,
                              color: AppColors.black,
                            ),
                      ),
                      const Spacer(),
                      Text(
                        "N/A",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              height: 1.7,
                              color: AppColors.black,
                            ),
                      ),
                    ],
                  ),
                  const Divider(),
                  Row(
                    children: [
                      Text(
                        "Assignee",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              height: 1.7,
                              color: AppColors.black,
                            ),
                      ),
                      const Spacer(),
                      Text(
                        "N/A",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              height: 1.7,
                              color: AppColors.black,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            CustomButton(
              text: "UDPDATE TASK",
              height: 60,
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}