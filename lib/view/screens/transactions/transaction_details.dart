import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:madathil/model/model_class/api_response_model/payment_history_response.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/utils/color/util_functions.dart';
import 'package:madathil/view/screens/common_widgets/custom_appbarnew.dart';
import 'package:madathil/view/screens/common_widgets/custom_images.dart';
import 'package:madathil/view/screens/leads/components/custom_button_wit_icon.dart';
import 'package:madathil/viewmodel/payment_viewmodel.dart';
import 'package:open_file/open_file.dart';
import 'package:provider/provider.dart';

class TransactionDetails extends StatefulWidget {
  final PaymentHistoryList? item;
  const TransactionDetails({super.key, this.item});

  @override
  State<TransactionDetails> createState() => _TransactionDetailsState();
}

class _TransactionDetailsState extends State<TransactionDetails> {
  var formattedDate;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Provider.of<PaymentViewmodel>(context, listen: false)
          .getPaymentDetails(paymentId: widget.item?.name);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final paymentVm = Provider.of<PaymentViewmodel>(context, listen: false);
    return Scaffold(
      appBar: const CustomAppBar(title: "Transaction Details"),
      body: Consumer<PaymentViewmodel>(builder: (context, pvm, _) {
        if (pvm.paymentDetails != null) {
          formattedDate = DateFormat('dd MMM yyyy')
              .format(DateTime.parse(pvm.paymentDetails!.creation!));
        }
        return pvm.isLoading!
            ? const Center(
                child: CircularProgressIndicator(
                  color: AppColors.secondaryColor,
                ),
              )
            : SingleChildScrollView(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const CustomPngImage(
                          imageName: 'assets/images/person_icon.png',
                          height: 130,
                          width: 130,
                        ),
                        Text(
                          pvm.paymentDetails?.partyName ?? 'N/A',
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    height: 1.7,
                                    color: AppColors.primeryColor,
                                  ),
                        ),
                        Text(
                          pvm.paymentDetails?.basePaidAmount.toString() ??
                              'N/A',
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(
                                height: 1.7,
                                color: AppColors.primeryColor,
                              ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.check_circle,
                              color: AppColors.green,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              pvm.paymentDetails?.status ?? 'N/A',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.black,
                                  ),
                            ),
                          ],
                        ),
                        // Text(
                        //   pvm.paymentDetails?.partyType ?? 'N/A',
                        //   style: Theme.of(context)
                        //       .textTheme
                        //       .headlineMedium!
                        //       .copyWith(
                        //         height: 1.7,
                        //         fontWeight: FontWeight.w500,
                        //         color: AppColors.black,
                        //       ),
                        // ),
                        const SizedBox(
                          height: 16,
                        ),
                        Text(
                          // DateFormat.yMd(pvm.paymentDetails?.creation).add_jm().toString() ?? 'N/A',
                          // pvm.paymentDetails?.creation ?? 'N/A',
                          formattedDate ?? 'N/A',
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.black,
                                  ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Stack(
                          children: [
                            Container(
                              width: 300,
                              padding: const EdgeInsets.only(
                                  top: 70, bottom: 20, left: 5, right: 5),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(0.3),
                                        spreadRadius: 2,
                                        blurRadius: 6,
                                        offset: const Offset(0, 3)),
                                  ],
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(30))),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Transaction ID : ',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall!
                                              .copyWith(
                                                fontWeight: FontWeight.w500,
                                                color: AppColors.black,
                                              ),
                                        ),
                                        Flexible(
                                          child: Text(
                                            pvm.paymentDetails?.referenceNo ??
                                                'N/A',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColors.grey,
                                                ),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'To : ',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall!
                                              .copyWith(
                                                fontWeight: FontWeight.w500,
                                                color: AppColors.black,
                                              ),
                                        ),
                                        Text(
                                          pvm.paymentDetails?.company ?? 'N/A',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                                fontWeight: FontWeight.w500,
                                                color: AppColors.grey,
                                              ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'From : ',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall!
                                              .copyWith(
                                                fontWeight: FontWeight.w500,
                                                color: AppColors.black,
                                              ),
                                        ),
                                        Text(
                                          pvm.paymentDetails?.party ?? 'N/A',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                                fontWeight: FontWeight.w500,
                                                color: AppColors.grey,
                                              ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                                top: 0,
                                child: Container(
                                  height: 50,
                                  width: 300,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 15),
                                  decoration: const BoxDecoration(
                                      color: AppColors.secondaryColor,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15))),
                                  child: Text(
                                    pvm.paymentDetails?.modeofPayement ?? 'N/A',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.white,
                                        ),
                                  ),
                                ))
                          ],
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        pvm.paymentDetails?.remarks != null
                            ? Container(
                                padding: const EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color:
                                            AppColors.black.withOpacity(0.4)),
                                    borderRadius: BorderRadius.circular(4)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Remarks",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(
                                              height: 0,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.black,
                                            )),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Text(pvm.paymentDetails?.remarks ?? '',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(
                                              height: 0,
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal,
                                              color: AppColors.grey,
                                            ))
                                  ],
                                ),
                              )
                            : const SizedBox(),

                        const SizedBox(
                          height: 20,
                        ),

                        /* button to download the receipt */

                        CustomButtonWithIcon(
                          icon: Icons.file_download_sharp,
                          color: AppColors.reefGold,
                          text: "Download Receipt",
                          height: 60,
                          onPressed: () async {
                            UtilFunctions.loaderPopup(context);

                            log("${pvm.paymentDetails?.name}");

                            paymentVm
                                .getPaymentReceipt(
                                    pvm.paymentDetails?.name ?? '')
                                .then((value) {
                              Navigator.pop(context);

                              if (value) {
                                log("${pvm.file?.path.toLowerCase()}");

                                OpenFile.open(pvm.file?.path);
                              } else {
                                toast(pvm.errormsg, context);
                              }
                            });
                          },
                        )
                      ],
                    ),
                  ),
                ),
              );
      }),
    );
  }
}
