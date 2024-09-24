import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/view/screens/common_widgets/custom_appbarnew.dart';
import 'package:madathil/view/screens/common_widgets/custom_buttons.dart';

class AttendancePage extends StatelessWidget {
  const AttendancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Attendance"),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Card(
              elevation: 5,
              shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: AppColors.primeryColor)),
              child: SizedBox(
                height: 60,
                child: Center(
                  child: Text(
                    DateFormat('hh : mm a, dd MMM yyyy').format(DateTime.now()),
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
              child: ListView.builder(
            shrinkWrap: true,
            itemCount: 2,
            itemBuilder: (context, index) {
              return const CheckinItem();
            },
          )),
          InkWell(
            onTap: () {
              // Implement check-in logic
            },
            child: Container(
              width: 190,
              height: 190,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.secondaryColor, width: 10),
                color: AppColors.primeryColor,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  'CHECK IN',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(color: AppColors.white),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: CustomButton(
              color: AppColors.white,
              height: 43,
              width: double.maxFinite,
              onPressed: () {
                // Implement history viewing logic
              },
              child: Text(
                'ATTENDANCE HISTORY',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CheckinItem extends StatelessWidget {
  const CheckinItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30.0),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.primeryColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        height: 60,
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          children: [
            const Icon(Icons.calendar_month, color: AppColors.white),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                "09:30 AM",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: AppColors.white),
              ),
            ),
            Text("IN",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: AppColors.white)),
            const SizedBox(width: 5),
            const Icon(Icons.input_outlined, color: AppColors.white)
          ],
        ),
      ),
    );
  }
}
