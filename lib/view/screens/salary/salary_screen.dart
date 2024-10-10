import 'package:custom_date_range_picker/custom_date_range_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/utils/custom_loader.dart';
import 'package:madathil/utils/no_data_found.dart';
import 'package:madathil/view/screens/common_widgets/custom_appbarnew.dart';
import 'package:madathil/view/screens/salary/components/salary_list.dart';
import 'package:madathil/viewmodel/salary_viewmodel.dart';
import 'package:madathil/viewmodel/task_viewmodel.dart';
import 'package:provider/provider.dart';

class SalaryScreen extends StatelessWidget {
  const SalaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Salary",
        actions: [
          IconButton(
              onPressed: () {
                showCustomDateRangePicker(context,
                    dismissible: true,
                    minimumDate:
                        DateTime.now().subtract(const Duration(days: 365)),
                    maximumDate: DateTime.now(),
                    onApplyClick: (DateTime startDate, DateTime endDate) async {
                  var sdv =
                      Provider.of<SalaryViewmodel>(context, listen: false);
                  await sdv.addFromToTime(
                      (DateFormat('dd MMM yyyy').format(startDate)),
                      (DateFormat('dd MMM yyyy').format(endDate)));
                  // sdv.resetattendanceListPagination();
                  // sdv.getattendanceListOwn(
                  //     isOthersAttendance: widget.isOthersAttendance!
                  //         ? widget.employeeID
                  //         : null);
                },
                    onCancelClick: () {},
                    backgroundColor: AppColors.white,
                    primaryColor: AppColors.secondaryColor);
              },
              icon: const Icon(Icons.calendar_month_rounded))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Consumer<TasksViewmodel>(builder: (context, lvm, _) {
          return RefreshIndicator(
            onRefresh: () async {
              lvm.clearDates();
              lvm.resettasksListOwnPagination();
              lvm.getTasksListOwn();
            },
            child: (lvm.tasksListOwnList ?? []).isNotEmpty
                ? ListView.builder(
                    shrinkWrap: true,
                    itemCount: (lvm.tasksListOwnList ?? []).length + 1,
                    itemBuilder: (context, index) {
                      if (index == (lvm.tasksListOwnList ?? []).length) {
                        if (lvm.isLoadingtasksListOwnPagination) {
                          return const CustomLoader();
                        } else {
                          if (!lvm.reachedLastPagetasksListOwn) {
                            if (!lvm.isLoadingtasksListOwnPagination) {
                              lvm.getTasksListOwn();
                            }
                            return const CustomLoader();
                          }
                        }
                      } else {
                        return SalaryListItem(
                            data: lvm.tasksListOwnList?[index]);
                      }
                      return null;
                    },
                  )
                : lvm.isLoadingtasksListOwnPagination
                    ? const CustomLoader()
                    : NoDataFOund(
                        onRefresh: () {
                          lvm.clearFilter();
                          lvm.resettasksListOwnPagination();
                          lvm.getTasksListOwn();
                        },
                      ),
          );
        }),
      ),
    );
  }
}
