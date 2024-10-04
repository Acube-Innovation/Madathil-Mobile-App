import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/utils/custom_loader.dart';
import 'package:madathil/utils/no_data_found.dart';
import 'package:madathil/view/screens/service/service_details_screen.dart';
import 'package:madathil/viewmodel/common_viewmodel.dart';
import 'package:provider/provider.dart';

class ServiceItem extends StatefulWidget {
  const ServiceItem({super.key});

  @override
  State<ServiceItem> createState() => _ServiceItemState();
}

class _ServiceItemState extends State<ServiceItem> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Provider.of<CommonDataViewmodel>(context, listen: false)
          .getServiceStatusList();
      Provider.of<CommonDataViewmodel>(context, listen: false)
          .resetServiceHistoryPagination();
      Provider.of<CommonDataViewmodel>(context, listen: false)
          .fetchServiceHistoryList();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final commonVm = Provider.of<CommonDataViewmodel>(context, listen: false);
    return Consumer<CommonDataViewmodel>(builder: (ctx, cdv, _) {
      if ((cdv.serviceHistoryPost ?? []).isEmpty) {
        if (cdv.isloading!) {
          return const Center(
            child: CustomLoader(),
          );
        } else {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                NoDataFOund(
                  onRefresh: () async {
                    Provider.of<CommonDataViewmodel>(context, listen: false)
                        .resetServiceHistoryPagination();
                    Provider.of<CommonDataViewmodel>(context, listen: false)
                        .fetchServiceHistoryList();
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
                .resetServiceHistoryPagination();
            Provider.of<CommonDataViewmodel>(context, listen: false)
                .fetchServiceHistoryList();
          },
          child: ListView.separated(
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 10,
                );
              },
              itemCount: (cdv.serviceHistoryPost ?? []).length + 1,
              itemBuilder: (context, index) {
                if (index == (cdv.serviceHistoryPost ?? []).length) {
                  if (cdv.ispaginationserviceHistory) {
                    return const SizedBox(
                        height: 30,
                        width: 30,
                        child: CupertinoActivityIndicator(
                            animating: true, radius: 15));
                  } else {
                    if (!cdv.serviceHistoryReachLength) {
                      if (!cdv.ispaginationserviceHistory) {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          cdv.fetchServiceHistoryList();
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
                      if (cdv.serviceHistoryPost!.isEmpty) {
                        return Center(child: NoDataFOund(
                          onRefresh: () {
                            Provider.of<CommonDataViewmodel>(context,
                                    listen: false)
                                .resetServiceHistoryPagination();
                            Provider.of<CommonDataViewmodel>(context,
                                    listen: false)
                                .fetchServiceHistoryList();
                          },
                        ));
                      } else {
                        return const Column(
                          children: [
                            SizedBox(height: 200),
                            Center(
                                child: Text(
                              "No more Service History available.",
                              style: TextStyle(color: Colors.grey),
                            )),
                          ],
                        );
                      }
                    }
                  }
                } else {
                  var item = commonVm.serviceHistoryPost![index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ServiceDetailsScreen(
                                      items: item,
                                    )));
                      },
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: AppColors.primeryColor,
                            borderRadius: BorderRadius.circular(12)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  item.name ?? '',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                        height: 0,
                                        fontSize: 14,
                                        color: AppColors.white,
                                      ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      color: AppColors.amber,
                                      borderRadius: BorderRadius.circular(50)),
                                  child: Text(
                                    item.maintenanceType ?? '',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(
                                          height: 0,
                                          fontSize: 12,
                                          color: AppColors.white,
                                        ),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              item.customer ?? '',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    height: 0,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.white,
                                  ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  item.mntcDate != null
                                      ? DateFormat('dd MMM yyyy').format(
                                          DateTime.parse(
                                              item.mntcDate.toString()))
                                      : '',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                        height: 0,
                                        fontSize: 12,
                                        color: AppColors.white,
                                      ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      color: AppColors.green,
                                      borderRadius: BorderRadius.circular(50)),
                                  child: Text(
                                    item.workCompletionStatus ?? '',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(
                                          height: 0,
                                          fontSize: 12,
                                          color: AppColors.white,
                                        ),
                                  ),
                                )
                              ],
                            ),
                          ],
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
