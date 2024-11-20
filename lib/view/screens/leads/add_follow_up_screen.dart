import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:madathil/model/model_class/api_response_model/leads_detail_response.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/utils/color/util_functions.dart';
import 'package:madathil/utils/custom_loader.dart';
import 'package:madathil/view/screens/common_widgets/custom_appbarnew.dart';
import 'package:madathil/view/screens/common_widgets/custom_buttons.dart';
import 'package:madathil/view/screens/common_widgets/custom_dropdown.dart';
import 'package:madathil/view/screens/common_widgets/custom_text_field.dart';
import 'package:madathil/viewmodel/call_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:madathil/viewmodel/leads_viewmodel.dart';

class AddFollowUpScreen extends StatefulWidget {
  final LeadsDetailsData? data;
  const AddFollowUpScreen({super.key, this.data});

  @override
  State<AddFollowUpScreen> createState() => _AddFollowUpScreenState();
}

class _AddFollowUpScreenState extends State<AddFollowUpScreen> {
  late TextEditingController feedbackctrlr; // Persist controller
  final GlobalKey<FormState> formKey1 = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    feedbackctrlr = TextEditingController(); // Initialize controller
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<LeadsViewmodel>(context, listen: false)
          .getFollowupstatusList();
    });
  }

  @override
  void dispose() {
    feedbackctrlr.dispose(); // Dispose controller to avoid memory leaks
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final leadProvider = Provider.of<LeadsViewmodel>(context, listen: false);

    return Scaffold(
      appBar: const CustomAppBar(title: "Add Follow Up"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Date Picker with Icon
                _buildLabel(context, "Pick Date"),
                const SizedBox(height: 5),
                GestureDetector(
                  onTap: () => leadProvider.selectDate(context),
                  child: Consumer<LeadsViewmodel>(builder: (ctx, lvm, _) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 16),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.calendar_today, color: Colors.blue),
                          const SizedBox(width: 10),
                          Text(
                            lvm.formattedDate,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 20),
                // Time Picker with Icon
                _buildLabel(context, "Pick Time"),
                const SizedBox(height: 5),
                GestureDetector(
                  onTap: () => leadProvider.selectTime(context),
                  child: Consumer<LeadsViewmodel>(builder: (ctx, lvm, _) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 16),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.access_time, color: Colors.green),
                          const SizedBox(width: 10),
                          Text(
                            lvm.formattedTime,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 20),
                _buildLabel(context, "Select Status"),
                const SizedBox(height: 5),
                Consumer<LeadsViewmodel>(
                  builder: (ctx, lvm, _) {
                    if (lvm.isLoading) {
                      return const CustomLoader();
                    }
                    return CustomDropdown(
                      hint: 'Select Status',
                      items: lvm.statuses ?? [], // Dynamic statuses
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select a status';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        lvm.setSelectedStatus(value);
                      },
                    );
                  },
                ),
                const SizedBox(height: 20),

                _buildLabel(context, "Feedback"),
                const SizedBox(height: 5),
                CustomTextField(
                  maxLines: 6,
                  maxLength: 100,
                  controller: feedbackctrlr,
                  hint: 'Enter feedback',
                  //validator: UtilFunctions.validateFeedback,
                ),
                const SizedBox(height: 40),
                // Save Button
                Center(
                  child: Consumer<LeadsViewmodel>(builder: (ctx, lvm, _) {
                    return CustomButton(
                      onPressed: () async {
                        final apiDateTime = leadProvider.apiFormattedDateTime;

                        if (apiDateTime != null &&
                            formKey1.currentState!.validate() &&
                            lvm.selectedStatus != null) {
                          UtilFunctions.loaderPopup(context);

                          await lvm
                              .addFollowUp(
                            leadId: widget.data?.name,
                            datetime: apiDateTime,
                            status: lvm.selectedStatus,
                            intx:
                                (lvm.leadsDetails?.data?.leadTracking?.length ??
                                        0) +
                                    1,
                            feedback: feedbackctrlr.text,
                          )
                              .then((value) {
                            Navigator.pop(context);
                            if (value) {
                              toast("Follow up added successfully", context);
                              Provider.of<LeadsViewmodel>(context,
                                      listen: false)
                                  .getLeadsDetails(id: widget.data?.name);
                              Navigator.pop(context);
                            } else {
                              toast(lvm.errormsg ?? "Failed!", context,
                                  isError: true);
                            }
                          });
                        } else {
                          if (apiDateTime == null) {
                            toast("Please select date and time", context,
                                isError: true);
                          } else {
                            toast("Required fields are missing!", context,
                                isError: true);
                          }
                        }
                      },
                      text: "Save",
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(BuildContext context, String text) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodySmall!.copyWith(
            height: 1.7,
            color: AppColors.grey,
          ),
    );
  }
}
