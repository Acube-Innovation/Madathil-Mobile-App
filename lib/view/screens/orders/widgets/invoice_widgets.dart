import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:madathil/app_images.dart';
import 'package:madathil/model/model_class/api_response_model/sales_order_detail_response.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/utils/color/util_functions.dart';
import 'package:madathil/view/screens/common_widgets/custom_images.dart';

class InvoiceCard extends StatelessWidget {
  final Invoice? invoice;
  const InvoiceCard({super.key, this.invoice});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Invoice Info",
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: AppColors.black, height: 1.7),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.grey),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Id ",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: AppColors.grey, height: 1.7),
                  ),
                  const Spacer(),
                  Text(
                    invoice?.name ?? "",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: AppColors.grey, height: 1.7),
                  )
                ],
              ),
              Row(
                children: [
                  Text(
                    "invoice Date ",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: AppColors.grey, height: 1.7),
                  ),
                  const Spacer(),
                  Text(
                    UtilFunctions.formatDate(invoice?.invoiceDate ?? "") ?? "",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: AppColors.grey, height: 1.7),
                  )
                ],
              ),
              Row(
                children: [
                  Text(
                    "invoice Due date ",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: AppColors.grey, height: 1.7),
                  ),
                  const Spacer(),
                  Text(
                    UtilFunctions.formatDate(invoice?.invoiceDueDate ?? "") ??
                        "",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: AppColors.grey, height: 1.7),
                  )
                ],
              ),
              Row(
                children: [
                  Text(
                    "invoice Status",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: AppColors.grey, height: 1.7),
                  ),
                  const Spacer(),
                  Text(
                    invoice?.invoiceStatus ?? "",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: AppColors.black, height: 1.7),
                  )
                ],
              ),
              Row(
                children: [
                  Text(
                    "Paid Amount",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: AppColors.grey, height: 1.7),
                  ),
                  const Spacer(),
                  Text(
                    "\$ ${invoice?.paidAmount}" ?? "",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: AppColors.green, height: 1.7),
                  )
                ],
              ),
              Row(
                children: [
                  Text(
                    "OutStanding Amount",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: AppColors.grey, height: 1.7),
                  ),
                  const Spacer(),
                  Text(
                    "\$ ${invoice?.outstandingAmount}" ?? "",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: AppColors.red.withOpacity(0.5), height: 1.7),
                  )
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "Transaction",
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: AppColors.blue, height: 1.7),
            ),
            const SizedBox(
              width: 2,
            ),
            const CustomPngImage(
              imageName: AppImages.trans,
              height: 20,
              width: 20,
            ),
          ],
        )
      ],
    );
  }
}
