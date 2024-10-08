import 'package:custom_date_range_picker/custom_date_range_picker.dart';
import 'package:flutter/material.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/view/screens/common_widgets/custom_buttons.dart';
import 'package:madathil/view/screens/common_widgets/custom_dropdown.dart';
import 'package:madathil/view/screens/common_widgets/custom_text_field.dart';
import 'package:madathil/viewmodel/payment_viewmodel.dart';
import 'package:provider/provider.dart';

class TransactionFilterBottomSheet extends StatelessWidget {
  const TransactionFilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController amountController = TextEditingController();
    var mode;
    final paymentVm = Provider.of<PaymentViewmodel>(context, listen: false);
    return Consumer<PaymentViewmodel>(builder: (context, pvm, _) {
      return BottomSheet(
          backgroundColor: AppColors.transparent,
          onClosing: () {},
          builder: (context) {
            return ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(25.0), // Adjust this radius as needed
              ),
              child: Container(
                decoration: BoxDecoration(color: Colors.white),
                padding:
                    EdgeInsets.only(top: 65, bottom: 20, left: 20, right: 20),
                // height: 200, // You can adjust this height as needed
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.tune),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            'Filter',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    GestureDetector(
                      onTap: () {
                        showCustomDateRangePicker(context,
                            dismissible: true,
                            minimumDate: DateTime.now()
                                .subtract(const Duration(days: 365)),
                            maximumDate:
                                DateTime.now().add(const Duration(days: 365)),
                            startDate: pvm.start,
                            endDate: pvm.end, onApplyClick:
                                (DateTime startDate, DateTime endDate) {
                          paymentVm.setDateRange(startDate, endDate);
                        }, onCancelClick: () {
                          paymentVm.clearDateRange();
                          paymentVm.resetPaymentPagination();
                          paymentVm.fetchPaymentHistoryList();
                        },
                            backgroundColor: AppColors.white,
                            primaryColor: AppColors.secondaryColor);
                      },
                      child: AbsorbPointer(
                        child: CustomTextField(
                          hint: 'Date',
                          controller: pvm.dobController,
                          hintcolor: AppColors.grey,
                          suffixIcon: Icon(
                            Icons.calendar_month_rounded,
                            color: AppColors.black,
                          ),
                          readOnly: true,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomDropdown(
                      hint: 'Mode',
                      selectedItem: pvm.paymentMode,
                      items: pvm.paymentModenames!,
                      onChanged: (String? value) {
                        mode = value;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      hint: 'Amount',
                      controller: pvm.amountController,
                      hintcolor: AppColors.grey,
                      keyboardType: TextInputType.number,
                      // suffixIcon: Icon(
                      //   Icons.keyboard_arrow_down_outlined,
                      //   color: AppColors.black,
                      // ),
                    ),
                    const Spacer(),
                    // CustomButton(text: 'Apply',)
                    CustomButton(
                      text: "Apply",
                      height: 43,
                      width: double.maxFinite,
                      onPressed: () {
                        // if (paymentVm.startFormatted != null &&
                        //       paymentVm.endFormatted != null) {
                        Navigator.pop(context);
                        paymentVm.filterOn = true;
                        pvm.amountController.text.isNotEmpty
                            ? paymentVm.amount = int.parse(pvm.amountController.text)
                            : null;
                        mode != null ? paymentVm.paymentMode = mode : null;
                        paymentVm.resetPaymentPagination();
                        paymentVm.fetchPaymentHistoryList();
                        // }
                      },
                    ),
                  ],
                ),
              ),
            );
          });
    });
  }
}
