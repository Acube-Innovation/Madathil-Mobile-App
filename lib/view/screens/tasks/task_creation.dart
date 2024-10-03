import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:madathil/utils/util_functions.dart';
import 'package:madathil/view/screens/common_widgets/custom_appbarnew.dart';
import 'package:madathil/view/screens/common_widgets/custom_buttons.dart';
import 'package:madathil/view/screens/common_widgets/custom_dropdown.dart';
import 'package:madathil/view/screens/common_widgets/custom_text_field.dart';
import 'package:madathil/viewmodel/task_viewmodel.dart';
import 'package:provider/provider.dart';

import '../../../utils/color/app_colors.dart';

class TaskCreationScreen extends StatelessWidget {
  const TaskCreationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController titleCTLR = TextEditingController();
    TextEditingController descCTLR = TextEditingController();
    TextEditingController typeCTLR = TextEditingController();
    final taskVm = Provider.of<TasksViewmodel>(context, listen: false);

    return Scaffold(
      appBar: const CustomAppBar(title: "Add Task"),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: taskVm.formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Consumer<TasksViewmodel>(builder: (context, tvm, _) {
                        return Checkbox(
                          value: tvm.isMyself ?? false,
                          onChanged: (val) {
                            tvm.addIsMyself(val);
                          },
                        );
                      }),
                      const SizedBox(width: 5),
                      Text(
                        "For Myself",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: AppColors.grey,
                            ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Task Title ",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(height: 1.7, color: AppColors.grey),
                  ),
                  const SizedBox(height: 5),
                  CustomTextField(
                    onchaged: (val) {},
                    controller: titleCTLR,
                    hint: 'Enter the task title',
                    validator: UtilFunctions.validateName,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Task Description",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          height: 1.7,
                          color: AppColors.grey,
                        ),
                  ),
                  const SizedBox(height: 5),
                  CustomTextField(
                      onchaged: (val) {},
                      maxLines: 8,
                      controller: descCTLR,
                      hint: 'Enter the description',
                      validator: UtilFunctions.validateEmail),
                  const SizedBox(height: 10),
                  Text(
                    "Task type",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          height: 1.7,
                          color: AppColors.grey,
                        ),
                  ),
                  const SizedBox(height: 5),
                  Consumer<TasksViewmodel>(builder: (context, tvm, _) {
                    return CustomDropdown(
                      hint: 'Select type',
                      items: tvm.listTaskTypeDetails ?? [],
                      onChanged: (value) {},
                    );
                  }),
                  const SizedBox(height: 10),
                  Text(
                    "Date",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(height: 1.7, color: AppColors.grey),
                  ),
                  const SizedBox(height: 5),
                  //TODO:
                  CustomTextField(
                      onchaged: (val) {},
                      controller: titleCTLR,
                      suffixIcon: const Icon(Icons.calendar_month,
                          color: AppColors.primeryColor),
                      enabled: false,
                      hint: 'Select date',
                      validator: UtilFunctions.validateName),
                  const SizedBox(height: 10),
                  Consumer<TasksViewmodel>(builder: (context, tvm, _) {
                    if (!(tvm.isMyself ?? false)) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Assignee",
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      height: 1.7,
                                      color: AppColors.grey,
                                    ),
                          ),
                          const SizedBox(height: 5),
                          if ((tvm.listUsersDetails ?? []).isEmpty) ...{
                            const Center(
                                child: CupertinoActivityIndicator(radius: 10)),
                          } else ...{
                            CustomDropdown(
                              hint: "Select Assignee",
                              items: tvm.listUsersDetails ?? [],
                              onChanged: (value) {
                                tvm.addSelectedAssignee(value);
                              },
                            ),
                          }
                        ],
                      );
                    }
                    return const SizedBox();
                  }),
                  const SizedBox(
                    height: 10,
                  ),
                  Consumer<TasksViewmodel>(builder: (context, tvm, _) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: CustomButton(
                          text: "Add Task",
                          width: double.maxFinite,
                          onPressed: () {
                            Provider.of<TasksViewmodel>(context, listen: false)
                                .createTask({
                              "subject": titleCTLR.text,
                              "description": descCTLR.text,
                              "type": "Test",
                              "exp_start_date": DateFormat('dd MMM yyyy')
                                  .format(DateTime.now()),
                              "exp_end_date": "2024-10-10",
                              "assigned_user":
                                  "acubeadmin@gmail.com", //our mail
                              "task_users": [
                                {
                                  "user_name": tvm.listUsersResponse?.data
                                      ?.firstWhere((e) =>
                                          e.fullName == tvm.selectedAssignee)
                                      .name
                                }
                              ]
                            });
                          }),
                    );
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
