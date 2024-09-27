import 'package:flutter/material.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/view/screens/common_widgets/custom_appbarnew.dart';

class ServiceDetail extends StatelessWidget {
  const ServiceDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Service Details"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Ac Filter Cleaning ",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: AppColors.black),
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Divider(),
              ),
              Text(
                "Details ",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: AppColors.black),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Type ",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: AppColors.grey),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Coast ",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: AppColors.grey),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Duration ",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: AppColors.grey),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Technical Support ",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: AppColors.black),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "500 - 1000",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: AppColors.black),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "2hrs ",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: AppColors.black),
                      ),
                    ],
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Divider(),
              ),
              Text(
                "Description",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: AppColors.black, height: 1.7),
              ),
              const SizedBox(
                height: 5,
              ),
              const TextField(
                maxLines: 4,
                decoration: InputDecoration(
                  enabled: true,
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    borderSide: BorderSide(color: AppColors.black),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    borderSide:
                        BorderSide(color: AppColors.primeryColor, width: 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    borderSide:
                        BorderSide(color: AppColors.primeryColor, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    borderSide:
                        BorderSide(color: AppColors.primeryColor, width: 2),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    borderSide: BorderSide(color: AppColors.red),
                  ),
                  hintText:
                      "The issue is fixed successfully, now it is perfect.",
                  counterText: "",
                  hintStyle: TextStyle(
                    // fontFamily: "SF Pro Display",
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    height: 1.275,
                    color: AppColors.grey,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
