import 'package:flutter/material.dart';
import 'package:madathil/model/model_class/api_response_model/monthly_salary_details_response.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/utils/custom_loader.dart';
import 'package:madathil/utils/no_data_found.dart';
import 'package:madathil/view/screens/common_widgets/custom_appbarnew.dart';
import 'package:madathil/viewmodel/salary_viewmodel.dart';
import 'package:provider/provider.dart';

class SalaryDetailScreen extends StatefulWidget {
  final String? month;
  const SalaryDetailScreen({super.key, required this.month});

  @override
  State<SalaryDetailScreen> createState() => _SalaryDetailScreenState();
}

class _SalaryDetailScreenState extends State<SalaryDetailScreen> {
  bool _isInitialized = false;

  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isInitialized) {
      // Fetch data here after the widget tree is built
      Provider.of<SalaryViewmodel>(context, listen: false)
          .fetchMonthlySalaryDetails(widget.month);
      _isInitialized = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(title: "Salary Details"),
        body: Consumer<SalaryViewmodel>(builder: (context, svm, _) {
          if (svm.isloading == true) {
            return Center(
              child: CustomLoader(),
            );
          } else {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
              child: SingleChildScrollView(
                child: RefreshIndicator(
                  color: AppColors.primeryColor,
              onRefresh: () => svm.fetchMonthlySalaryDetails(widget.month),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: const LinearGradient(
                              colors: [
                                AppColors.secondaryColor,
                                AppColors.primeryColor
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Center(
                              child: Text(
                                "Total Salary",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(color: AppColors.white),
                              ),
                            ),
                            Center(
                              child: Text(
                                '₹ ${svm.monthlySalaryDetailsResponse?.message?.totalSalary.toString() ?? '0.0'}',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(
                                        color: AppColors.white, fontSize: 28),
                              ),
                            ),
                            const SizedBox(height: 30),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      "Total Points",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(color: AppColors.white),
                                    ),
                                    Text(
                                      svm.monthlySalaryDetailsResponse?.message
                                              ?.totalPoints
                                              .toString() ??
                                          '0',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge
                                          ?.copyWith(
                                              color: AppColors.white,
                                              fontSize: 22),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 40,
                                  child: VerticalDivider(
                                      color: AppColors.white, thickness: 1),
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "Incentives",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(color: AppColors.white),
                                    ),
                                    Text(
                                      "₹ ${svm.monthlySalaryDetailsResponse?.message?.totalIncentives ?? '0.0'}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge
                                          ?.copyWith(
                                              color: AppColors.white,
                                              fontSize: 22),
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      //sales list
                      Text(
                        "Sales",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(color: AppColors.primeryColor),
                      ),
                      if (svm.monthlySalaryDetailsResponse?.message
                                  ?.detailedRows !=
                              null &&
                          svm.monthlySalaryDetailsResponse?.message!
                                  .detailedRows !=
                              [])
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: svm.monthlySalaryDetailsResponse?.message
                              ?.detailedRows?.length,
                          itemBuilder: (context, index) {
                            return SalaeyDetailsListItem(
                              data: svm.monthlySalaryDetailsResponse?.message
                                  ?.detailedRows?[index],
                            );
                          },
                        )
                      else
                        NoDataFOund(
                            onRefresh:
                                svm.fetchMonthlySalaryDetails(widget.month))
                    ],
                  ),
                ),
              ),
            );
          }
        }));
  }
}

class SalaeyDetailsListItem extends StatefulWidget {
  final DetailedRows? data;
  const SalaeyDetailsListItem({super.key, this.data});

  @override
  _SalaeyDetailsListItemState createState() => _SalaeyDetailsListItemState();
}

class _SalaeyDetailsListItemState extends State<SalaeyDetailsListItem> {
  bool _isExpanded = false;

  void _toggleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.data?.customerName ?? 'N/A',
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(color: AppColors.black),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        widget.data?.item ?? 'N/A',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: AppColors.black),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "₹ ${widget.data?.projectCost}",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(
                                color: AppColors.black,
                                fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "Incentives : ₹ ${widget.data?.incentives}",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: AppColors.grey),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "Points : ${widget.data?.points}",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: AppColors.grey),
                      ),
                       const SizedBox(height: 5),
                      Text(
                        "Total amount : ₹${widget.data?.totalInvoiceAmount}",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: AppColors.grey),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "Amount paid : ₹ ${widget.data?.totalPaidAmount}",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: AppColors.grey),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "salary",
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.copyWith(color: AppColors.grey),
                    ),
                    Text(
                      "₹ ${widget.data?.salary}",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: AppColors.primaryLightColor, fontSize: 20),
                    ),

                    
                    // const SizedBox(height: 10),
                    // Icon(
                    //   _isExpanded
                    //       ? Icons.arrow_drop_up
                    //       : Icons.arrow_drop_down_circle_sharp,
                    //   color: AppColors.grey.withOpacity(0.4),
                    // ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            // if (_isExpanded) ...[
            //   const Divider(thickness: 1, color: AppColors.black),
            //   const SizedBox(height: 10),
            //   Text(
            //     "Transactions details",
            //     style: Theme.of(context)
            //         .textTheme
            //         .bodyMedium
            //         ?.copyWith(color: AppColors.black),
            //   ),
            // ]
          ],
        ),
      ),
    );
  }
}
