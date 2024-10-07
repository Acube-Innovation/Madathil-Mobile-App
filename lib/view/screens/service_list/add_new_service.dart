import 'package:flutter/material.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/utils/color/util_functions.dart';
import 'package:madathil/view/screens/common_widgets/custom_appbarnew.dart';
import 'package:madathil/view/screens/common_widgets/custom_buttons.dart';
import 'package:madathil/view/screens/common_widgets/custom_dropdown.dart';
import 'package:madathil/view/screens/common_widgets/custom_text_field.dart';
import 'package:madathil/view/screens/statments/widgets/item_serch_dropdown.dart';
import 'package:madathil/view/screens/statments/widgets/searchable_dropdown.dart';
import 'package:madathil/viewmodel/common_viewmodel.dart';
import 'package:provider/provider.dart';

class AddService extends StatelessWidget {
  const AddService({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    TextEditingController problemContoller = TextEditingController();
    TextEditingController descContoller = TextEditingController();
    TextEditingController workDoneContoller = TextEditingController();
    String? customer;
    String? item;
    String? maintenanceType;
    final commonVm = Provider.of<CommonDataViewmodel>(context, listen: false);

    return Scaffold(
      appBar: const CustomAppBar(title: "Add Service"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Consumer<CommonDataViewmodel>(builder: (ctx, cdv, _) {
            return Form(
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select a customer';
                      }
                      return null;
                    },
                    hintText: "Select Customer",
                    onItemSelected: (selectedCustomer) {
                      customer = selectedCustomer;
                    },
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Text(
                    "Select Status",
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
                        return "Please Select Status";
                      }
                      return null;
                    },
                    hint: 'Select Maintenance Type',
                    items: cdv.statusOptions ?? [],
                    selectedItem: cdv.selectedStatusAdd != null &&
                            cdv.statusOptions!.contains(cdv.selectedStatusAdd)
                        ? cdv.selectedStatusAdd
                        : null,
                    onChanged: (String? value) {
                      cdv.setSelectedStatusAdd(value);
                    },
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Text(
                    "Select Maintenance Type",
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
                        return "Please Select Maintenance Type";
                      }
                      return null;
                    },
                    hint: 'Unscheduled',
                    items: const ["Unscheduled", "Scheduled"],
                    onChanged: (String? value) {
                      maintenanceType = value;
                    },
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Text(
                    "Select Sales Person",
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
                        return "Please Select Sales Person";
                      }
                      return null;
                    },
                    hint: 'Select Sales Person',
                    items: cdv.salesPersons ?? [],
                    selectedItem: cdv.selectedPerson != null &&
                            cdv.salesPersons!.contains(cdv.selectedPerson)
                        ? cdv.selectedPerson
                        : null,
                    onChanged: (String? value) {
                      cdv.setSelectedPerson(value);
                    },
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Text(
                    "Select Item",
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
                    "Enter Problem",
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
                    validator: UtilFunctions.requiredField,
                    hint: "Problem",
                    controller: problemContoller,
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Text(
                    "Enter Description",
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
                    validator: UtilFunctions.requiredField,
                    hint: "Description",
                    controller: descContoller,
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Text(
                    "Enter work done",
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
                    validator: UtilFunctions.requiredField,
                    hint: "Work Done",
                    controller: workDoneContoller,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomButton(
                    text: "Submit",
                    onPressed: () async {
                      // Handle submit action

                      if (formKey.currentState!.validate()) {
                        UtilFunctions.loaderPopup(context);

                        await commonVm
                            .addNewService(
                          customer: customer,
                          maintenenceType: maintenanceType,
                          status: cdv.selectedStatusAdd,
                          item: item,
                          servicePerson: cdv.selectedPerson,
                          problem: problemContoller.text,
                          desc: descContoller.text,
                          work: workDoneContoller.text,
                        )
                            .then((value) {
                          Navigator.pop(context);

                          if (value) {
                            Provider.of<CommonDataViewmodel>(context,
                                    listen: false)
                                .resetServiceHistoryPagination();
                            Provider.of<CommonDataViewmodel>(context,
                                    listen: false)
                                .fetchServiceHistoryList();
                            toast("Service Added Successfully", context,
                                isError: false);
                            Navigator.pop(context);
                          } else {
                            toast(cdv.errormsg, context, isError: true);
                          }
                        });
                      }
                    },
                  )
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
