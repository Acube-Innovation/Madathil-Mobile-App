import 'package:flutter/material.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/utils/util_functions.dart';
import 'package:madathil/view/screens/common_widgets/custom_appbarnew.dart';
import 'package:madathil/view/screens/common_widgets/custom_buttons.dart';
import 'package:madathil/view/screens/common_widgets/custom_dropdown.dart';
import 'package:madathil/view/screens/common_widgets/custom_text_field.dart';
import 'package:madathil/view/screens/points/points_congrats_screen.dart';
import 'package:madathil/view/screens/statments/widgets/item_serch_dropdown.dart';
import 'package:madathil/view/screens/statments/widgets/searchable_dropdown.dart';
import 'package:madathil/viewmodel/common_viewmodel.dart';
import 'package:provider/provider.dart';

class AddClosingStatment extends StatelessWidget {
  const AddClosingStatment({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    TextEditingController advanceController = TextEditingController();
    TextEditingController mobNoController = TextEditingController();
    TextEditingController closeamountController = TextEditingController();
    TextEditingController addressController = TextEditingController();
    TextEditingController businessController = TextEditingController();
    TextEditingController itemNameController = TextEditingController();
    TextEditingController closedkwController = TextEditingController();
    TextEditingController itemMarginController = TextEditingController();
    TextEditingController itemExpenseController = TextEditingController();
    final cdv = Provider.of<CommonDataViewmodel>(context, listen: false);
    String? customer;
    String? item;
    String? business;

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
                SearchableDropdown(
                  hintText: "Select Customer",
                  onItemSelected: (selectedCustomer) {
                    customer = selectedCustomer;
                  },
                  validator: (selectedCustomer) {
                    if (selectedCustomer == null || selectedCustomer.isEmpty) {
                      return 'Please select a customer';
                    }
                    return null;
                  },
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
                  "Select Business",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      height: 0,
                      color: AppColors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.normal),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomDropdown(
                  validator: (p0) {
                    if (p0 == null) {
                      return "Please select business";
                    }

                    return null;
                  },
                  hint: 'Select Business',
                  items: const ["Solar", "Trading"],
                  // selectedItem: 'Brand',
                  onChanged: (String? value) {
                    business = value;
                  },
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
                ItemSearchableDropdown(
                  hintText: "Select Item",
                  onItemSelected: (selectedItem) {
                    item = selectedItem;
                  },
                ),
                const SizedBox(
                  height: 18,
                ),
                Text(
                  "Advance",
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
                  keyboardType: TextInputType.number,
                  validator: UtilFunctions.validateAdvance,
                  hint: "2500.0",
                  controller: advanceController,
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
                  keyboardType: TextInputType.number,
                  validator: UtilFunctions.validateClosedKw,
                  hint: "33.6",
                  controller: closedkwController,
                ),
                const SizedBox(
                  height: 18,
                ),
                Text(
                  "Close amount",
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
                  keyboardType: TextInputType.number,
                  validator: UtilFunctions.validateItemMargin,
                  hint: "230.0",
                  controller: closeamountController,
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
                  keyboardType: TextInputType.number,
                  validator: UtilFunctions.validateItemMargin,
                  hint: "130.0",
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
                  onPressed: () async {
                    if (formKey.currentState?.validate() ?? false) {
                      UtilFunctions.loaderPopup(context);
                      await cdv
                          .addClosingStatment(
                        customerName: customer,
                        mobNo: mobNoController.text,
                        business: business,
                        item: item,
                        kw: closedkwController.text,
                        margin: itemMarginController.text,
                        address: addressController.text,
                        closeAmount: closeamountController.text,
                      )
                          .then((value) {
                        Navigator.pop(context);
                        if (value) {
                          Provider.of<CommonDataViewmodel>(context,
                                  listen: false)
                              .resetClosingPagination();
                          Provider.of<CommonDataViewmodel>(context,
                                  listen: false)
                              .fetchClosingStatmentList();
                          toast("Closing Statment added succesfully", context,
                              isError: false);

                          Navigator.pop(context);
                        } else {
                          toast(cdv.errormsg, context);
                        }
                      });

                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) =>
                      //             const CongratulationsScreen()));
                    } else {
                      toast("Required Field missing", context, isError: true);
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
