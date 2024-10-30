import 'dart:developer';

import 'package:custom_date_range_picker/custom_date_range_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:madathil/app_images.dart';
import 'package:madathil/model/model_class/api_response_model/create_check_out_response_model.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/utils/color/util_functions.dart';
import 'package:madathil/view/screens/common_widgets/custom_appbarnew.dart';
import 'package:madathil/view/screens/common_widgets/custom_buttons.dart';
import 'package:madathil/view/screens/common_widgets/custom_dropdown.dart';
import 'package:madathil/view/screens/common_widgets/custom_images.dart';
import 'package:madathil/view/screens/common_widgets/custom_text_field.dart';
import 'package:madathil/view/screens/orders/order_detail_screen.dart';
import 'package:madathil/view/screens/statments/widgets/searchable_dropdown.dart';
import 'package:madathil/viewmodel/common_viewmodel.dart';
import 'package:madathil/viewmodel/order_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class OrderHistory extends StatefulWidget {
  const OrderHistory({super.key});

  @override
  State<OrderHistory> createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final orderVm = Provider.of<OrderViewmodel>(context, listen: false);
      orderVm.resetOrderPagination();
      await orderVm.fetchOrderList();
      await orderVm.getOrderStatus();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final orderVm = Provider.of<OrderViewmodel>(context, listen: false);
    return Scaffold(
      appBar: CustomAppBar(
        title: "Order History",
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: GestureDetector(
              onTap: () {
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
      body: Consumer<OrderViewmodel>(builder: (context, ovm, _) {
        if ((ovm.orderListPost ?? []).isEmpty) {
          if (ovm.isLoading) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CupertinoActivityIndicator(color: AppColors.primeryColor),
                  SizedBox(height: 10),
                  Text("Loading..!")
                ],
              ),
            );
          } else {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // CupertinoActivityIndicator(color: AppColors.primeryColor),
                  Text("No Orders available."),
                ],
              ),
            );
          }
        } else {
          return RefreshIndicator(
            onRefresh: () async {
              orderVm.resetOrderPagination();
              orderVm.fetchOrderList();
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(
                  height: 20,
                ),
                itemCount: (ovm.orderListPost ?? []).length + 1,
                itemBuilder: (context, index) {
                  if (index == (ovm.orderListPost ?? []).length) {
                    if (ovm.ispaginationOrderList) {
                      return const SizedBox(
                          height: 30,
                          width: 30,
                          child: CupertinoActivityIndicator(
                              animating: true, radius: 15));
                    } else {
                      if (!ovm.orderListReachLength) {
                        if (!ovm.ispaginationOrderList) {
                          WidgetsBinding.instance
                              .addPostFrameCallback((_) async {
                            ovm.fetchOrderList();
                          });
                          return const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: 5),
                              SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: CupertinoActivityIndicator(
                                      animating: true, radius: 15))
                            ],
                          );
                        }
                      } else {
                        if (ovm.orderListPost!.isEmpty) {
                          return const Center(
                              child: Text(
                            "No Orders available.",
                          ));
                        } else {
                          return const Column(
                            children: [
                              SizedBox(height: 200),
                              Center(
                                  child: Text(
                                "No more Orders available.",
                                style: TextStyle(color: Colors.grey),
                              )),
                            ],
                          );
                        }
                      }
                    }
                  } else {
                    var item = orderVm.orderListPost![index];

                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OrderDetailScreen(
                                      item: item,
                                    )));
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 5),
                        decoration: BoxDecoration(
                            color: AppColors.white,
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.grey.withOpacity(0.5),
                                spreadRadius: 0,
                                blurRadius: 3,
                                offset: const Offset(
                                    0, 3), // changes position of shadow
                              ),
                            ],
                            borderRadius: BorderRadius.circular(10),
                            border:
                                Border.all(color: AppColors.territoryColor)),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color:
                                          AppColors.bgColor?.withOpacity(0.1)),
                                  child: CustomPngImage(
                                    height: 100,
                                    width: 90,
                                    imageName: _getStringForIcon(item.status),
                                    boxFit: BoxFit.contain,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 130,
                                        child: Text(
                                          item.customerName ?? "",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(color: AppColors.black),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        item.name ?? "",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(color: AppColors.grey),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 4,
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        item.billingStatus ?? "",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                                color: AppColors.blue
                                                    .withOpacity(0.5)),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "₹${item.grandTotal ?? 0.0}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(color: AppColors.black),
                                      ),
                                    ],
                                  ),
                                ),
                                const Spacer(),
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColors.secondaryColor
                                          .withOpacity(0.1)),
                                  child: const Icon(
                                    Icons.arrow_forward_ios,
                                    color: AppColors.secondaryColor,
                                    size: 20,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Text(
                                  item.status ?? "",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(color: AppColors.grey),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                _getStatusIcon(item.status),
                                const Spacer(),
                                Text(
                                  UtilFunctions.formatDate(
                                          item.transactionDate ?? "") ??
                                      "",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(color: AppColors.grey),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  }
                  return null;
                },
              ),
            ),
          );
        }
      }),
    );
  }

  String _getStringForIcon(String? name) {
    switch (name) {
      case "Draft":
        return AppImages.draftOrder;
      case "On Hold":
        return AppImages.holdOrder;
      case "To Deliver and Bill":
        return AppImages.toDeliver;
      case "To Bill":
        return AppImages.toBillOrder;
      case "To Deliver":
        return AppImages.toDeliver;
      case "Completed":
        return AppImages.orderList;
      case "Cancelled":
        return AppImages.cancelOrder;
      case "Closed":
        return AppImages.closedOrder;

      default:
        return AppImages.ordersImage;
    }
  }

  Widget _getStatusIcon(String? name) {
    switch (name) {
      case "Draft":
        return const CustomPngImage(
          height: 25,
          width: 25,
          imageName: AppImages.statusShipping,
          boxFit: BoxFit.contain,
        );
      case "On Hold":
        return const CustomPngImage(
          height: 25,
          width: 25,
          imageName: AppImages.holdOrder,
          boxFit: BoxFit.contain,
        );
      case "To Deliver and Bill":
        return const CustomPngImage(
          height: 25,
          width: 25,
          imageName: AppImages.shippingIcon,
          boxFit: BoxFit.contain,
        );
      case "To Bill":
        return const CustomPngImage(
          height: 25,
          width: 25,
          imageName: AppImages.toBillOrder,
          boxFit: BoxFit.contain,
        );

      case "To Deliver":
        return const CustomPngImage(
          height: 25,
          width: 25,
          imageName: AppImages.shippingIcon,
          boxFit: BoxFit.contain,
        );
      case "Completed":
        return const Icon(
          Icons.task_alt,
          color: AppColors.malachit,
        );
      case "Cancelled":
        return const Icon(
          Icons.remove_shopping_cart,
          color: AppColors.red,
        );
      case "Closed":
        return const Icon(
          Icons.remove_circle,
          color: AppColors.red,
        );

      default:
        return const Icon(
          Icons.local_shipping,
          color: AppColors.amber,
        );
    }
  }

  void showfilterPopup(BuildContext context) {
    // Wrap the logic that accesses MediaQuery in a Builder
    final orderVm = Provider.of<OrderViewmodel>(context, listen: false);

    TextEditingController nameController = TextEditingController();
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
                    child: Consumer<OrderViewmodel>(builder: (context, cdv, _) {
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
                                  orderVm.clearFilter();
                                  orderVm.resetOrderPagination();
                                  orderVm.fetchOrderList();
                                  Navigator.pop(context);

                                  // orderVm.resetOrderPagination();
                                  // orderVm.fetchOrderList();
                                },
                                child: const Icon(
                                  Icons.clear,
                                  color: AppColors.black,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 20),

                          Consumer<OrderViewmodel>(builder: (context, pvm, _) {
                            return GestureDetector(
                              onTap: () {
                                // productVm.selectDate(context);

                                showCustomDateRangePicker(context,
                                    dismissible: true,
                                    minimumDate: DateTime.now()
                                        .subtract(const Duration(days: 365)),
                                    maximumDate: DateTime.now()
                                        .add(const Duration(days: 365)),
                                    startDate: pvm.start,
                                    endDate: pvm.end, onApplyClick:
                                        (DateTime startDate, DateTime endDate) {
                                  orderVm.setDateRange(startDate, endDate);
                                }, onCancelClick: () {
                                  orderVm.clearDateRange();
                                  orderVm.resetOrderPagination();

                                  orderVm.fetchOrderList();
                                },
                                    backgroundColor: AppColors.white,
                                    primaryColor: AppColors.secondaryColor);
                              },
                              child: AbsorbPointer(
                                child: CustomTextField(
                                  controller: cdv.dobController,
                                  hint: 'Select dates',
                                  suffixIcon: const Icon(Icons.calendar_month),
                                ),
                              ),
                            );
                          }),

                          const SizedBox(height: 15),
                          SearchableDropdown(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please select a customer';
                              }
                              return null;
                            },
                            hintText: "Select Customer",
                            onItemSelected: (selectedCustomer) {
                              orderVm.setSelCustomer(selectedCustomer);
                            },
                          ),

                          const SizedBox(height: 15),

                          CustomDropdown(
                            hint: 'Status',
                            items: orderVm.orderStatus ?? [],
                            selectedItem: orderVm.selectedStatus,
                            onChanged: (String? value) {
                              log(value.toString());
                              orderVm.setSelStatus(value);
                            },
                          ),

                          const SizedBox(height: 30),

                          // Provides spacing before the button
                          const Spacer(),
                          CustomButton(
                            height: 44,
                            width: double.infinity,
                            onPressed: () {
                              Navigator.pop(context);

                              orderVm.resetOrderPagination();

                              orderVm.fetchOrderList();
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
