import 'package:flutter/material.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/utils/color/util_functions.dart';
import 'package:madathil/view/screens/common_widgets/custom_appbarnew.dart';
import 'package:madathil/view/screens/common_widgets/custom_buttons.dart';
import 'package:madathil/view/screens/common_widgets/custom_text_field.dart';

class AddClosingStatment extends StatelessWidget {
  const AddClosingStatment({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    TextEditingController customerNameController = TextEditingController();
    TextEditingController mobNoController = TextEditingController();
    TextEditingController addressController = TextEditingController();
    TextEditingController businessController = TextEditingController();
    TextEditingController itemNameController = TextEditingController();
    TextEditingController closedkwController = TextEditingController();
    TextEditingController itemMarginController = TextEditingController();
    TextEditingController itemExpenseController = TextEditingController();
    return Scaffold(
      appBar: const CustomAppBar(title: "Add Closing Statement"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Customer Name",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      height: 0,
                      color: AppColors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.normal),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  validator: UtilFunctions.validateName,
                  hint: "Safil",
                  controller: customerNameController,
                ),
                const SizedBox(
                  height: 18,
                ),
                Text(
                  "Mobile Number",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      height: 0,
                      color: AppColors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.normal),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  hint: "9709567071",
                  validator: UtilFunctions.validateMobileNumber,
                  controller: mobNoController,
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(
                  height: 18,
                ),
                Text(
                  "Address",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      height: 0,
                      color: AppColors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.normal),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  maxLines: 5,
                  validator: UtilFunctions.validateAddress,
                  hint: "Kunnum purath lane",
                  controller: addressController,
                ),
                const SizedBox(
                  height: 18,
                ),
                Text(
                  "Business",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      height: 0,
                      color: AppColors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.normal),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  validator: UtilFunctions.validateBusiness,
                  hint: "Solar",
                  controller: businessController,
                ),
                const SizedBox(
                  height: 18,
                ),
                Text(
                  "Item name",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      height: 0,
                      color: AppColors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.normal),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  validator: UtilFunctions.validateItemName,
                  hint: "Item1",
                  controller: itemNameController,
                ),
                const SizedBox(
                  height: 18,
                ),
                Text(
                  "Closed Kw",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      height: 0,
                      color: AppColors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.normal),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  validator: UtilFunctions.validateClosedKw,
                  hint: "33.6",
                  controller: closedkwController,
                ),
                const SizedBox(
                  height: 18,
                ),
                Text(
                  "Item Margin",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      height: 0,
                      color: AppColors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.normal),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  validator: UtilFunctions.validateItemMargin,
                  hint: "230.0",
                  controller: itemMarginController,
                ),
                const SizedBox(
                  height: 18,
                ),
                Text(
                  "Item Expense",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      height: 0,
                      color: AppColors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.normal),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  validator: UtilFunctions.validateItemExpense,
                  hint: "850.0",
                  controller: itemExpenseController,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomButton(
                  text: "Submit",
                  height: 43,
                  width: double.maxFinite,
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                    } else {
                      toast("Required Field missing", context);
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
