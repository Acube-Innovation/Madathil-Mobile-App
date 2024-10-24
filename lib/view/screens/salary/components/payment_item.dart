import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:madathil/model/model_class/api_response_model/monthly_salary_details_response.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/view/screens/common_widgets/custom_images.dart';

class PaymentItemSalary extends StatelessWidget {
  final SalaryPayments? salaryPayments;
  const PaymentItemSalary({super.key, this.salaryPayments});

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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const CustomPngImage(
                      imageName:
                          'assets/images/payment_details_transaction.png',
                      height: 50,
                      width: 50,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Mode : ${salaryPayments?.modeOfPayment ?? 'N/A'}'
                      //     ${item.modeOfPayment ?? ''}',


                      ,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: AppColors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.normal),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 6,
                    )
                  ],
                ),
                Column(
                  children: [
                    Text(
                       salaryPayments?.postingDate != null
                                ? DateFormat('dd MMM yyyy').format(
                                    DateTime.parse(
                                        salaryPayments!.postingDate.toString()))
                                : '',

                      
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: AppColors.grey, fontSize: 10),
                    ),
                    Text(
                         salaryPayments?.paidAmount?.toString() ?? "0",

                        
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: AppColors.primaryLightColor, fontSize: 15))
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
