import 'package:flutter/material.dart';
import 'package:madathil/utils/color/app_colors.dart';

class ProfileCards extends StatelessWidget {
  final String? data;
  final String? data2;
  final String? value;
  final String? value2;

  const ProfileCards({
    super.key,
    this.data,
    this.data2,
    this.value,
    this.value2,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Label 1
              Flexible(
                flex: 2, // Adjust flex value as needed
                child: Text(
                  data ?? "",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        height: 1.7,
                        color: AppColors.black,
                      ),
                ),
              ),
              const Spacer(),
              // Value 1
              Flexible(
                flex: 3, // Allow more space for longer text
                child: Text(
                  value ?? "",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        height: 1.7,
                        color: AppColors.black,
                      ),
                  maxLines: null, // Allow text to wrap if it exceeds one line
                  overflow: TextOverflow.visible, // Handle overflow
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Divider(),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween, // Align at the top
            children: [
              // Label 2
              Flexible(
                flex: 2,
                child: Text(
                  data2 ?? "",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        height: 1.7,
                        color: AppColors.black,
                      ),
                ),
              ),
              const Spacer(),
              // Value 2
              Flexible(
                flex: 3,
                child: Text(
                  value2 ?? "",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        height: 1.7,
                        color: AppColors.black,
                      ),
                  maxLines: null, // Allow text to wrap
                  overflow: TextOverflow.visible, // Handle overflow
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
