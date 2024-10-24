import 'package:flutter/material.dart';
import 'package:madathil/model/model_class/api_response_model/monthly_salary_details_response.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/utils/custom_loader.dart';
import 'package:madathil/utils/no_data_found.dart';
import 'package:madathil/view/screens/common_widgets/custom_appbarnew.dart';
import 'package:madathil/view/screens/payments/widgets/payment_item.dart';
import 'package:madathil/view/screens/payments_1/widgets/payment_details_item.dart';
import 'package:madathil/view/screens/salary/components/payment_item.dart';
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

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isInitialized) {
      Provider.of<SalaryViewmodel>(context, listen: false)
          .fetchMonthlySalaryDetails(widget.month);
      _isInitialized = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Salary Details"),
      body: Consumer<SalaryViewmodel>(
        builder: (context, svm, _) {
          if (svm.isloading!) {
            return const Center(child: CustomLoader());
          }

          return RefreshIndicator(
            color: AppColors.primeryColor,
            onRefresh: () => svm.fetchMonthlySalaryDetails(widget.month),
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(svm),
                  const SizedBox(height: 20),
                  _buildExpandableSection(
                    title: "Sales",
                    child: _buildSalesList(svm),
                  ),
                  const SizedBox(height: 20),
                  _buildExpandableSection(
                    title: "Payments",
                    child: _buildPaymentsList(svm),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildHeader(SalaryViewmodel svm) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(
          colors: [AppColors.secondaryColor, AppColors.primeryColor],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 10),
      child: Column(
        children: [
          Text(
            "Total Salary Paid",
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppColors.white,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            '₹ ${svm.monthlySalaryDetailsResponse?.message?.totalSalaryPaid.toString() ?? '0.0'}',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: AppColors.white,
                  fontSize: 28,
                ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildSummaryItem(
                "Total Points",
                svm.monthlySalaryDetailsResponse?.message?.totalPoints
                        .toString() ??
                    '0',
              ),
              const SizedBox(
                height: 40,
                child: VerticalDivider(color: AppColors.white, thickness: 1),
              ),
              _buildSummaryItem(
                "Total Salary Points",
                '₹ ${svm.monthlySalaryDetailsResponse?.message?.totalSalary ?? '0.0'}',
              ),
              const VerticalDivider(color: AppColors.white, thickness: 1),
              const SizedBox(
                height: 40,
                child: VerticalDivider(color: AppColors.white, thickness: 1),
              ),
              _buildSummaryItem(
                "Total Incentives",
                '₹ ${svm.monthlySalaryDetailsResponse?.message?.totalIncentives ?? '0.0'}',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryItem(String title, String value) {
    return Column(
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(color: AppColors.white, fontSize: 10),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: AppColors.white,
                fontSize: 18,
              ),
        ),
      ],
    );
  }

  Widget _buildExpandableSection(
      {required String title, required Widget child}) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: ExpansionTile(
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: AppColors.primeryColor,
              ),
        ),
        children: [child],
      ),
    );
  }

  Widget _buildSalesList(SalaryViewmodel svm) {
    final salesList =
        svm.monthlySalaryDetailsResponse?.message?.detailedRows ?? [];

    if (salesList.isEmpty) {
      return NoDataFOund(
          onRefresh: () => svm.fetchMonthlySalaryDetails(widget.month));
    }

    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: salesList.length,
      itemBuilder: (context, index) {
        return SalaeyDetailsListItem(data: salesList[index]);
      },
    );
  }

  Widget _buildPaymentsList(SalaryViewmodel svm) {
    final paymentList =
        svm.monthlySalaryDetailsResponse?.message?.payments ?? [];

    if (paymentList.isEmpty) {
      return NoDataFOund(
          onRefresh: () => svm.fetchMonthlySalaryDetails(widget.month));
    }

    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: paymentList.length,
      itemBuilder: (context, index) {
        return PaymentItemSalary(
          salaryPayments: paymentList[index],
        );
      },
    );
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
                        "Total amount : ₹${widget.data?.totalInvoiceAmount ?? 0}",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: AppColors.grey),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "Amount paid : ₹ ${widget.data?.paidInvoiceAmount ?? 0}",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: AppColors.grey),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "Points : ${widget.data?.points ?? 0}",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: AppColors.grey),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "Salary : ₹ ${widget.data?.salary ?? 0}",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: AppColors.grey),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "Incentives : ₹ ${widget.data?.incentives ?? "0"}",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: AppColors.grey),
                      ),
                    ],
                  ),
                ),
                // Column(
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   children: [
                //     Text(
                //       "salary",
                //       style: Theme.of(context)
                //           .textTheme
                //           .titleSmall
                //           ?.copyWith(color: AppColors.grey),
                //     ),
                //     Text(
                //       "₹ ${widget.data?.salary}",
                //       style: Theme.of(context).textTheme.titleLarge?.copyWith(
                //           color: AppColors.primaryLightColor, fontSize: 20),
                //     ),

                //     // const SizedBox(height: 10),
                //     // Icon(
                //     //   _isExpanded
                //     //       ? Icons.arrow_drop_up
                //     //       : Icons.arrow_drop_down_circle_sharp,
                //     //   color: AppColors.grey.withOpacity(0.4),
                //     // ),
                //   ],
                // ),
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
