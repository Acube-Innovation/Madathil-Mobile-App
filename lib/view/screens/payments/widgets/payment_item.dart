import 'package:flutter/material.dart';
import 'package:madathil/app_images.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/utils/custom_loader.dart';
import 'package:madathil/utils/no_data_found.dart';
import 'package:madathil/view/screens/payments_1/payment_details.dart';
import 'package:madathil/viewmodel/salary_viewmodel.dart';
import 'package:provider/provider.dart';

class PaymentItem extends StatefulWidget {
  const PaymentItem({super.key});

  @override
  State<PaymentItem> createState() => _PaymentItemState();
}

class _PaymentItemState extends State<PaymentItem> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<SalaryViewmodel>(context, listen: false)
          .clearmonthlySalarySummary();
      Provider.of<SalaryViewmodel>(context, listen: false)
          .getMonthlyPaymentsList();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SalaryViewmodel>(builder: (ctx, svd, _) {
      if ((svd.monthlySalarySummary ?? []).isEmpty) {
        if (svd.isloading!) {
          return const CustomLoader();
        } else {
          return NoDataFOund(
            onRefresh: () {
              Provider.of<SalaryViewmodel>(context, listen: false)
                  .clearmonthlySalarySummary();
              Provider.of<SalaryViewmodel>(context, listen: false)
                  .getMonthlyPaymentsList();
            },
          );
        }
      } else {
        return RefreshIndicator(
          color: AppColors.primeryColor,
          onRefresh: () async {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Provider.of<SalaryViewmodel>(context, listen: false)
                  .clearmonthlySalarySummary();

              Provider.of<SalaryViewmodel>(context, listen: false)
                  .getMonthlyPaymentsList();
            });
          },
          child: ListView.separated(
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 10,
                );
              },
              itemCount: (svd.monthlySalarySummary ?? []).length,
              itemBuilder: (context, index) {
                var item = svd.monthlySalarySummary![index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PaymentDetailsScreen(
                                  monthlySalarySummary: item,
                                )));
                  },
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Image.asset(AppImages.paymentItem,
                                height: 80, width: 80),
                          ),
                          const SizedBox(width: 15),
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.monthString ?? '',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.copyWith(
                                          color: AppColors.black, fontSize: 22),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        height:
                                            1, // Adjust thickness of the divider
                                        decoration: const BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Colors
                                                  .black, // Start with transparency
                                              AppColors
                                                  .black, // Middle with solid color
                                              Colors
                                                  .transparent, // End with transparency
                                            ],
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Total Earnings",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall
                                                ?.copyWith(
                                                    color: AppColors.grey),
                                          ),
                                          Text(
                                            item.totalSalary?.toString() ?? '',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleLarge
                                                ?.copyWith(
                                                    color: AppColors
                                                        .primaryLightColor,
                                                    fontSize: 22),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
        );
      }
    });
  }
}
