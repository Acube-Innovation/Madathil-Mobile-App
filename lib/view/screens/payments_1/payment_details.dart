import 'package:flutter/material.dart';
import 'package:madathil/model/model_class/api_response_model/monthly_payments_response.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/view/screens/common_widgets/custom_appbarnew.dart';
import 'package:madathil/view/screens/payments_1/widgets/payment_details_item.dart';
import 'package:madathil/view/screens/payments_1/widgets/total_earning_widget.dart';

class PaymentDetailsScreen extends StatelessWidget {
  final MonthlySalarySummary? monthlySalarySummary;
  const PaymentDetailsScreen({super.key, this.monthlySalarySummary});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Payments'),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TotalEarningWidget(
                earning: monthlySalarySummary?.totalSalary.toString() ?? ""),
            const SizedBox(
              height: 15,
            ),
            Text(
              'Transactions',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppColors.primeryColor,
                  fontSize: 13,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 5,
            ),
            Expanded(
                child: PaymentDetailsItem(
              monthlySalarySummary: monthlySalarySummary,
            ))
          ],
        ),
      ),
    );
  }
}
