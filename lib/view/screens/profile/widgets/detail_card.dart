import 'package:flutter/material.dart';
import 'package:madathil/utils/color/app_colors.dart';

class ProfileCards extends StatelessWidget {
  final String? data;
  final String? data2;
  final String? value;
  final String? value2;
  const ProfileCards(
      {super.key, this.data, this.data2, this.value, this.value2});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey),
          color: AppColors.grey.withOpacity(0.1)),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                data ?? "",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      height: 1.7,
                      color: AppColors.black,
                    ),
              ),
              const Spacer(),
              Text(
                value ?? "",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      height: 1.7,
                      color: AppColors.black,
                    ),
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
                data2 ?? "",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      height: 1.7,
                      color: AppColors.black,
                    ),
              ),
              const Spacer(),
              Text(
                value2 ?? "",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      height: 1.7,
                      color: AppColors.black,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
