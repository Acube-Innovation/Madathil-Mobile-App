import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/utils/custom_loader.dart';
import 'package:madathil/utils/no_data_found.dart';
import 'package:madathil/view/screens/common_widgets/custom_images.dart';
import 'package:madathil/view/screens/transactions/transaction_details.dart';
import 'package:madathil/viewmodel/common_viewmodel.dart';
import 'package:provider/provider.dart';

class OrderTransactionCard extends StatefulWidget {
  final String? txnid;
  const OrderTransactionCard({super.key, this.txnid});

  @override
  State<OrderTransactionCard> createState() => _OrderTransactionCardState();
}

class _OrderTransactionCardState extends State<OrderTransactionCard> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<CommonDataViewmodel>(context, listen: false)
          .resetOrderTransactionPagination();
      Provider.of<CommonDataViewmodel>(context, listen: false)
          .fetchOrderTransactionList(widget.txnid);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CommonDataViewmodel>(builder: (ctx, cdv, _) {
      if ((cdv.orederTransactionPost ?? []).isEmpty) {
        if (cdv.isloading!) {
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
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                NoDataFOund(
                  onRefresh: () {
                    Provider.of<CommonDataViewmodel>(context, listen: false)
                        .resetOrderTransactionPagination();
                    Provider.of<CommonDataViewmodel>(context, listen: false)
                        .fetchOrderTransactionList(widget.txnid);
                  },
                ),
              ],
            ),
          );
        }
      } else {
        return RefreshIndicator(
          color: AppColors.primeryColor,
          onRefresh: () async {
            Provider.of<CommonDataViewmodel>(context, listen: false)
                .resetOrderTransactionPagination();
            Provider.of<CommonDataViewmodel>(context, listen: false)
                .fetchOrderTransactionList(widget.txnid);
          },
          child: ListView.separated(
              separatorBuilder: (context, index) {
                return const SizedBox();
              },
              itemCount: (cdv.orederTransactionPost ?? []).length + 1,
              itemBuilder: (context, index) {
                if (index == (cdv.orederTransactionPost ?? []).length) {
                  if (cdv.ispaginationorederTransaction) {
                    return const SizedBox(
                        height: 30, width: 30, child: CustomLoader());
                  } else {
                    if (!cdv.orederTransactionReachLength) {
                      if (!cdv.ispaginationorederTransaction) {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          cdv.fetchOrderTransactionList(widget.txnid);
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
                      if (cdv.orederTransactionPost!.isEmpty) {
                        return Center(child: NoDataFOund(
                          onRefresh: () {
                            Provider.of<CommonDataViewmodel>(context,
                                    listen: false)
                                .resetOrderTransactionPagination();
                            Provider.of<CommonDataViewmodel>(context,
                                    listen: false)
                                .fetchOrderTransactionList(widget.txnid);
                          },
                        ));
                      } else {
                        return const Column(
                          children: [
                            SizedBox(height: 200),
                            Center(
                                child: Text(
                              "No more transactions available.",
                              style: TextStyle(color: Colors.grey),
                            )),
                          ],
                        );
                      }
                    }
                  }
                } else {
                  var item = cdv.orederTransactionPost![index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TransactionDetails(
                                item: item,
                              ),
                            ));
                      },
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
                                        child: Text(
                                          item.partyName ?? '',
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
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                          item.postingDate != null
                                              ? DateFormat('dd MMM yyyy')
                                                  .format(DateTime.parse(item
                                                      .postingDate
                                                      .toString()))
                                              : '',
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
                                    child: Text(
                                        item.paidAmount?.toString() ?? "0.0",
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
                                  Text(item.modeOfPayment ?? '',
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
                    ),
                  );
                }
                return null;
              }),
        );
      }
    });
  }
}
