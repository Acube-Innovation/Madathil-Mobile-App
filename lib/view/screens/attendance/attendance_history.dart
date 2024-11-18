import 'package:custom_date_range_picker/custom_date_range_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/utils/custom_loader.dart';
import 'package:madathil/utils/no_data_found.dart';
import 'package:madathil/view/screens/attendance/components/attendance_list_item.dart';
import 'package:madathil/view/screens/common_widgets/custom_appbarnew.dart';
import 'package:madathil/view/screens/common_widgets/loaderwidget.dart';
import 'package:madathil/viewmodel/common_viewmodel.dart';
import 'package:provider/provider.dart';

class AttendanceHistoryScreen extends StatefulWidget {
  final bool? isOthersAttendance;
  final String? employeeID;
  const AttendanceHistoryScreen(
      {super.key, this.isOthersAttendance = false, this.employeeID});

  @override
  State<AttendanceHistoryScreen> createState() =>
      _AttendanceHistoryScreenState();
}

class _AttendanceHistoryScreenState extends State<AttendanceHistoryScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<CommonDataViewmodel>(context, listen: false)
          .resetattendanceListPagination();
      Provider.of<CommonDataViewmodel>(context, listen: false)
          .getattendanceListOwn(
              isOthersAttendance:
                  widget.isOthersAttendance! ? widget.employeeID : null);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Attendance History",
        actions: [
          IconButton(
              onPressed: () {
                showCustomDateRangePicker(context,
                    dismissible: true,
                    minimumDate:
                        DateTime.now().subtract(const Duration(days: 365)),
                    maximumDate: DateTime.now(),
                    onApplyClick: (DateTime startDate, DateTime endDate) async {
                  var cdv =
                      Provider.of<CommonDataViewmodel>(context, listen: false);
                  await cdv.addFromToTime(
                      (DateFormat('dd MMM yyyy').format(startDate)),
                      (DateFormat('dd MMM yyyy').format(endDate)));
                  cdv.resetattendanceListPagination();
                  cdv.getattendanceListOwn(
                      isOthersAttendance: widget.isOthersAttendance!
                          ? widget.employeeID
                          : null);
                },
                    onCancelClick: () {},
                    backgroundColor: AppColors.white,
                    primaryColor: AppColors.secondaryColor);
              },
              icon: const Icon(Icons.calendar_month_rounded))
        ],
      ),
      body: Consumer<CommonDataViewmodel>(builder: (context, cdv, _) {
        if (cdv.isloading!) {
          return const LoaderWidget();
        }
        return RefreshIndicator(
          onRefresh: () async {
            cdv.clearDates();
            cdv.resetattendanceListPagination();
            cdv.getattendanceListOwn(
                isOthersAttendance:
                    widget.isOthersAttendance! ? widget.employeeID : null);
          },
          child: (cdv.attendanceListData ?? []).isEmpty
              ? NoDataFOund(
                  onRefresh: () {
                    cdv.clearDates();
                    cdv.resetattendanceListPagination();
                    cdv.getattendanceListOwn(
                        isOthersAttendance: widget.isOthersAttendance!
                            ? widget.employeeID
                            : null);
                  },
                )
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: (cdv.attendanceListData ?? []).length + 1,
                  itemBuilder: (context, index) {
                    if (index == (cdv.attendanceListData ?? []).length) {
                      if (cdv.isLoadingattendanceListPagination) {
                        return const CustomLoader();
                      } else {
                        if (!cdv.reachedLastPageattendanceList) {
                          if (!cdv.isLoadingattendanceListPagination) {
                            WidgetsBinding.instance
                                .addPostFrameCallback((_) async {
                              cdv.getattendanceListOwn(
                                  isOthersAttendance: widget.isOthersAttendance!
                                      ? widget.employeeID
                                      : null);
                            });
                          }
                          return const CustomLoader();
                        } else {
                          // if (cdv.attendanceListData!.isEmpty) {
                          //   return NoDataFOund(
                          //     onRefresh: () {
                          //       cdv.clearDates();
                          //       cdv.resetattendanceListPagination();
                          //       cdv.getattendanceListOwn(
                          //           isOthersAttendance:
                          //               widget.isOthersAttendance!
                          //                   ? widget.employeeID
                          //                   : null);
                          //     },
                          //   );
                          // } else {
                          //   return const CustomLoader();
                          // }
                        }
                      }
                    } else {
                      return AttendanceHistoryItem(
                          data: cdv.attendanceListData?[index]);
                    }
                    return null;
                  },
                ),
        );
      }),
    );
  }
}
