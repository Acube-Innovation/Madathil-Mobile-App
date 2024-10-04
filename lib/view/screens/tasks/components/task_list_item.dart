import 'package:flutter/material.dart';
import 'package:madathil/app_images.dart';
import 'package:madathil/model/model_class/api_response_model/task_list_others_response.dart';
import 'package:madathil/model/model_class/api_response_model/task_list_own_response.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/view/screens/tasks/task_details.dart';
import 'package:madathil/viewmodel/task_viewmodel.dart';
import 'package:provider/provider.dart';

class TaskListItem extends StatelessWidget {
  final dynamic data;
  const TaskListItem({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    String subject = "";
    String customer = "";
    String expEndDate = "";
    double expectedTime = 0.0;
    String status = "";
    String? assignedby = "";

    if (data is TasksListOthersData) {
      subject = (data as TasksListOthersData).subject ?? "";
      customer = (data as TasksListOthersData).customer ?? "";
      expEndDate = (data as TasksListOthersData).expEndDate ?? "";
      expectedTime = (data as TasksListOthersData).expectedTime ?? 0.0;
      status = (data as TasksListOthersData).status ?? "";
    } else if (data is TasksListOwnList) {
      subject = (data as TasksListOwnList).subject ?? "";
      customer = (data as TasksListOwnList).customer ?? "";
      expEndDate = (data as TasksListOwnList).expEndDate ?? "";
      expectedTime = (data as TasksListOwnList).expectedTime ?? 0;
      status = (data as TasksListOwnList).status ?? "";
      assignedby = (data as TasksListOwnList).assignedUser ?? "";
    }

    return InkWell(
      onTap: () {
        Provider.of<TasksViewmodel>(context, listen: false)
            .getTaskDetails(id: data?.name);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    TaskDetailScreen(isOthers: data is TasksListOthersData)));
      },
      child: Padding(
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
                Image.asset(getImage(subject), width: 50),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        subject,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: AppColors.primeryColor,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        "Customer: $customer",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: AppColors.black),
                      ),
                      Text(
                        expEndDate,
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
                      expectedTime.toString(),
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
                          data?.status ?? "",
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
      ),
    );
  }
}

String getImage(String? status) {
  if ((status ?? "").toLowerCase().contains("refund") ||
      (status ?? "").toLowerCase().contains("deposit")) {
    return AppImages.moneyImage;
  }
  switch (status?.toLowerCase()) {
    case "money":
      return AppImages.moneyImage;
    case "assign":
      return AppImages.assignImage;
    case "sheet":
      return AppImages.sheetsImage;
    default:
      return AppImages.tasksImage;
  }
}
