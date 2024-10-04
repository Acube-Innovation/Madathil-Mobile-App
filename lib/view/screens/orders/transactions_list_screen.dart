import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:madathil/view/screens/common_widgets/custom_appbarnew.dart';
import 'package:madathil/view/screens/orders/widgets/transaction_card_item.dart';

class OrderTranscationList extends StatelessWidget {
  const OrderTranscationList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: "Tansaction List"),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [Expanded(child: OrderTransactionCard())],
        ),
      ),
    );
  }
}
