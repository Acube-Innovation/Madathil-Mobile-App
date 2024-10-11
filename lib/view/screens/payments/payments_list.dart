import 'package:flutter/material.dart';
import 'package:madathil/view/screens/common_widgets/custom_appbarnew.dart';
import 'package:madathil/view/screens/payments/widgets/payment_item.dart';

class PaymentListScreen extends StatelessWidget {
  const PaymentListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Payment List"),

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [

            Expanded(child: PaymentItem())
          ],
          
        ),
      ),
    );


  }
}