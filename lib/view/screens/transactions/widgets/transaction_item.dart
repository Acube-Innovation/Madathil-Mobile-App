import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/view/screens/common_widgets/custom_images.dart';
import 'package:madathil/view/screens/transactions/transaction_details.dart';
import 'package:madathil/viewmodel/payment_viewmodel.dart';
import 'package:provider/provider.dart';

class TransactionItem extends StatefulWidget {
  const TransactionItem({super.key});

  @override
  State<TransactionItem> createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Provider.of<PaymentViewmodel>(context, listen: false)
          .resetPaymentPagination();
      Provider.of<PaymentViewmodel>(context, listen: false)
          .fetchPaymentHistoryList();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final paymentvm = Provider.of<PaymentViewmodel>(context, listen: false);
    return Consumer<PaymentViewmodel>(builder: (context, pvm, _) {
      if ((pvm.paymentPost ?? []).isEmpty) {
        print(
            'Payment post ---------------------------------------- ${pvm.paymentPost}');
        if (pvm.isLoading!) {
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
                Text("No Payments to show."),
              ],
            ),
          );
        }
      } else {
        return RefreshIndicator(
          color: AppColors.primeryColor,
          onRefresh: () async {
            Provider.of<PaymentViewmodel>(context, listen: false)
                .resetPaymentPagination();
            Provider.of<PaymentViewmodel>(context, listen: false)
                .fetchPaymentHistoryList();
          },
          child: ListView.separated(
            separatorBuilder: (context, index) {
              return const SizedBox();
            },
            itemCount: (pvm.paymentPost ?? []).length + 1,
            itemBuilder: (context, index) {
              if (index == (pvm.paymentPost ?? []).length) {
                if (pvm.ispaginationclosing) {
                  return const SizedBox(
                      height: 30,
                      width: 30,
                      child: CupertinoActivityIndicator(
                          animating: true, radius: 15));
                } else {
                  if (!pvm.paymentReachLength) {
                    if (!pvm.ispaginationclosing) {
                      WidgetsBinding.instance.addPostFrameCallback((_) async {
                        pvm.fetchPaymentHistoryList();
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
                    if (pvm.paymentPost!.isEmpty) {
                      print(
                          'Payment post ---------------------------------------- ${pvm.paymentPost}');
                      return const Center(
                          child: Text(
                        "No Payments to show.",
                      ));
                    } else {
                      return const Column(
                        children: [
                          SizedBox(height: 200),
                          Center(
                              child: Text(
                            "No more payments to show.",
                            style: TextStyle(color: Colors.grey),
                          )),
                        ],
                      );
                    }
                  }
                }
              } else {
                var item = paymentvm.paymentPost![index];
                return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TransactionDetails(item: item,),
                          ));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Container(
                        decoration: BoxDecoration(
                            color: AppColors.primeryColor.withOpacity(0.3),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20))),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 9, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const CustomPngImage(
                                    imageName: 'assets/images/person_icon.png',
                                    height: 60,
                                    width: 60,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 148,
                                        child: Text(item.partyName ?? "",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400,
                                                  height: 1.7,
                                                  color: AppColors.primeryColor,
                                                ),
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(item.postingDate ?? "",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall!
                                              .copyWith(
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.black,
                                              ))
                                    ],
                                  )
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    child: Text(item.paidAmount?.toString() ?? "0.0",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400,
                                              height: 1.7,
                                              color: AppColors.primeryColor,
                                            )),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(item.partyType ?? '',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.black,
                                          ))
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ));
              }
              return const SizedBox();
            },
          ),
        );
      }
    });
  }
}
