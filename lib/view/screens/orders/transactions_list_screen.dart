import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:madathil/view/screens/common_widgets/custom_appbarnew.dart';
import 'package:madathil/view/screens/orders/widgets/transaction_card_item.dart';

class OrderTranscationList extends StatelessWidget {
  final String? txnid;
  const OrderTranscationList({super.key, this.txnid});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Tansaction List"),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
                child: OrderTransactionCard(
              txnid: txnid ?? "",
            ))
          ],
        ),
      ),
    );
  }
}
