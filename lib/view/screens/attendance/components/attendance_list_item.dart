import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:madathil/model/model_class/api_response_model/attendance_list_response.dart';
import 'package:madathil/utils/color/app_colors.dart';

class AttendanceHistoryItem extends StatelessWidget {
  const AttendanceHistoryItem({super.key, required this.data});
  final AttendanceListData? data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
      child: Row(
        children: [
          Column(
            children: [
              Text(
                (data?.employeeInTime ?? "").isNotEmpty
                    ? DateFormat("h:mm a").format(DateFormat("HH:mm:ss")
                        .parse(data?.employeeInTime ?? ""))
                    : "N/A",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: AppColors.black),
              ),
              const SizedBox(height: 5),
              Container(
                color: AppColors.amber100,
                height: 20,
                width: 2,
              ),
              const SizedBox(height: 5),
              Text(
                (data?.employeeOutTime ?? "").isNotEmpty
                    ? DateFormat("h:mm a").format(DateFormat("HH:mm:ss")
                        .parse(data?.employeeOutTime ?? ""))
                    : "N/A",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: AppColors.black),
              ),
            ],
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.primeryColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              (data?.attendanceDate ?? "").isNotEmpty
                                  ? DateFormat("dd MMM yyyy").format(
                                      DateTime.parse(
                                          data?.attendanceDate ?? ""))
                                  : "N/A",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(color: AppColors.black),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "${data?.city}, ${data?.state}",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      color: data?.status?.toLowerCase() == 'present'
                          ? AppColors.green
                          : AppColors.red,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(data?.status ?? "N/A",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(color: AppColors.white)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
