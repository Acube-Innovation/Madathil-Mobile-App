import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/view/screens/common_widgets/custom_appbarnew.dart';
import 'package:madathil/view/screens/transactions/transaction_details.dart';
import 'package:madathil/view/screens/transactions/widgets/transaction_filter.dart';
import 'package:madathil/view/screens/transactions/widgets/transaction_item.dart';
import 'package:madathil/viewmodel/payment_viewmodel.dart';
import 'package:provider/provider.dart';

class TransactionList extends StatefulWidget {
  const TransactionList({super.key});

  @override
  State<TransactionList> createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  String? formattedStartDate;
  String? formattedEndDate;
  @override
  Widget build(BuildContext context) {
    // bool FilterOn = false;
    final paymentVm = Provider.of<PaymentViewmodel>(context, listen: false);
    return Consumer<PaymentViewmodel>(builder: (ctx, pvm, _) {
      if (pvm.startFormatted != null && pvm.endFormatted != null) {
        formattedStartDate =
            DateFormat('dd/MM').format(DateTime.parse(pvm.startFormatted!));
        formattedEndDate =
            DateFormat('dd/MM').format(DateTime.parse(pvm.endFormatted!));
      }
      return Scaffold(
          appBar: CustomAppBar(
            title: "Transaction List",
            actions: [
// paymentVm.filterOn == false ?
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          backgroundColor: AppColors.transparent,
                          builder: (context) {
                            return const TransactionFilterBottomSheet();
                          });
                    },
                    icon: const Icon(
                      Icons.tune,
                      color: AppColors.territoryColor,
                    ),
                  ),
                ],
              )
              // : IconButton(
              //       onPressed: () {
              //         // setState(() {
              //         //   FilterOn = true;
              //         // });
              //         // showModalBottomSheet(
              //         //     context: context,
              //         //     backgroundColor: AppColors.transparent,
              //         //     builder: (context) {
              //         //       return const TransactionFilterBottomSheet();
              //         //     });
              //         pvm.filterOn = false;
              //         pvm.amount = null;
              //         pvm.paymentMode = null;
              //         pvm.clearDateRange();
              //         paymentVm.resetPaymentPagination();
              //         paymentVm.fetchPaymentHistoryList();
              //       },
              //       icon: const Icon(
              //         Icons.close,
              //         color: AppColors.territoryColor,
              //       ),
              //     )
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                SizedBox(
                  height: 46,
                  child: TextField(
                    controller: paymentVm.searchControllerPaymentHistory,
                    onChanged: (val) {
                      log(val);
                      pvm.setSearchbool(true);
                    },
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(left: 30),
                      suffixIcon: Container(
                          margin: const EdgeInsets.all(2),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.primeryColor,
                          ),
                          child: pvm.paymentSearchfn != null &&
                                  pvm.searching == false
                              ? GestureDetector(
                                  onTap: () {
                                    paymentVm.clearSearchVal();

                                    paymentVm.resetPaymentPagination();

                                    paymentVm.fetchPaymentHistoryList();
                                  },
                                  child: const Icon(
                                    Icons.clear,
                                    color: Colors.white,
                                  ),
                                )
                              : GestureDetector(
                                  onTap: () {
                                    paymentVm.setSearchValue(paymentVm
                                        .searchControllerPaymentHistory.text);
                                    pvm.setSearchbool(false);

                                    paymentVm.resetPaymentPagination();

                                    paymentVm.fetchPaymentHistoryList();
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
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                if (pvm.filterOn == true)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Wrap(
                          runSpacing: 5,
                          children: [
                            if (pvm.startFormatted != null &&
                                pvm.endFormatted != null)
                              IntrinsicWidth(
                                child: Container(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  height: 40,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: AppColors.primeryColor),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(20))),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '$formattedStartDate - $formattedEndDate',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                              color: AppColors.primeryColor,
                                            ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          pvm.clearFilter('date');
                                        },
                                        child: const Icon(
                                          Icons.close,
                                          size: 20,
                                          color: AppColors.primeryColor,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            const SizedBox(
                              width: 5,
                            ),
                            if (pvm.paymentMode != null)
                              IntrinsicWidth(
                                child: Container(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  height: 40,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: AppColors.primeryColor),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(20))),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        pvm.paymentMode!,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                              color: AppColors.primeryColor,
                                            ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          pvm.clearFilter('payment Mode');
                                        },
                                        child: const Icon(
                                          Icons.close,
                                          size: 20,
                                          color: AppColors.primeryColor,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            const SizedBox(
                              width: 5,
                            ),
                            if (pvm.amount != null)
                              IntrinsicWidth(
                                child: Container(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  height: 40,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: AppColors.primeryColor),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(20))),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        pvm.amount.toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                              color: AppColors.primeryColor,
                                            ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          pvm.clearFilter('amount');
                                        },
                                        child: const Icon(
                                          Icons.close,
                                          size: 20,
                                          color: AppColors.primeryColor,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                      // pvm.filterOn == true
                      //     ?

                      // : IconButton(
                      //     onPressed: () {
                      //       // setState(() {
                      //       //   FilterOn = true;
                      //       // });
                      //       showModalBottomSheet(
                      //           context: context,
                      //           backgroundColor: AppColors.transparent,
                      //           builder: (context) {
                      //             return const TransactionFilterBottomSheet();
                      //           });
                      //     },
                      //     icon: const Icon(
                      //       Icons.tune,
                      //       color: AppColors.territoryColor,
                      //     ),
                      //   )
                    ],
                  ),
                const SizedBox(
                  height: 15,
                ),
                Expanded(
                  child: TransactionItem(),
                )
              ],
            ),
          ));
    });
  }
}
