import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:madathil/view/screens/call_management/widgets/set_reminder_widget.dart';
import 'package:madathil/view/screens/common_widgets/custom_buttons.dart';
import 'package:madathil/view/screens/common_widgets/custom_dropdown.dart';
import 'package:madathil/view/screens/statments/widgets/searchable_dropdown.dart';
import 'package:madathil/viewmodel/call_viewmodel.dart';
import 'package:madathil/viewmodel/common_viewmodel.dart';
import 'package:madathil/viewmodel/customer_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/utils/util_functions.dart';
import 'package:madathil/view/screens/common_widgets/custom_appbarnew.dart';
import 'package:madathil/view/screens/common_widgets/custom_text_field.dart';
// Import the provider

class AddCallDetailsScreen extends StatelessWidget {
  const AddCallDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    TextEditingController customerNameController = TextEditingController();
    TextEditingController customerNumberController = TextEditingController();
    TextEditingController startTimeController = TextEditingController();
    TextEditingController endTimeController = TextEditingController();
    TextEditingController callDurationController = TextEditingController();
    TextEditingController noteController = TextEditingController();
    final customerVm = Provider.of<CustomerViewmodel>(context, listen: false);
    String? customer;
    var customerNumber;
    String? callStatus;

    return Scaffold(
      appBar: const CustomAppBar(
        title: "Add Call",
      ),
      body: SingleChildScrollView(
        child: Consumer<CallViewModel>(
          builder: (context, cvm, child) {
            return Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Customer Name",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            height: 0,
                            color: AppColors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                    const SizedBox(height: 10),
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
                        print('value ------------------------------ $customer');
                        Provider.of<CustomerViewmodel>(context, listen: false)
                            .getCustomerDetail(name: customer!)
                            .then(
                          (value) {
                            customerNumber =
                                customerVm.customerDetails?.first.mobileNo;
                            print(
                                'value ------------------------------ $customerNumber');
                            if (customerNumber != null) {
                              customerNumberController.text = customerNumber;
                            }
                          },
                        );
                      },
                    ),
                    const SizedBox(height: 18),
                    Text(
                      "Customer Number",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            height: 0,
                            color: AppColors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      controller: customerNumberController,
                      validator: (value) =>
                          UtilFunctions.validateCustomerNumber(value),
                      hint: "Enter the Customer Number",
                    ),
                    const SizedBox(height: 18),
                    Text(
                      "Status",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            height: 0,
                            color: AppColors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                    const SizedBox(height: 10),
                    CustomDropdown(
                        hint: 'Select Status',
                        // items: cvm.callStatus ?? [],
                        items: [
                          "Lead",
                          "Issue",
                          "Answered",
                          "Connected",
                          "No answer",
                          "Not connected",
                          "Cancel",
                          "Busy",
                          "Channel limit exceeded"
                        ],
                        onChanged: (value) {
                          callStatus = value;
                          print(
                              'value ------------------------------ $callStatus');
                        }),
                    const SizedBox(height: 18),

                    Text(
                      "Start Time",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            height: 0,
                            color: AppColors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                    const SizedBox(height: 10),
                    GestureDetector(
                      // onTap: () async {
                      //   // Set Reminder: Pick date, then time using provider
                      //   await cvm.selectDateR(context);
                      //   if (cvm.selectedReminderDate != null) {
                      //     await cvm.selectTime(context);
                      //   }
                      // },
                      child: CustomTextField(
                        readOnly: true,
                        suffixIcon: GestureDetector(
                          onTap: () async {
                            print(
                                'ontap clicked ------------------------------------------- ');
                            await cvm.selectDateR(context);
                            if (cvm.selectedStartDate != null) {
                              await cvm.selectTime(context);
                            }
                            startTimeController.text =
                                cvm.formatSelectedDateTime();
                          },
                          child: const Icon(
                            Icons.access_time_sharp,
                            color: AppColors.primeryColor,
                          ),
                        ),
                        controller: startTimeController,
                        validator: (value) {
                          UtilFunctions.validateConversationTime(value);
                        },
                        hint: "Select the call start time",
                      ),
                    ),
                    const SizedBox(height: 18),

                    Text(
                      "End Time",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            height: 0,
                            color: AppColors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      readOnly: true,
                      suffixIcon: GestureDetector(
                        onTap: () async {
                          print(
                              'ontap clicked ------------------------------------------- ');
                          await cvm.selectDateR(context, isEndDate: true);
                          if (cvm.selectedStartDate != null) {
                            await cvm.selectTime(context, isEndDate: true);
                          }
                          endTimeController.text =
                              cvm.formatSelectedDateTime(isEndDate: true);
                          if (endTimeController.text.isNotEmpty &&
                              startTimeController.text.isNotEmpty) {
                            print(
                                'we reached here ------------------------------');
                            if (endTimeController.text
                                    .compareTo(startTimeController.text) >
                                0) {
                              print(
                                  'The thingy ----------------------------------- ${endTimeController.text.compareTo(startTimeController.text)}');
                              var duration = cvm.calculateDuration(
                                  endTimeController.text,
                                  startTimeController.text);
                              callDurationController.text = cvm
                                  .formatTimeFromSeconds(duration.toDouble());
                              print(
                                  'duration ------------------------------------- $duration');
                            }
                          }
                        },
                        child: const Icon(
                          Icons.access_time_sharp,
                          color: AppColors.primeryColor,
                        ),
                      ),
                      controller: endTimeController,
                      validator: (value) {
                        UtilFunctions.validateConversationTime(value);
                        if (value != null) {
                          if (endTimeController.text.isNotEmpty &&
                              startTimeController.text.isNotEmpty) {
                            if (endTimeController.text
                                    .compareTo(startTimeController.text) <
                                0) {
                              return "End time should be greater than start time";
                            }
                          }
                        }
                      },
                      hint: "Select the call end time",
                    ),
                    const SizedBox(height: 18),

                    Text(
                      "Call Duration",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            height: 0,
                            color: AppColors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      readOnly: true,
                      controller: callDurationController,
                      validator: (value) =>
                          UtilFunctions.validateCustomerNumber(value),
                      hint: "Call duration",
                    ),
                    const SizedBox(height: 18),

                    // Call Points Section with Add/Delete functionality
                    Text(
                      "Call Points",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            height: 0,
                            color: AppColors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      validator: UtilFunctions.validatePoints,
                      hint: "Add points",
                      suffixIcon: IconButton(
                        onPressed: () {
                          // Add new call point field when the button is pressed
                          Provider.of<CommonDataViewmodel>(context,
                                  listen: false)
                              .addNoteField();
                        },
                        icon: const Icon(
                          Icons.add,
                          color: AppColors.primeryColor,
                        ),
                      ),
                    ),
                    const SizedBox(height: 18),

                    // List of dynamic Call Points text fields with delete option
                    Consumer<CommonDataViewmodel>(
                      builder: (context, provider, child) {
                        return Column(
                          children: provider.noteControllers
                              .asMap()
                              .entries
                              .map((entry) {
                            int index = entry.key;
                            TextEditingController controller = entry.value;

                            return Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: CustomTextField(
                                      maxLines: 1,
                                      hint: "Call point",
                                      controller: controller,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    // Remove the call point field at the given index
                                    Provider.of<CommonDataViewmodel>(context,
                                            listen: false)
                                        .removeNoteField(index);
                                  },
                                  icon: const Icon(
                                    Icons.delete_forever,
                                    color: AppColors.red,
                                  ),
                                ),
                              ],
                            );
                          }).toList(),
                        );
                      },
                    ),
                    const SizedBox(height: 18),

                    // Text(
                    //   "Note",
                    //   style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    //         height: 0,
                    //         color: AppColors.grey,
                    //         fontSize: 12,
                    //         fontWeight: FontWeight.normal,
                    //       ),
                    // ),
                    // const SizedBox(height: 10),
                    // CustomTextField(
                    //   maxLines: 5,
                    //   validator: UtilFunctions.validateNote,
                    //   hint: "Add note",
                    //   controller: noteController,
                    // ),
                    // const SizedBox(height: 18),

                    // Reminder
                    // Reminder Section
                    // Consumer<CallViewModel>(
                    //   builder: (context, provider, child) {
                    //     return Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    //         const SizedBox(height: 18),
                    //         SetReminderWidget(onTap: () async {
                    //           // Set Reminder: Pick date, then time using provider
                    //           await provider.selectDateR(context);
                    //           if (provider.selectedReminderDate != null) {
                    //             await provider.selectTime(context);
                    //           }
                    //         }),
                    //         const SizedBox(height: 10),
                    //         Row(
                    //           children: [
                    //             Text(
                    //               provider.formatSelectedDateTime(),
                    //               style: const TextStyle(
                    //                   fontSize: 14, color: AppColors.primeryColor),
                    //             ),
                    //             provider.selectedReminderDate != null &&
                    //                     provider.selectedReminderTime != null

                    //                 // Clear Reminder button
                    //                 ? IconButton(
                    //                     onPressed: () {
                    //                       // Clear the reminder
                    //                       provider.clearReminder();
                    //                     },
                    //                     icon: const Icon(
                    //                       Icons.close,
                    //                       color: AppColors.grey,
                    //                     ),
                    //                   )
                    //                 : const SizedBox(),
                    //           ],
                    //         ),
                    //       ],
                    //     );
                    //   },
                    // ),

                    const SizedBox(
                      height: 150,
                    ),

                    CustomButton(
                      text: "Add",
                      height: 43,
                      width: double.maxFinite,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          Navigator.pop(context);
                        } else {
                          toast("Required Field missing", context);
                        }
                      },
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
