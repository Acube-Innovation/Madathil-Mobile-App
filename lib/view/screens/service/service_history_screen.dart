import 'dart:developer';

import 'package:custom_date_range_picker/custom_date_range_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/view/screens/common_widgets/custom_appbarnew.dart';
import 'package:madathil/view/screens/common_widgets/custom_buttons.dart';
import 'package:madathil/view/screens/common_widgets/custom_dropdown.dart';
import 'package:madathil/view/screens/common_widgets/custom_text_field.dart';
import 'package:madathil/view/screens/service/widgets/service_item.dart';
import 'package:madathil/view/screens/service_list/add_new_service.dart';
import 'package:madathil/viewmodel/common_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class ServiceHistoryScreen extends StatelessWidget {
  const ServiceHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Service History",
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<CommonDataViewmodel>(context, listen: false)
              .getCustomerList();
          Provider.of<CommonDataViewmodel>(context, listen: false)
              .getSalesPersonsListService();
          Provider.of<CommonDataViewmodel>(context, listen: false)
              .resetAddService();

          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddService()));
        },
        backgroundColor: AppColors.primeryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Consumer<CommonDataViewmodel>(
              builder: (context, commonVm, _) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (commonVm.selectedStatus != null)
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.primeryColor),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: Row(
                            children: [
                              Text(
                                commonVm
                                    .selectedStatus!, // Show selected filter
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      height: 0,
                                      fontSize: 14,
                                      color: AppColors.primeryColor,
                                    ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              GestureDetector(
                                onTap: () {
                                  commonVm.clearSelectedStatus();
                                  // Clear the filter when close button is clicked

                                  commonVm.resetServiceHistoryPagination();
                                  commonVm.fetchServiceHistoryList();
                                },
                                child: const Icon(
                                  Icons.close,
                                  color: AppColors.primeryColor,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),

                    const SizedBox(
                      width: 10,
                    ),

                    if (commonVm.startDateService != null &&
                        commonVm.endDateService != null &&
                        commonVm.isFilterOn == true) ...{
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.primeryColor),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: Row(
                            children: [
                              Text(
                                "${commonVm.startDateService != null ? DateFormat('dd/MM').format(DateTime.parse(commonVm.startDateService!)) : ''} - ${commonVm.endDateService != null ? DateFormat('dd/MM').format(DateTime.parse(commonVm.endDateService!)) : ''}",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      height: 0,
                                      fontSize: 14,
                                      color: AppColors.primeryColor,
                                    ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                onTap: () {
                                  commonVm.clearServiceDateRange();

                                  commonVm.resetServiceHistoryPagination();
                                  commonVm.fetchServiceHistoryList();
                                },
                                child: const Icon(
                                  Icons.close,
                                  color: AppColors.primeryColor,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    },

                    /// filter button
                    ///
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        showfilterPopup(context);
                      },
                      child: const Icon(
                        Icons.tune,
                        color: AppColors.primeryColor,
                        size: 30,
                      ),
                    )
                  ],
                );
              },
            ),

            const SizedBox(
              height: 20,
            ),

            //// service item
            const Expanded(
              child: ServiceItem(),
            )
          ],
        ),
      ),
    );
  }

  void showfilterPopup(BuildContext context) {
    final commonVm = Provider.of<CommonDataViewmodel>(context, listen: false);

    String? tempSelectedStatus = commonVm.selectedStatus;

    showModalBottomSheet(
      isDismissible: true,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        final popupHeight =
            MediaQuery.of(context).size.height * 0.6; // Calculate height here
        return Stack(
          children: [
            SingleChildScrollView(
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(20)),
                child: Container(
                  color: AppColors.white,
                  padding: const EdgeInsets.all(5),
                  height: popupHeight, // Use the calculated height
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Consumer<CommonDataViewmodel>(
                        builder: (context, cdv, _) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.tune,
                                color: AppColors.black,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Filter",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                      height: 1.7,
                                      color: AppColors.black,
                                    ),
                              ),
                              const Spacer(),
                              GestureDetector(
                                onTap: () {
                                  if (commonVm.startDateService != null &&
                                      commonVm.endDateService != null) {
                                    commonVm.clearServiceDateRange();
                                    commonVm.resetServiceHistoryPagination();
                                    commonVm.fetchServiceHistoryList();
                                  }
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
                          const SizedBox(height: 20),
                          Consumer<CommonDataViewmodel>(
                              builder: (context, cdv, _) {
                            return GestureDetector(
                              onTap: () {
                                showCustomDateRangePicker(context,
                                    dismissible: true,
                                    minimumDate: DateTime.now()
                                        .subtract(const Duration(days: 365)),
                                    maximumDate: DateTime.now()
                                        .add(const Duration(days: 365)),
                                    startDate: cdv.startservice,
                                    endDate: cdv.endservice, onApplyClick:
                                        (DateTime startDate, DateTime endDate) {
                                  commonVm.setServiceDateRange(
                                      startDate, endDate);
                                  // if (commonVm.startDateService != null &&
                                  //     commonVm.endDateService != null) {
                                  //   log("dateee ---- ${commonVm.startDateService}");
                                  //   commonVm.resetServiceHistoryPagination();
                                  //   commonVm.fetchServiceHistoryList();
                                  // }
                                }, onCancelClick: () {
                                  commonVm.clearServiceDateRange();
                                },
                                    backgroundColor: AppColors.white,
                                    primaryColor: AppColors.secondaryColor);
                              },
                              child: AbsorbPointer(
                                child: CustomTextField(
                                  controller: cdv.dobController,
                                  hint: 'Select date',
                                  suffixIcon: const Icon(Icons.calendar_month),
                                ),
                              ),
                            );
                          }),
                          const SizedBox(height: 15),
                          CustomDropdown(
                            hint: 'Select Status',
                            items: cdv.statusOptions ?? [],
                            selectedItem: tempSelectedStatus != null &&
                                    cdv.statusOptions!
                                        .contains(tempSelectedStatus)
                                ? tempSelectedStatus
                                : null,
                            onChanged: (String? value) {
                              tempSelectedStatus = value;
                            },
                          ),
                          const SizedBox(height: 30),
                          const Spacer(),
                          CustomButton(
                            height: 44,
                            width: double.infinity,
                            onPressed: () {
                              Navigator.pop(context);

                              if (commonVm.startDateService != null &&
                                  commonVm.endDateService != null &&
                                  tempSelectedStatus == null) {
                                cdv.isFilterOn = true;
                                log("${commonVm.isFilterOn}");
                                log("dateee ---- ${commonVm.startDateService}");
                                commonVm.resetServiceHistoryPagination();
                                commonVm.fetchServiceHistoryList();
                              } else if (tempSelectedStatus != null) {
                                commonVm.setSelectedStatus(tempSelectedStatus);
                                commonVm.resetServiceHistoryPagination();
                                commonVm.fetchServiceHistoryList();
                                cdv.isFilterOn = true;
                              } else {
                                commonVm.setSelectedStatus(tempSelectedStatus);
                                commonVm.resetServiceHistoryPagination();
                                commonVm.fetchServiceHistoryList();
                                cdv.isFilterOn = true;
                              }
                            },
                            text: "Apply",
                          )
                        ],
                      );
                    }),
                  ),
                ),
              ),
            ),
            Positioned(
              top:
                  -5, // Adjust position to place it outside the bottom sheet content
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
        );
      },
    );
  }
}
