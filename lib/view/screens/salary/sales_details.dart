import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:madathil/app_images.dart';
import 'package:madathil/model/model_class/api_response_model/monthly_salary_details_response.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/utils/custom_loader.dart';
import 'package:madathil/utils/no_data_found.dart';
import 'package:madathil/view/screens/common_widgets/custom_appbarnew.dart';
import 'package:madathil/view/screens/common_widgets/custom_images.dart';
import 'package:madathil/viewmodel/salary_viewmodel.dart';
import 'package:provider/provider.dart';

class SalesDetails extends StatelessWidget {
  final DetailedRows? data;
  const SalesDetails({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: "Sales Details"),
        body: Consumer<SalaryViewmodel>(builder: (ctx, svm, _) {
          if ((svm.monthlySalaryDetailsResponse?.message?.detailedRows ?? [])
              .isEmpty) {
            return const NoDataFOund();
          }

          return svm.isloading!
              ? const CustomLoader()
              : SingleChildScrollView(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 60,
                          ),
                          const CustomPngImage(
                            imageName: AppImages.salaryItem,
                            height: 100,
                            width: 100,
                            boxFit: BoxFit.fitWidth,
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Text(
                            data?.customerName ?? 'N/A',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                    height: 0,
                                    color: AppColors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            data?.item ?? 'N/A',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                    height: 1.3,
                                    color: AppColors.black,
                                    fontSize: 16),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: AppColors.grey.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(12)),
                            child: Padding(
                              padding: const EdgeInsets.all(25),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Total amount",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .copyWith(
                                                height: 0,
                                                color: AppColors.grey,
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal),
                                      ),
                                      Text(
                                        '₹ ${data?.totalInvoiceAmount.toString() ?? "0"}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .copyWith(
                                                height: 0,
                                                color: AppColors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w800),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Total amount paid",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .copyWith(
                                                height: 0,
                                                color: AppColors.grey,
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal),
                                      ),
                                      Text(
                                        '₹ ${data?.paidInvoiceAmount.toString() ?? '0'}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .copyWith(
                                                height: 0,
                                                color: AppColors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w800),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Project Cost",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .copyWith(
                                                height: 0,
                                                color: AppColors.grey,
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal),
                                      ),
                                      Text(
                                        '₹ ${data?.projectCost.toString() ?? '0'}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .copyWith(
                                                height: 0,
                                                color: AppColors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w800),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Total points",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .copyWith(
                                                height: 0,
                                                color: AppColors.grey,
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal),
                                      ),
                                      Text(
                                        data?.points.toString() ?? '0',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .copyWith(
                                                height: 0,
                                                color: AppColors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w800),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Incentive points",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .copyWith(
                                                height: 0,
                                                color: AppColors.grey,
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal),
                                      ),
                                      Text(
                                        ' ${data?.incentives.toString() ?? '0'}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .copyWith(
                                                height: 0,
                                                color: AppColors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w800),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Salary points",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .copyWith(
                                                height: 0,
                                                color: AppColors.grey,
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal),
                                      ),
                                      Text(
                                        ' ${data?.salary.toString() ?? '0'}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .copyWith(
                                                height: 0,
                                                color: AppColors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w800),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Closing date",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .copyWith(
                                                height: 0,
                                                color: AppColors.grey,
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal),
                                      ),
                                      Text(
                                        data?.closingDate != null
                                            ? DateFormat('dd MMM yyyy').format(
                                                DateTime.parse(
                                                    data?.closingDate ?? ''))
                                            : '',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .copyWith(
                                                height: 0,
                                                color: AppColors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w800),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
        }));
  }
}
