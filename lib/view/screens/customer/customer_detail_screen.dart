import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:madathil/model/services/api_service/api_urls.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/view/screens/common_widgets/custom_appbarnew.dart';
import 'package:madathil/view/screens/common_widgets/custom_buttons.dart';
import 'package:madathil/view/screens/common_widgets/custom_images.dart';
import 'package:madathil/view/screens/customer/change_customer.dart';
import 'package:madathil/view/screens/payment_mode/payment_mode.dart';
import 'package:madathil/view/screens/profile/widgets/detail_card.dart';
import 'package:madathil/viewmodel/customer_viewmodel.dart';
import 'package:provider/provider.dart';

class CustomerDetailScreen extends StatefulWidget {
  final String customerName;
  const CustomerDetailScreen({super.key, required this.customerName});

  @override
  State<CustomerDetailScreen> createState() => _CustomerDetailScreenState();
}

class _CustomerDetailScreenState extends State<CustomerDetailScreen> {
  @override
  void initState() {
    log(widget.customerName);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final customerVm = Provider.of<CustomerViewmodel>(context, listen: false);
      customerVm.getCustomerDetail(name: widget.customerName).then((value) {
        if (value) {
          customerVm.getCustomerAddress(name: widget.customerName);
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.secondaryColor,
          ),
        ),
        title: "Customer Details",
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Consumer<CustomerViewmodel>(builder: (context, csv, _) {
          return csv.isLoading
              ? const Center(
                  child: CupertinoActivityIndicator(
                    animating: true,
                    radius: 25,
                    color: AppColors.territoryColor,
                  ),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        height: 80,
                        width: 80,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          color: AppColors.secondaryColor,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Center(
                          child: csv.customerDetails != null &&
                                  csv.customerDetails?.first.image != null
                              ? Image.network(
                                  "${ApiUrls.kProdBaseURL}${csv.customerDetails?.first.image}",
                                  fit: BoxFit.cover,
                                )
                              : const CustomPngImage(
                                  imageName: 'assets/images/user_account.png',
                                  height: 50,
                                  width: 50,
                                  boxFit: BoxFit.contain,
                                ),
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        csv.customerDetails?.first.customerName ?? "test",
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              height: 1.7,
                              color: AppColors.black,
                            ),
                      ),
                    ),
                    Center(
                      child: SizedBox(
                        width: 150,
                        child: csv.customerAddress != null
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    " ${csv.customerAddress?.first.addressLine1}, \n ${csv.customerAddress?.first.addressLine2} " ??
                                        "",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          height: 1.7,
                                          color: AppColors.grey,
                                        ),
                                  ),
                                  Text(
                                    "${csv.customerAddress?.first.city} ,${csv.customerAddress?.first.state} ,${csv.customerAddress?.first.country}" ??
                                        "",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          height: 1.7,
                                          color: AppColors.grey,
                                        ),
                                  ),
                                  Text(
                                    csv.customerAddress?.first.pincode ?? "",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          height: 1.7,
                                          color: AppColors.grey,
                                        ),
                                  )
                                ],
                              )
                            : Text(
                                "ABC House, efc street, ghi P.O, kfc Taluk, Mlp Kerala, India,125647",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      height: 1.7,
                                      color: AppColors.grey,
                                    ),
                              ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        "Contact Details",
                        style:
                            Theme.of(context).textTheme.labelMedium!.copyWith(
                                  height: 1.7,
                                  color: AppColors.grey,
                                ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    ProfileCards(
                      data: "Contact Number",
                      value: csv.customerDetails?.first.mobileNo ?? "",
                      data2: "Contact email",
                      value2: csv.customerDetails?.first.emailId ?? "",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Spacer(),
                    CustomButton(
                      text: "Order Product",
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ChangeCustomer(),
                            ));
                      },
                    )
                  ],
                );
        }),
      ),
    );
  }
}
