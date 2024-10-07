import 'package:flutter/material.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/utils/custom_loader.dart';
import 'package:madathil/utils/no_data_found.dart';
import 'package:madathil/view/screens/tasks/components/task_list_item.dart';
import 'package:madathil/viewmodel/task_viewmodel.dart';
import 'package:provider/provider.dart';

class OwnTasks extends StatefulWidget {
  const OwnTasks({super.key});

  @override
  State<OwnTasks> createState() => _OwnTasksState();
}

class _OwnTasksState extends State<OwnTasks> {
  @override
  void didChangeDependencies() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<TasksViewmodel>(context, listen: false)
          .resettasksListOwnPagination();
      Provider.of<TasksViewmodel>(context, listen: false).getTasksListOwn();
    });
    super.didChangeDependencies();
  }

  TextEditingController? controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 46,
          child: TextField(
            controller: controller,
            onSubmitted: (value) {
              Provider.of<TasksViewmodel>(context, listen: false)
                  .resettasksListOwnPagination();
              Provider.of<TasksViewmodel>(context, listen: false)
                  .getTasksListOwn(searchTerm: value);
            },
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(left: 30),
              suffix: InkWell(
                onTap: () {
                  //   Provider.of<TasksViewmodel>(context, listen: false)
                  //     .resettasksListOwnPagination();
                  // Provider.of<TasksViewmodel>(context, listen: false)
                  //     .getTasksListOwn();
                  // } else {
                  Provider.of<TasksViewmodel>(context, listen: false)
                      .resettasksListOwnPagination();
                  Provider.of<TasksViewmodel>(context, listen: false)
                      .getTasksListOwn(searchTerm: controller?.text);
                  // }
                },
                child: Container(
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: AppColors.primeryColor),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                          // (controller?.text ?? "").isNotEmpty
                          //     ? Icons.close
                          //     :
                          Icons.search,
                          color: Colors.white),
                    )),
              ),
              enabled: true,
              disabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                borderSide: BorderSide(color: AppColors.black),
              ),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
                borderSide: BorderSide(color: AppColors.grey, width: 1),
              ),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
                borderSide: BorderSide(color: AppColors.grey, width: 1),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
                borderSide: BorderSide(color: AppColors.primeryColor, width: 1),
              ),
              errorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
                borderSide: BorderSide(color: AppColors.red),
              ),
              hintText: "Search",
              counterText: "",
              hintStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                height: 1.275,
                color: AppColors.grey,
              ),
            ),
          ),
        ),
        const SizedBox(height: 15),
        Expanded(
          child: Consumer<TasksViewmodel>(builder: (context, lvm, _) {
            return RefreshIndicator(
              onRefresh: () async {
                controller?.clear();
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
                            } else {
                              // if (lvm.tasksListOwnList!.isEmpty) {
                              //   return NoDataFOund(
                              //     onRefresh: () {
                              //       controller?.clear();
                              //       lvm.clearDates();
                              //       lvm.resettasksListOwnPagination();
                              //       lvm.getTasksListOwn();
                              //     },
                              //   );
                              // } else {
                              //   return Container();
                              // }
                            }
                          }
                        } else {
                          return TaskListItem(
                              data: lvm.tasksListOwnList?[index]);
                        }
                        return null;
                      },
                    )
                  : lvm.isLoadingtasksListOwnPagination
                      ? const CustomLoader()
                      : NoDataFOund(
                          onRefresh: () {
                            controller?.clear();
                            lvm.clearFilter();
                            lvm.resettasksListOwnPagination();
                            lvm.getTasksListOwn();
                          },
                        ),
            );
          }),
        )
      ],
    );
  }
}
