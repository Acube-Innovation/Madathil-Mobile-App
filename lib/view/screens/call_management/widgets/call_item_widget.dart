import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/utils/custom_loader.dart';
import 'package:madathil/utils/no_data_found.dart';
import 'package:madathil/view/screens/call_management/call_details_screen.dart';
import 'package:madathil/view/screens/common_widgets/custom_images.dart';
import 'package:madathil/viewmodel/call_viewmodel.dart';
import 'package:madathil/viewmodel/payment_viewmodel.dart';
import 'package:provider/provider.dart';

class CallItemWidget extends StatefulWidget {
  const CallItemWidget({super.key});

  @override
  State<CallItemWidget> createState() => _CallItemWidgetState();
}

class _CallItemWidgetState extends State<CallItemWidget> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Provider.of<CallViewModel>(context, listen: false).resetCallPagination();
      Provider.of<CallViewModel>(context, listen: false).fetchCallList();
      // Provider.of<CallViewModel>(context, listen: false).getCallStatusList();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final callVm = Provider.of<CallViewModel>(context, listen: false);
    return Consumer<CallViewModel>(builder: (context, cvm, _) {
      if ((cvm.callPost ?? []).isEmpty) {
        print(
            'call post ---------------------------------------- ${cvm.callPost}');
        if (cvm.isLoading!) {
          return const Center(child: CustomLoader());
        } else {
          return Center(child: NoDataFOund(
            onRefresh: () {
              Provider.of<CallViewModel>(context, listen: false)
                  .resetCallPagination();
              Provider.of<CallViewModel>(context, listen: false)
                  .fetchCallList();
            },
          ));
        }
      } else {
        return RefreshIndicator(
          color: AppColors.primeryColor,
          onRefresh: () async {
            Provider.of<CallViewModel>(context, listen: false)
                .resetCallPagination();
            Provider.of<CallViewModel>(context, listen: false).fetchCallList();
          },
          child: ListView.separated(
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 10,
                );
              },
              itemCount: (cvm.callPost ?? []).length + 1,
              itemBuilder: (context, index) {
                if (index == (cvm.callPost ?? []).length) {
                  if (cvm.iscallPaginationclosing) {
                    return const SizedBox(
                        height: 30,
                        width: 30,
                        child: CupertinoActivityIndicator(
                            animating: true, radius: 15));
                  } else {
                    if (!cvm.callReachLength) {
                      if (!cvm.iscallPaginationclosing) {
                        WidgetsBinding.instance.addPostFrameCallback((_) async {
                          cvm.fetchCallList();
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
                      if (cvm.callPost!.isEmpty) {
                        print(
                            'call post ---------------------------------------- ${cvm.callPost}');
                        return Center(child: NoDataFOund(
                          onRefresh: () {
                            Provider.of<CallViewModel>(context, listen: false)
                                .resetCallPagination();
                            Provider.of<CallViewModel>(context, listen: false)
                                .fetchCallList();
                          },
                        ));
                      } else {
                        return const Column(
                          children: [
                            SizedBox(height: 200),
                            Center(
                                child: Text(
                              "No more Calls to show.",
                              style: TextStyle(color: Colors.grey),
                            )),
                          ],
                        );
                      }
                    }
                  }
                } else {
                  var item = callVm.callPost![index];
                  var time;

                  if (item.conversationDuration != null) {
                    time =
                        callVm.formatTimeFromSeconds(item.conversationDuration);
                  }
                  // else {
                  //   time = item.callStatus;
                  // }

                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  CallDetailsScreen(item: item)));
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 3, vertical: 4),
                      child: Container(
                        decoration: BoxDecoration(
                            color: AppColors.primeryColor.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(8)),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            (item.leadName?.isNotEmpty ?? false)
                                                ? item.leadName!
                                                : (item.customer?.isNotEmpty ??
                                                        false)
                                                    ? item.customer!
                                                    : 'N/A',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleLarge!
                                                .copyWith(
                                                    height: 0,
                                                    color: AppColors.black,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.normal),
                                          ),
                                          // const Icon(
                                          //   Icons.notifications_outlined,
                                          //   color: AppColors.secondaryColor,
                                          //   size: 18,
                                          // )
                                        ],
                                      ),
                                      if (time != null)
                                        Text(
                                          time ?? 'N/A',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge!
                                              .copyWith(
                                                  height: 0,
                                                  color: AppColors.primeryColor,
                                                  fontSize: 14,
                                                  fontWeight:
                                                      FontWeight.normal),
                                        ),
                                      Text(
                                        item.calledDate ?? 'N/A',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge!
                                            .copyWith(
                                                height: 0,
                                                color: AppColors.primeryColor,
                                                fontSize: 12,
                                                fontWeight: FontWeight.normal),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      const CustomPngImage(
                                        imageName:
                                            "assets/images/arrow_forward.png",
                                        boxFit: BoxFit.contain,
                                        height: 23,
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      if (item.callStatus != null)
                                        Text(
                                          item.callStatus ?? 'N/A',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge!
                                              .copyWith(
                                                  height: 0,
                                                  color: AppColors.primeryColor,
                                                  fontSize: 14,
                                                  fontWeight:
                                                      FontWeight.normal),
                                        ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }
              }),
        );
      }
    });
  }
}
