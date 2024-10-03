import 'package:custom_date_range_picker/custom_date_range_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:madathil/app_images.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/view/screens/common_widgets/custom_appbarnew.dart';
import 'package:madathil/view/screens/common_widgets/custom_buttons.dart';
import 'package:madathil/view/screens/common_widgets/custom_dropdown.dart';
import 'package:madathil/view/screens/common_widgets/custom_images.dart';
import 'package:madathil/view/screens/common_widgets/custom_text_field.dart';
import 'package:madathil/view/screens/orders/order_detail_screen.dart';
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
      orderVm.fetchOrderList();
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
                                builder: (context) =>
                                    const OrderDetailScreen()));
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
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.customerName ?? "",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(color: AppColors.grey),
                                    ),
                                    // Text(
                                    //   index == 0
                                    //       ? "Solar Panel"
                                    //       : "Air Conditioner",
                                    //   style: Theme.of(context)
                                    //       .textTheme
                                    //       .bodyMedium!
                                    //       .copyWith(
                                    //           color: AppColors.primeryColor),
                                    // ),
                                    Text(
                                      "\$ ${item.grandTotal ?? 0.0}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(color: AppColors.black),
                                    ),
                                  ],
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
                                  index == 0 ? "Delivered" : "Shipping",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(color: AppColors.grey),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                index == 0
                                    ? const Icon(
                                        Icons.task_alt,
                                        color: AppColors.malachit,
                                      )
                                    : const CustomPngImage(
                                        height: 25,
                                        width: 25,
                                        imageName: AppImages.shippingIcon,
                                        boxFit: BoxFit.contain,
                                      ),
                                const Spacer(),
                                Text(
                                  "24 jun 2021",
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

  void showfilterPopup(BuildContext context) {
    // Wrap the logic that accesses MediaQuery in a Builder
    final commonVm = Provider.of<CommonDataViewmodel>(context, listen: false);

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
                              )
                            ],
                          ),
                          const SizedBox(height: 20),
                          GestureDetector(
                            onTap: () {
                              // showCustomDateRangePicker(context,
                              //         dismissible: true,
                              //         minimumDate: DateTime.now()
                              //             .subtract(const Duration(days: 365)),
                              //         maximumDate: DateTime.now()
                              //             .add(const Duration(days: 365)),
                              //         startDate: pvm.start,
                              //         endDate: pvm.end, onApplyClick:
                              //             (DateTime startDate,
                              //                 DateTime endDate) {

                              //     }, onCancelClick: () {

                              //     },
                              //         backgroundColor: AppColors.white,
                              //         primaryColor: AppColors.secondaryColor);
                            },
                            child: AbsorbPointer(
                              child: CustomTextField(
                                controller: cdv.dobController,
                                hint: 'Enter DOB',
                                suffixIcon: const Icon(Icons.calendar_month),
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          CustomTextField(
                            controller: nameController,
                            hint: 'Enter customer name',
                          ),
                          const SizedBox(height: 15),

                          CustomDropdown(
                            hint: 'Select Product',
                            items: const ["solar", "Ac"],
                            // selectedItem: "solar",
                            onChanged: (String? value) {},
                          ),
                          const SizedBox(height: 15),

                          CustomDropdown(
                            hint: 'Status',
                            items: const ["Deliverd", "shipping"],
                            // selectedItem: "Deliverd",
                            onChanged: (String? value) {},
                          ),

                          const SizedBox(height: 30),

                          // Provides spacing before the button
                          const Spacer(),
                          CustomButton(
                            height: 44,
                            width: double.infinity,
                            onPressed: () {
                              Navigator.pop(context);
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
