import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:madathil/app_images.dart';
import 'package:madathil/model/services/api_service/api_urls.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/utils/color/util_functions.dart';
import 'package:madathil/view/screens/common_widgets/custom_appbarnew.dart';
import 'package:madathil/view/screens/common_widgets/custom_buttons.dart';
import 'package:madathil/view/screens/common_widgets/custom_images.dart';
import 'package:madathil/view/screens/common_widgets/custom_text_field.dart';
import 'package:madathil/view/screens/customer/change_customer.dart';
import 'package:madathil/view/screens/payment_mode/payment_mode.dart';
import 'package:madathil/viewmodel/customer_viewmodel.dart';
import 'package:madathil/viewmodel/product_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final customerVm = Provider.of<CustomerViewmodel>(context, listen: false);
    final productVm = Provider.of<ProductViewmodel>(context, listen: false);
    return Scaffold(
      appBar: CustomAppBar(
        title: "Check Out",
        leading: GestureDetector(
          onTap: () {
            log(" ${Provider.of<ProductViewmodel>(context, listen: false).checkOutData?.doctype}");

            // Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.secondaryColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Consumer2<ProductViewmodel, CustomerViewmodel>(
              builder: (context, pvm, cvm, _) {
            return pvm.isLoading
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
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.primeryColor),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Image and Text Column
                            Expanded(
                              child: Row(
                                children: [
                                  // Image Container
                                  Container(
                                    decoration: BoxDecoration(
                                      color: AppColors.grey.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    padding: const EdgeInsets.all(5),
                                    child:

                                        // pvm.checkOutData?.items?.first
                                        //             .image !=
                                        //         null
                                        //     ? Image.network(
                                        //         height: 121,
                                        //         width: 114,
                                        //         "${ApiUrls.kProdBaseURL}${pvm.checkOutData?.items?.first.image}",
                                        //         fit: BoxFit.cover,
                                        //       )
                                        //     :

                                        const CustomPngImage(
                                      imageName: AppImages.placeHolder,
                                      height: 121,
                                      width: 114,
                                      boxFit: BoxFit.contain,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  // Text Information
                                  Flexible(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          pvm.checkOutData?.items?.first
                                                  .brand ??
                                              "Brand",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                                height: 1.7,
                                                color: AppColors.grey,
                                              ),
                                        ),
                                        Text(
                                          pvm.checkOutData?.items?.first
                                                  .itemName ??
                                              "Solar Panel ",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium!
                                              .copyWith(
                                                height: 1.7,
                                                color: AppColors.primeryColor,
                                              ),
                                        ),
                                        Text(
                                          "Quantity",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                                height: 1.7,
                                                color: AppColors.grey,
                                              ),
                                        ),
                                        Text(
                                          " ${pvm.checkOutData?.items?.first.qty?.toInt()}" ??
                                              "1",
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium!
                                              .copyWith(
                                                height: 1.7,
                                                color: AppColors.primeryColor,
                                              ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Right side with Arrow and Text
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                // Vertically centering the arrow icon
                                SizedBox(
                                  height: 105, // Same height as the image
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color:
                                              AppColors.grey.withOpacity(0.1)),
                                      child:
                                          const Icon(Icons.arrow_forward_ios),
                                    ),
                                  ),
                                ),
                                // Text placed at the bottom right
                                Text(
                                  "\$ ${pvm.checkOutData?.items?.first.rate?.toInt()}" ??
                                      "1000",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(
                                        height: 1.7,
                                        color: AppColors.primeryColor,
                                      ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Divider(),
                      ),
                      cvm.customerAddress == null
                          ? const SizedBox()
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Customer",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                        height: 1.7,
                                        color: AppColors.black,
                                      ),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const CustomPngImage(
                                      imageName: 'assets/images/gps.png',
                                      height: 30,
                                      width: 35,
                                    ),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            pvm.checkOutData?.customerName ??
                                                "TestCustomer, 680432",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium!
                                                .copyWith(
                                                    height: 1.7,
                                                    color: AppColors.black),
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            "${cvm.customerAddress?.first.addressLine1},${cvm.customerAddress?.first.addressLine2}\n${cvm.customerAddress?.first.state}" ??
                                                "House no 3, Advocate Lane\nVyttila p.o Kochi",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(
                                                    height: 1.7,
                                                    color: AppColors.black),
                                          ),
                                          Text(
                                            "${cvm.customerAddress?.first.city}, ${cvm.customerAddress?.first.city},\n${cvm.customerAddress?.first.pincode}" ??
                                                "",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(
                                                    height: 1.7,
                                                    color: AppColors.black),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  children: [
                                    const CustomPngImage(
                                      imageName: 'assets/images/phone-call.png',
                                      height: 20,
                                      width: 35,
                                    ),
                                    const SizedBox(width: 9),
                                    Text(
                                      "+91 9638527410",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(color: AppColors.black),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Divider(),
                      ),
                      Text(
                        "Price Details",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              height: 1.7,
                              color: AppColors.black,
                            ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            "Price(1 item)",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(height: 1.7, color: AppColors.black),
                          ),
                          const Spacer(),
                          Text(
                            "\$ ${pvm.checkOutData?.grandTotal?.toInt()}" ??
                                "1000.00",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(height: 1.7, color: AppColors.black),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            "Delivery Charges",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(height: 1.7, color: AppColors.black),
                          ),
                          const Spacer(),
                          Text(
                            "Free",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(height: 1.7, color: AppColors.black),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            "Extra Charges",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(height: 1.7, color: AppColors.black),
                          ),
                          const Spacer(),
                          Text(
                            "0",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(height: 1.7, color: AppColors.black),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            "Amount Payable ",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(height: 1.7, color: AppColors.black),
                          ),
                          const Spacer(),
                          Text(
                            "\$${pvm.checkOutData?.roundedTotal?.toInt()}" ??
                                "1000",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(height: 1.7, color: AppColors.black),
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Divider(),
                      ),
                      Row(
                        children: [
                          Text(
                            "\$${pvm.checkOutData?.roundedTotal?.toInt()}" ??
                                "\$ 1000",
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .copyWith(height: 1.7, color: AppColors.black),
                          ),
                          const Spacer(),
                          CustomButton(
                            width: 200,
                            text: "Place Order",
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext ctx) => Dialog(
                                      shape: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            const SizedBox(height: 10),
                                            Text('Initial payment',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge!
                                                    .copyWith(
                                                        height: 1.7,
                                                        color: AppColors
                                                            .primeryColor)),
                                            const SizedBox(height: 20),
                                            Column(
                                              children: [
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                CustomTextField(
                                                  keyboardType:
                                                      TextInputType.number,
                                                  hint: "Enter amount",
                                                  controller: productVm
                                                      .amountController,
                                                  validator: UtilFunctions
                                                      .requiredField,
                                                ),
                                                const SizedBox(
                                                  height: 30,
                                                ),
                                                CustomButton(
                                                  text: "Submit",
                                                  onPressed: () {
                                                    if (productVm
                                                        .amountController
                                                        .text
                                                        .isNotEmpty) {
                                                      Navigator.of(context)
                                                          .pop();

                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                const PaymentModeScreen(),
                                                          ));
                                                    } else {
                                                      Fluttertoast.showToast(
                                                          gravity: ToastGravity
                                                              .CENTER_RIGHT,
                                                          backgroundColor:
                                                              AppColors.red,
                                                          textColor:
                                                              AppColors.white,
                                                          msg:
                                                              "Please enter Amount",
                                                          toastLength: Toast
                                                              .LENGTH_LONG);
                                                      // toast(
                                                      //     "Please Enter amount",
                                                      //     context);
                                                    }
                                                  },
                                                )
                                              ],
                                            ),
                                            const SizedBox(height: 10),
                                          ],
                                        ),
                                      )));
                            },
                          )
                        ],
                      )
                    ],
                  );
          }),
        ),
      ),
    );
  }
}
