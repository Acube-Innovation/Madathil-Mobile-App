import 'package:flutter/material.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/view/screens/common_widgets/custom_buttons.dart';
import 'package:madathil/view/screens/common_widgets/custom_text_field.dart';

class TransactionFilterBottomSheet extends StatelessWidget {
  const TransactionFilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
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
                  CustomTextField(
                    hint: 'Date',
                    hintcolor: AppColors.black,
                    suffixIcon: Icon(
                      Icons.calendar_month_rounded,
                      color: AppColors.black,
                    ),
                    readOnly: true,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    hint: 'Mode',
                    hintcolor: AppColors.black,
                    suffixIcon: Icon(
                      Icons.keyboard_arrow_down_outlined,
                      color: AppColors.black,
                    ),
                    readOnly: true,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    hint: 'Amount',
                    hintcolor: AppColors.black,
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
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          );
        });
  }
}
