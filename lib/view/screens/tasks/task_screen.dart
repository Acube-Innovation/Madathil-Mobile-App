import 'package:custom_date_range_picker/custom_date_range_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/view/screens/common_widgets/custom_appbarnew.dart';
import 'package:madathil/view/screens/common_widgets/custom_buttons.dart';
import 'package:madathil/view/screens/common_widgets/custom_dropdown.dart';
import 'package:madathil/view/screens/common_widgets/custom_text_field.dart';
import 'package:madathil/view/screens/tasks/components/others_task_list.dart';
import 'package:madathil/view/screens/tasks/components/own_task_list.dart';
import 'package:madathil/view/screens/tasks/task_creation.dart';
import 'package:madathil/viewmodel/task_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15))),
            backgroundColor: AppColors.primeryColor,
            child: const Icon(Icons.add),
            onPressed: () {
              Provider.of<TasksViewmodel>(context, listen: false)
                  .getListUsers();
              Provider.of<TasksViewmodel>(context, listen: false)
                  .getListTaskType();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const TaskCreationScreen()));
            }),
        appBar: CustomAppBar(
          title: "Tasks",
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: GestureDetector(
                onTap: () {
                  Provider.of<TasksViewmodel>(context, listen: false)
                      .getListTaskStatus();
                  showfilterPopup(context);
                },
                child: const Icon(
                  Icons.tune,
                  color: AppColors.secondaryColor,
                ),
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 40,
                child: TabBar(
                    dividerColor: Colors.transparent,
                    labelStyle: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: AppColors.primeryColor),
                    indicatorSize: TabBarIndicatorSize.tab,
                    labelColor: AppColors.primeryColor,
                    unselectedLabelColor: AppColors.primeryColor,
                    tabs: const [
                      Tab(text: 'Own'),
                      Tab(text: 'Others'),
                    ],
                    indicatorColor: AppColors.primeryColor),
              ),
              const SizedBox(height: 20),
              const Expanded(
                child: TabBarView(
                  children: [OwnTasks(), OtherTasks()],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showfilterPopup(BuildContext context) {
    showModalBottomSheet(
      isDismissible: false,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return PopScope(
          canPop: false,
          child: Stack(
            children: [
              Consumer<TasksViewmodel>(builder: (context, tvm, _) {
                return SingleChildScrollView(
                  child: ClipRRect(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(20)),
                    child: Container(
                      color: AppColors.white,
                      padding: const EdgeInsets.all(5),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.tune,
                                  color: AppColors.black,
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Text(
                                    "Filter",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .copyWith(
                                            height: 1.7,
                                            color: AppColors.black),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                GestureDetector(
                                  onTap: () {
                                    tvm.clearFilter();
                                    Navigator.pop(context);
                                  },
                                  child: const Icon(
                                    Icons.clear,
                                    color: AppColors.black,
                                    size: 30,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 15),
                            GestureDetector(
                              onTap: () {
                                showCustomDateRangePicker(context,
                                    dismissible: true,
                                    minimumDate: DateTime.now()
                                        .subtract(const Duration(days: 365)),
                                    maximumDate: DateTime.now(), onApplyClick:
                                        (DateTime startDate, DateTime endDate) {
                                  tvm.addFromToTime(
                                      (DateFormat('dd MMM yyyy')
                                          .format(startDate)),
                                      (DateFormat('dd MMM yyyy')
                                          .format(endDate)));
                                },
                                    onCancelClick: () {},
                                    backgroundColor: AppColors.white,
                                    primaryColor: AppColors.secondaryColor);
                              },
                              child: AbsorbPointer(
                                child: CustomTextField(
                                  controller: TextEditingController(),
                                  hint:
                                      tvm.fromdate != null && tvm.todate != null
                                          ? '${tvm.fromdate}, ${tvm.todate}'
                                          : 'Select date',
                                  suffixIcon: const Icon(Icons.calendar_month),
                                ),
                              ),
                            ),
                            const SizedBox(height: 15),
                            if ((tvm.listTaskStatusDetails ?? [])
                                .isNotEmpty) ...{
                              CustomDropdown(
                                  hint: 'Select status',
                                  items: tvm.listTaskStatusDetails ?? [],
                                  onChanged: (String? value) {
                                    tvm.addfilterStatus(value);
                                  }),
                            } else ...{
                              const CupertinoActivityIndicator(radius: 10)
                            },
                            const SizedBox(height: 15),
                            CustomButton(
                                height: 44,
                                width: double.infinity,
                                onPressed: () {
                                  Provider.of<TasksViewmodel>(context,
                                          listen: false)
                                      .resettasksListOtherPagination();
                                  Provider.of<TasksViewmodel>(context,
                                          listen: false)
                                      .getTasksListOther();
                                  Navigator.pop(context);
                                },
                                text: "Apply")
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
              Positioned(
                top: -5,
                left: 0,
                right: 0,
                child: Shimmer.fromColors(
                    baseColor: AppColors.grey300,
                    highlightColor: AppColors.grey300.withOpacity(0.2),
                    period: const Duration(seconds: 5),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 120, vertical: 10),
                      child: Container(
                        height: 6,
                        decoration: BoxDecoration(
                            color: AppColors.grey,
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    )),
              )
            ],
          ),
        );
      },
    );
  }
}
