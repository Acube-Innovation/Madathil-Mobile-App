import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:madathil/model/model_class/api_response_model/checkin_checkout_list_response.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/utils/no_data_found.dart';
import 'package:madathil/utils/util_functions.dart';
import 'package:madathil/view/screens/attendance/attendance_history.dart';
import 'package:madathil/view/screens/common_widgets/custom_appbarnew.dart';
import 'package:madathil/view/screens/common_widgets/custom_buttons.dart';
import 'package:madathil/view/screens/common_widgets/loaderwidget.dart';
import 'package:madathil/viewmodel/common_viewmodel.dart';
import 'package:provider/provider.dart';

class AttendancePage extends StatelessWidget {
  const AttendancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Attendance"),
      body: Consumer<CommonDataViewmodel>(builder: (context, cdv, _) {
        if (cdv.isloading!) {
          return const LoaderWidget();
        }
        return Column(
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
                    borderSide:
                        const BorderSide(color: AppColors.primeryColor)),
                child: SizedBox(
                  height: 60,
                  child: Center(
                    child: Text(
                      DateFormat('hh : mm a, dd MMM yyyy')
                          .format(DateTime.now()),
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
                child: (cdv.checkOutListResponse?.data ?? []).isEmpty
                    ? NoDataFOund(
                        onRefresh: () {
                          cdv.employeeCheckinList();
                        },
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount:
                            (cdv.checkOutListResponse?.data ?? []).length,
                        itemBuilder: (context, index) {
                          if ((cdv.checkOutListResponse?.data ?? []).isEmpty &&
                              !cdv.isloading!) {
                            return const CupertinoActivityIndicator();
                          }
                          return CheckinItem(
                              data: cdv.checkOutListResponse?.data?[index]);
                        },
                      )),
            InkWell(
              onTap: () async {
                // Implement check-in logic
                UtilFunctions.loaderPopup(context);
                await UtilFunctions().checkLocationPermission(context);
                if (cdv.lat != null && cdv.long != null) {
                  cdv
                      .employeeCheckin(
                          logType: ((cdv.checkOutListResponse?.data ?? [])
                                      .isNotEmpty &&
                                  (isCheckIn(cdv
                                          .checkOutListResponse?.data?.first) ??
                                      false))
                              ? "OUT"
                              : "IN")
                      .then(
                    (value) {
                      if (value) {
                        cdv
                            .employeeCheckinList()
                            .then((value) => Navigator.pop(context));
                      } else {
                        toast("Something went wrong, Please try again", context,
                            isError: true);
                        Navigator.pop(context);
                      }
                    },
                  );
                } else {
                  toast("Location fetching failed, Please try again", context,
                      isError: true);
                  Navigator.pop(context);
                }
              },
              child: Container(
                width: 190,
                height: 190,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: ((cdv.checkOutListResponse?.data ?? [])
                                  .isNotEmpty &&
                              (isCheckIn(
                                      cdv.checkOutListResponse?.data?.first) ??
                                  false))
                          ? AppColors.orange.withOpacity(0.47)
                          : AppColors.secondaryColor,
                      width: 10),
                  color: ((cdv.checkOutListResponse?.data ?? []).isNotEmpty &&
                          (isCheckIn(cdv.checkOutListResponse?.data?.first) ??
                              false))
                      ? AppColors.orange
                      : AppColors.primeryColor,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    ((cdv.checkOutListResponse?.data ?? []).isNotEmpty &&
                            (isCheckIn(cdv.checkOutListResponse?.data?.first) ??
                                false))
                        ? 'CHECK OUT'
                        : 'CHECK IN',
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
                onPressed: () async {
                  await cdv.clearAttendanceData();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const AttendanceHistoryScreen()));
                },
                child: Text(
                  'ATTENDANCE HISTORY',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
          ],
        );
      }),
    );
  }

  bool? isCheckIn(CheckInCheckOutListData? data) {
    if (data?.logType == "IN") {
      return true;
    }
    return false;
  }
}

class CheckinItem extends StatelessWidget {
  final CheckInCheckOutListData? data;
  const CheckinItem({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30.0),
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.primeryColor,
            borderRadius: BorderRadius.circular(10.0)),
        height: 60,
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          children: [
            const Icon(Icons.calendar_month, color: AppColors.white),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                (data?.time ?? "").isNotEmpty
                    ? DateFormat.jm().format(DateTime.parse(data?.time ?? ""))
                    : "",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: AppColors.white),
              ),
            ),
            Text(data?.logType ?? "",
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
