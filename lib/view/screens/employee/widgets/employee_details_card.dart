import 'package:flutter/material.dart';
import 'package:madathil/utils/color/app_colors.dart';

class EmployeeDetailsCard extends StatelessWidget {
  final String? data;
  final String? data2;
  final String? data3;
  final String? value;
  final String? value2;
  final String? value3;

  const EmployeeDetailsCard({
    super.key,
    this.data,
    this.data2,
    this.value,
    this.value2,
    this.data3,
    this.value3,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey),
        color: AppColors.grey.withOpacity(0.1),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Flexible(
                child: Text(
                  data ?? "",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        height: 1.7,
                        color: AppColors.black,
                      ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
              const Spacer(),
              Flexible(
                child: Text(
                  value ?? "",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        height: 1.7,
                        color: AppColors.black,
                      ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  textAlign: TextAlign.right,
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
              Flexible(
                child: Text(
                  data2 ?? "",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        height: 1.7,
                        color: AppColors.black,
                      ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
              ),
              const Spacer(),
              Flexible(
                child: Text(
                  value2 ?? "",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        height: 1.7,
                        color: AppColors.black,
                      ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  textAlign: TextAlign.right,
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
              Flexible(
                child: Text(
                  data3 ?? "",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        height: 1.7,
                        color: AppColors.black,
                      ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
              ),
              const Spacer(),
              Flexible(
                child: Text(
                  value3 ?? "",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        height: 1.7,
                        color: AppColors.black,
                      ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
