import 'package:flutter/material.dart';
import 'package:madathil/utils/color/app_colors.dart';

class SetReminderWidget extends StatelessWidget {
  final VoidCallback onTap; // Function to handle the tap event

  const SetReminderWidget({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap, // Handle the tap event
      borderRadius: BorderRadius.circular(12), // Optional for ripple effect
      child: Container(
        width: 180,
        decoration: BoxDecoration(
          color: AppColors.primeryColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Set Reminder",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      height: 0,
                      color: AppColors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
              ),
              const SizedBox(
                width: 10,
              ),
              const Icon(
                Icons.notifications_outlined,
                color: AppColors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
