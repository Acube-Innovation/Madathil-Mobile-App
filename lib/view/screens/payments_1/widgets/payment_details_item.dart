import 'package:flutter/material.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/view/screens/common_widgets/custom_images.dart';

class PaymentDetailsItem extends StatelessWidget {
  const PaymentDetailsItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return const SizedBox();
      },
      itemCount: 3,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: AppColors.white,
              boxShadow: [
                BoxShadow(
                                      color: AppColors.grey.withOpacity(0.5),
                                      spreadRadius: 1,
                                      blurRadius: 7,
                                      offset: const Offset(
                                          0, 3), // changes position of shadow
                                    ),
              ],
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CustomPngImage(
                      imageName:
                          'assets/images/payment_details_transaction.png',
                      height: 50,
                      width: 50,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Transaction through UPI',
                      style: TextStyle(fontSize: 10),
                    )
                  ],
                ),
                Column(
                  children: [
                    Text(
                      '02 Oct 2024',
                      style: TextStyle(color: AppColors.grey, fontSize: 10),
                    ),
                    Text('\$ 10,000',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: AppColors.primaryLightColor, fontSize: 13))
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
