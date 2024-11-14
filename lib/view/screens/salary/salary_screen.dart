import 'package:flutter/material.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/utils/custom_loader.dart';
import 'package:madathil/utils/no_data_found.dart';
import 'package:madathil/view/screens/common_widgets/custom_appbarnew.dart';
import 'package:madathil/view/screens/salary/components/salary_list.dart';
import 'package:madathil/viewmodel/salary_viewmodel.dart';
import 'package:provider/provider.dart';

class SalaryScreen extends StatefulWidget {
  const SalaryScreen({super.key});

  @override
  State<SalaryScreen> createState() => _SalaryScreenState();
}

class _SalaryScreenState extends State<SalaryScreen> {
  bool _isInitialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isInitialized) {
      // Fetch data here after the widget tree is built

      WidgetsBinding.instance.addPostFrameCallback((_) {
        Provider.of<SalaryViewmodel>(context, listen: false)
            .fetchMonthlySalaryList();
      });

      _isInitialized = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Salary"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Consumer<SalaryViewmodel>(builder: (ctx, svm, _) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Container(
                  //   width: 5,
                  //   height: 70,
                  //   decoration: BoxDecoration(
                  //       color: AppColors.primaryLightColor,
                  //       borderRadius: BorderRadius.circular(20)),
                  // ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Total Salary & Incentive Paid",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: AppColors.grey),
                      ),
                      Text(
                        '₹ ${svm.monthlySalaryListResponse?.message?.totalSalaryPaid.toString() ?? "0"}',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: AppColors.primaryLightColor, fontSize: 22),
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 5,
                        height: 50,
                        decoration: BoxDecoration(
                            color: AppColors.secondaryColor,
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Total Points",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(color: AppColors.grey),
                          ),
                          Text(
                            svm.monthlySalaryListResponse?.message?.totalPoints
                                    .toString() ??
                                '0',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                    color: AppColors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 5,
                        height: 50,
                        decoration: BoxDecoration(
                            color: AppColors.secondaryColor,
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Point of Salary",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(color: AppColors.grey),
                          ),
                          Text(
                            svm.monthlySalaryListResponse?.message
                                    ?.totalSalaryPoints
                                    .toString() ??
                                '0',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                    color: AppColors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 5,
                        height: 50,
                        decoration: BoxDecoration(
                            color: AppColors.secondaryColor,
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Salary & Incentives",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(color: AppColors.grey),
                          ),
                          Text(
                            '₹ ${svm.monthlySalaryListResponse?.message?.totalIncentives.toString() ?? '0'}',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                    color: AppColors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const Divider(),
              const SizedBox(
                height: 15,
              ),
              Consumer<SalaryViewmodel>(builder: (context, svm, _) {
                return RefreshIndicator(
                  color: AppColors.primeryColor,
                  onRefresh: () async {
                    svm.clearSalaryList();
                    svm.fetchMonthlySalaryList();
                  },
                  child: (svm.monthlySalaryListResponse?.message?.summary ?? [])
                          .isNotEmpty
                      ? ListView.builder(
                          shrinkWrap: true,
                          itemCount: (svm.monthlySalaryListResponse?.message
                                          ?.summary ??
                                      [])
                                  .length +
                              1,
                          itemBuilder: (context, index) {
                            if (index ==
                                (svm.monthlySalaryListResponse?.message
                                            ?.summary ??
                                        [])
                                    .length) {
                              // if (svm.isLoadingSalaryListPagination) {
                              //   return const CustomLoader();
                              // } else {
                              //   if (!svm.reachedLastPageSalaryList) {
                              //     if (!svm.isLoadingSalaryListPagination) {
                              //       svm.fetchMonthlySalaryList();
                              //     }
                              //     return const CustomLoader();
                              //   }
                              // }
                            } else {
                              return SalaryListItem(
                                  data: svm.monthlySalaryListResponse?.message
                                      ?.summary![index]);
                            }
                            return null;
                          },
                        )
                      : svm.isloading == true
                          ? const CustomLoader()
                          : NoDataFOund(
                              onRefresh: () {
                                svm.fetchMonthlySalaryList();
                              },
                            ),
                );
              }),
            ],
          );
        }),
      ),
    );
  }
}
