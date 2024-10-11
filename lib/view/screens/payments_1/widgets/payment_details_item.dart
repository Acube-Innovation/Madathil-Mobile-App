import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:madathil/model/model_class/api_response_model/monthly_payments_response.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/utils/custom_loader.dart';
import 'package:madathil/utils/no_data_found.dart';
import 'package:madathil/view/screens/common_widgets/custom_images.dart';
import 'package:madathil/viewmodel/salary_viewmodel.dart';
import 'package:provider/provider.dart';

class PaymentDetailsItem extends StatefulWidget {
  final MonthlySalarySummary? monthlySalarySummary;
  const PaymentDetailsItem({super.key, this.monthlySalarySummary});

  @override
  State<PaymentDetailsItem> createState() => _PaymentDetailsItemState();
}

class _PaymentDetailsItemState extends State<PaymentDetailsItem> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<SalaryViewmodel>(context, listen: false)
          .clearMonthlyPaymentsDetails();
      Provider.of<SalaryViewmodel>(context, listen: false)
          .getMonthlyPaymentDetails(month: widget.monthlySalarySummary?.month);

      // Do something here
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SalaryViewmodel>(builder: (ctx, svd, _) {
      if ((svd.payments ?? []).isEmpty) {
        if (svd.isloading!) {
          return const CustomLoader();
        } else {
          return NoDataFOund(
            onRefresh: () {
              Provider.of<SalaryViewmodel>(context, listen: false)
                  .clearMonthlyPaymentsDetails();
              Provider.of<SalaryViewmodel>(context, listen: false)
                  .getMonthlyPaymentDetails(
                      month: widget.monthlySalarySummary?.month);
            },
          );
        }
      } else {
        return RefreshIndicator(
          color: AppColors.primeryColor,
          onRefresh: () async {
            Provider.of<SalaryViewmodel>(context, listen: false)
                .clearMonthlyPaymentsDetails();
            Provider.of<SalaryViewmodel>(context, listen: false)
                .getMonthlyPaymentDetails(
                    month: widget.monthlySalarySummary?.month);
          },
          child: ListView.separated(
            separatorBuilder: (context, index) {
              return const SizedBox();
            },
            itemCount: (svd.payments ?? []).length,
            itemBuilder: (context, index) {
              var item = svd.payments![index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 7,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
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
                            'Mode : ${item.modeOfPayment ?? ''}',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
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
                             item.postingDate != null
                                      ? DateFormat('dd MMM yyyy').format(
                                          DateTime.parse(
                                              item.postingDate.toString()))
                                      : '',
                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall
                                                ?.copyWith(
                                                    color: AppColors.grey, fontSize: 10),
                          ),
                          Text(item.paidAmount?.toString() ?? "",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(
                                      color: AppColors.primaryLightColor,
                                      fontSize: 15))
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        );
      }
    });
  }
}
