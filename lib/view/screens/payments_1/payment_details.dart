import 'package:flutter/material.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/view/screens/common_widgets/custom_appbarnew.dart';
import 'package:madathil/view/screens/payments_1/widgets/payment_details_item.dart';
import 'package:madathil/view/screens/payments_1/widgets/total_earning_widget.dart';

class PaymentDetailsScreen extends StatelessWidget {
  const PaymentDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Payments'),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TotalEarningWidget(earning: '\$ 20,000'),
            SizedBox(
              height: 30,
            ),
            Text(
              'Transactions',
              style: TextStyle(color: AppColors.primeryColor),
            ),
            Expanded(child: PaymentDetailsItem())
          ],
        ),
      ),
    );
  }
}
