import 'package:flutter/material.dart';
import 'package:madathil/utils/color/app_colors.dart';

import 'package:madathil/view/screens/common_widgets/custom_appbarnew.dart';

class CallDetailsScreen extends StatelessWidget {
  const CallDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Call Details",
        actions: [
          Padding(
            padding: const EdgeInsets.all(13.0),
            child: InkWell(
              onTap: () {},
              child: const Icon(Icons.mode_edit_outlined),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Complaint for AC",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        height: 0,
                        color: AppColors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.w400),
                  ),
                  Text(
                    "22 Mar 2022",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        height: 0,
                        color: AppColors.grey,
                        fontSize: 12,
                        fontWeight: FontWeight.normal),
                  )
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              const Divider(
                color: AppColors.black,
              ),
              const SizedBox(
                height: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Customer Name",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        height: 0,
                        color: AppColors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.normal),
                  ),
                  Text(
                    "Vidya Menon",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        height: 0,
                        color: AppColors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Note",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        height: 0,
                        color: AppColors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.normal),
                  ),
                  Text(
                    "Call service staff after the \nfollow up call 1",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        height: 0,
                        color: AppColors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              const Divider(
                color: AppColors.black,
              ),
              const SizedBox(
                height: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Points",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        height: 0,
                        color: AppColors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.normal),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "1. Water is dripping continuously",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        height: 0,
                        color: AppColors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.normal),
                  ),
                  Text(
                    "2. Have been like this for 4 days",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        height: 0,
                        color: AppColors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.normal),
                  ),
                  Text(
                    "3. Immediate action required",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        height: 0,
                        color: AppColors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.normal),
                  ),
                  Text(
                    "4. No cooling effect",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        height: 0,
                        color: AppColors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.normal),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Divider(
                    color: AppColors.black,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Reminders",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        height: 0,
                        color: AppColors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.normal),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors.black),
                        borderRadius: BorderRadius.circular(6)),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("24 Mar 2022 03:30 PM",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                      height: 0,
                                      color: AppColors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400)),
                          const Icon(Icons.notifications_outlined)
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors.black),
                        borderRadius: BorderRadius.circular(6)),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("25 Mar 2022 09:30 AM ",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                      height: 0,
                                      color: AppColors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400)),
                          const Icon(Icons.notifications_outlined)
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
