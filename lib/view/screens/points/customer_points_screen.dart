import 'dart:developer';

import 'package:custom_date_range_picker/custom_date_range_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/utils/util_functions.dart';
import 'package:madathil/view/screens/common_widgets/custom_appbarnew.dart';
import 'package:madathil/view/screens/common_widgets/custom_images.dart';
import 'package:madathil/view/screens/points/widgets/points_card.dart';
import 'package:madathil/view/screens/points/widgets/receent_activity_item.dart';
import 'package:madathil/viewmodel/common_viewmodel.dart';
import 'package:provider/provider.dart';

class CustomerPointsScreen extends StatefulWidget {
  const CustomerPointsScreen({super.key});

  @override
  State<CustomerPointsScreen> createState() => _CustomerPointsScreenState();
}

class _CustomerPointsScreenState extends State<CustomerPointsScreen> {
  
  @override
  Widget build(BuildContext context) {
    final commonVm = Provider.of<CommonDataViewmodel>(context, listen: false);
    return Scaffold(
        appBar: CustomAppBar(
          title: "Points",
          actions: [
            Padding(
              padding: const EdgeInsets.all(13.0),
              child: Consumer<CommonDataViewmodel>(builder: (ctx, cdv, _) {
                return (cdv.startDate == null && cdv.endDate == null)
                    ? InkWell(
                        onTap: () {
                          showCustomDateRangePicker(context,
                              dismissible: true,
                              minimumDate: DateTime.now()
                                  .subtract(const Duration(days: 365)),
                              maximumDate:
                                  DateTime.now().add(const Duration(days: 365)),
                              startDate: cdv.startPoints,
                              endDate: cdv.endPoints, onApplyClick:
                                  (DateTime startDate, DateTime endDate) {
                            cdv.setPointsDateRange(startDate, endDate);
                            if (commonVm.startDate != null &&
                                commonVm.endDate != null) {
                              cdv.clearPointList();
                              cdv.getPointsList();
                            }
                          }, onCancelClick: () {
                            cdv.clearPointsDateRange();

                            cdv.getPointsList();
                          },
                              backgroundColor: AppColors.white,
                              primaryColor: AppColors.secondaryColor);
                        },
                        child: const CustomPngImage(
                          imageName: "assets/images/calendar.png",
                          boxFit: BoxFit.contain,
                          height: 10,
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          if (cdv.startDate != null && cdv.endDate != null) {
                            log("Preesed--------------");

                            cdv.clearPointsDateRange();

                            cdv.getPointsList();

                            log("cleared--------------");
                          }
                        },
                        child: const Icon(
                          Icons.clear,
                          color: AppColors.black,
                          size: 30,
                        ),
                      );
              }),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Consumer<CommonDataViewmodel>(builder: (ctx, cdv, _) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PointsCard(
                    points:
                        '${cdv.pointsMessage?.totalPoints?.toDouble().round() ?? 0}'),
                const SizedBox(
                  height: 30,
                ),
                Text("Recent Activity",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        height: 0,
                        color: AppColors.primeryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600)),
                const SizedBox(
                  height: 20,
                ),
                const Expanded(child: ReceentActivityItem())
              ],
            );
          }),
        ));
  }
}
