import 'package:flutter/material.dart';
import 'package:madathil/app_images.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/utils/color/util_functions.dart';
import 'package:madathil/utils/custom_loader.dart';
import 'package:madathil/view/screens/common_widgets/custom_appbarnew.dart';
import 'package:madathil/view/screens/common_widgets/custom_buttons.dart';
import 'package:madathil/view/screens/common_widgets/custom_images.dart';
import 'package:madathil/view/screens/homepage/homepage.dart';
import 'package:madathil/viewmodel/product_viewmodel.dart';
import 'package:provider/provider.dart';

class PaymentSuccess extends StatelessWidget {
  const PaymentSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    final productVm = Provider.of<ProductViewmodel>(context, listen: false);
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Payment Status",
        leading: SizedBox(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Consumer<ProductViewmodel>(builder: (context, pvm, _) {
          return pvm.isLoading
              ? const CustomLoader()
              : Column(
                  children: [
                    const Center(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CustomPngImage(
                          height: 150,
                          width: double.maxFinite,
                          imageName: AppImages.paymentSuccessImage,
                          boxFit: BoxFit.contain,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Text(
                      "Payment Success",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: AppColors.black),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(" \$ ${pvm.amountController.text ?? "N/A"}",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: AppColors.malachit, fontSize: 30)),
                    Text("Id:${pvm.paymentMessage?.paymentEntry ?? "****X"}",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: AppColors.grey,
                            )),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 20),
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 7,
                                offset: const Offset(
                                    0, 3), // changes position of shadow
                              ),
                            ],
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.white),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Row(
                                children: [
                                  Text("Date",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                            color: AppColors.grey,
                                          )),
                                  const Spacer(),
                                  Text(
                                      DateTime.now().toString() ??
                                          "12 Sept 2024",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                            color: AppColors.black,
                                          )),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Row(
                                children: [
                                  Text("Payment mode",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                            color: AppColors.grey,
                                          )),
                                  const Spacer(),
                                  Text(pvm.selectedpayment ?? "Credit Card",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                            color: AppColors.black,
                                          )),
                                ],
                              ),
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.symmetric(vertical: 10),
                            //   child: Row(
                            //     children: [
                            //       Text("Customer Name",
                            //           style: Theme.of(context)
                            //               .textTheme
                            //               .bodyMedium!
                            //               .copyWith(
                            //                 color: AppColors.grey,
                            //               )),
                            //       const Spacer(),
                            //       Text("Test customer",
                            //           style: Theme.of(context)
                            //               .textTheme
                            //               .bodyMedium!
                            //               .copyWith(
                            //                 color: AppColors.black,
                            //               )),
                            //     ],
                            //   ),
                            // ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Row(
                                children: [
                                  Text("Payment status",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                            color: AppColors.grey,
                                          )),
                                  const Spacer(),
                                  Text("success",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                            color: AppColors.black,
                                          )),
                                ],
                              ),
                            )
                          ],
                        )),
                    const Spacer(),
                    CustomButton(
                      text: 'Done',
                      onPressed: () {
                        productVm.clearamount();

                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => const HomePage()));
                      },
                    )
                  ],
                );
        }),
      ),
    );
  }
}
