import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:madathil/app_images.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/utils/no_data_found.dart';
import 'package:madathil/view/screens/statments/closing_statment_details.dart';
import 'package:madathil/viewmodel/common_viewmodel.dart';
import 'package:provider/provider.dart';

class ClosingStatementItem extends StatefulWidget {
  const ClosingStatementItem({super.key});

  @override
  State<ClosingStatementItem> createState() => _ClosingStatementItemState();
}

class _ClosingStatementItemState extends State<ClosingStatementItem> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Provider.of<CommonDataViewmodel>(context, listen: false)
          .resetClosingPagination();
      Provider.of<CommonDataViewmodel>(context, listen: false)
          .fetchClosingStatmentList();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final commonVm = Provider.of<CommonDataViewmodel>(context, listen: false);
    return Consumer<CommonDataViewmodel>(builder: (context, cdv, _) {
      if ((cdv.closePost ?? []).isEmpty) {
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
                  onRefresh: () async {
                    Provider.of<CommonDataViewmodel>(context, listen: false)
                        .resetClosingPagination();
                    Provider.of<CommonDataViewmodel>(context, listen: false)
                        .fetchClosingStatmentList();
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
                .resetClosingPagination();
            Provider.of<CommonDataViewmodel>(context, listen: false)
                .fetchClosingStatmentList();
          },
          child: ListView.separated(
            separatorBuilder: (context, index) {
              return const SizedBox(height: 0);
            },
            itemCount: (cdv.closePost ?? []).length + 1,
            itemBuilder: (context, index) {
              if (index == (cdv.closePost ?? []).length) {
                if (cdv.ispaginationclosing) {
                  return const SizedBox(
                      height: 30,
                      width: 30,
                      child: CupertinoActivityIndicator(
                          animating: true, radius: 15));
                } else {
                  if (!cdv.closingReachLength) {
                    if (!cdv.ispaginationclosing) {
                      WidgetsBinding.instance.addPostFrameCallback((_) async {
                        cdv.fetchClosingStatmentList();
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
                    if (cdv.closePost!.isEmpty) {
                      return const Center(child: NoDataFOund());
                    } else {
                      return const Column(
                        children: [
                          SizedBox(height: 200),
                          Center(
                              child: Text(
                            "No more Closing Staments available.",
                            style: TextStyle(color: Colors.grey),
                          )),
                        ],
                      );
                    }
                  }
                }
              } else {
                var item = commonVm.closePost![index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ClosingStatmentDetails(
                                  items: item,
                                )));
                  },
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 7, vertical: 8),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.primeryColor.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Left icon container
                            Center(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(AppImages.statementImage,
                                  width: 60),
                            )),

                            // Text column
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Customer Name",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(
                                          height: 0,
                                          color:
                                              AppColors.black.withOpacity(0.5),
                                        ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    item.customerName ?? '',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .copyWith(
                                            height: 0,
                                            color: AppColors.primeryColor,
                                            fontSize: 15),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    "Business name",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(
                                          height: 0,
                                          color:
                                              AppColors.black.withOpacity(0.5),
                                        ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    item.selectBusiness ?? '',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .copyWith(
                                            height: 0,
                                            color: AppColors.primeryColor,
                                            fontSize: 15),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 10),
                            // Right column with amount and date
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Close Amount",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                        height: 0,
                                        color: AppColors.black.withOpacity(0.5),
                                      ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  "₹ ${item.projectCost?.toDouble().round() ?? 0.0}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(
                                          height: 0,
                                          color: AppColors.primeryColor,
                                          fontSize: 15),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  "Closed Date",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                        height: 0,
                                        color: AppColors.black.withOpacity(0.5),
                                      ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  item.closingDate != null
                                      ? DateFormat('dd MMM yyyy').format(
                                          DateTime.parse(
                                              item.closingDate.toString()))
                                      : '',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(
                                          height: 0,
                                          color: AppColors.primeryColor,
                                          fontSize: 15),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }
            },
          ),
        );
      }
    });
  }
}
