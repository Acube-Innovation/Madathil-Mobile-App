import 'dart:developer';

import 'package:custom_date_range_picker/custom_date_range_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/utils/util_functions.dart';
import 'package:madathil/view/screens/common_widgets/custom_appbarnew.dart';
import 'package:madathil/view/screens/common_widgets/custom_images.dart';
import 'package:madathil/view/screens/points/points_congrats_screen.dart';
import 'package:madathil/view/screens/statments/add_closing_statment.dart';
import 'package:madathil/view/screens/statments/widgets/closing_statment_item.dart';
import 'package:madathil/viewmodel/common_viewmodel.dart';
import 'package:provider/provider.dart';

class ClosingStatmentsListScreen extends StatefulWidget {
  const ClosingStatmentsListScreen({super.key});

  @override
  State<ClosingStatmentsListScreen> createState() =>
      _ClosingStatmentsListScreenState();
}

class _ClosingStatmentsListScreenState
    extends State<ClosingStatmentsListScreen> {
  String? _selectedDate;

  // Function to handle date selection
  void _handleDateSelected(DateTime date) {
    setState(() {
      _selectedDate =
          DateFormat('dd MMM yyyy').format(date); // Format the selected date
    });
  }

  @override
  Widget build(BuildContext context) {
    final commonVm = Provider.of<CommonDataViewmodel>(context, listen: false);
    return Scaffold(
      appBar: CustomAppBar(
        title: "Closing Statement List",
        actions: [
          Padding(
            padding: const EdgeInsets.all(13.0),
            child: Consumer<CommonDataViewmodel>(builder: (ctx, cdv, _) {
              return (cdv.startFormatted == null)
                  ? InkWell(
                      onTap: () {
                        showCustomDateRangePicker(context,
                            dismissible: true,
                            minimumDate: DateTime.now()
                                .subtract(const Duration(days: 365)),
                            maximumDate:
                                DateTime.now().add(const Duration(days: 365)),
                            startDate: cdv.start,
                            endDate: cdv.end, onApplyClick:
                                (DateTime startDate, DateTime endDate) {
                          commonVm.setDateRange(startDate, endDate);
                          if (commonVm.startFormatted != null &&
                              commonVm.endFormatted != null) {
                            commonVm.resetClosingPagination();
                            commonVm.fetchClosingStatmentList();
                          }
                        }, onCancelClick: () {
                          commonVm.clearDateRange();
                          commonVm.resetClosingPagination();
                          commonVm.fetchClosingStatmentList();
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
                        if (commonVm.startFormatted != null &&
                            commonVm.endFormatted != null) {
                          commonVm.clearDateRange();
                          commonVm.resetClosingPagination();
                          commonVm.fetchClosingStatmentList();
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<CommonDataViewmodel>(context, listen: false)
              .getCustomerList();

          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const AddClosingStatment()));
        },
        backgroundColor: AppColors.primeryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            SizedBox(
              height: 46,
              child: Consumer<CommonDataViewmodel>(builder: (ctx, cdv, _) {
                return TextField(
                  controller: commonVm.searchControllerClosingStament,
                  onChanged: (val) {
                    log(val);
                  },
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(left: 30),
                    suffixIcon: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.primeryColor,
                        ),
                        child: cdv.closingStatmentSearchfn != null
                            ? GestureDetector(
                                onTap: () {
                                  commonVm.clearSearchVal();

                                  commonVm.resetClosingPagination();

                                  commonVm.fetchClosingStatmentList();
                                },
                                child: const Icon(
                                  Icons.clear,
                                  color: Colors.white,
                                ),
                              )
                            : GestureDetector(
                                onTap: () {
                                  commonVm.setSearchValue(commonVm
                                      .searchControllerClosingStament.text);

                                  commonVm.resetClosingPagination();

                                  commonVm.fetchClosingStatmentList();
                                },
                                child: const Icon(
                                  Icons.search,
                                  color: Colors.white,
                                ),
                              )),
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
                      borderSide:
                          BorderSide(color: AppColors.primeryColor, width: 1),
                    ),
                    errorBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25.0)),
                      borderSide: BorderSide(color: AppColors.red),
                    ),
                    hintText: "Search",
                    counterText: "",
                    hintStyle: const TextStyle(
                      // fontFamily: "SF Pro Display",
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      height: 1.275,
                      color: AppColors.grey,
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(
              height: 15,
            ),
            const Expanded(child: ClosingStatementItem())
          ],
        ),
      ),
    );
  }
}
