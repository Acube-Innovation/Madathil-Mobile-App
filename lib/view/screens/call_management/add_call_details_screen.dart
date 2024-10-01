import 'package:flutter/material.dart';
import 'package:madathil/view/screens/call_management/widgets/set_reminder_widget.dart';
import 'package:madathil/view/screens/common_widgets/custom_buttons.dart';
import 'package:madathil/viewmodel/common_viewmodel.dart';
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
    TextEditingController callTitleController = TextEditingController();
    TextEditingController noteController = TextEditingController();

    return Scaffold(
      appBar: const CustomAppBar(
        title: "Add Call",
      ),
      body: SingleChildScrollView(
        child: Form(
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
                CustomTextField(
                  validator: UtilFunctions.validateName,
                  hint: "Safil",
                  controller: customerNameController,
                ),
                const SizedBox(height: 18),
                Text(
                  "Call title",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        height: 0,
                        color: AppColors.grey,
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                      ),
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  validator: UtilFunctions.validateCalltitle,
                  hint: "Enter the call details",
                  controller: callTitleController,
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
                      Provider.of<CommonDataViewmodel>(context, listen: false)
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
                      children:
                          provider.noteControllers.asMap().entries.map((entry) {
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

                Text(
                  "Note",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        height: 0,
                        color: AppColors.grey,
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                      ),
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  maxLines: 5,
                  validator: UtilFunctions.validateNote,
                  hint: "Add note",
                  controller: noteController,
                ),
                const SizedBox(height: 18),

                // Reminder
                // Reminder Section
                Consumer<CommonDataViewmodel>(
                  builder: (context, provider, child) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 18),
                        SetReminderWidget(onTap: () async {
                          // Set Reminder: Pick date, then time using provider
                          await provider.selectDateR(context);
                          if (provider.selectedReminderDate != null) {
                            await provider.selectTime(context);
                          }
                        }),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Text(
                              provider.formatSelectedDateTime(),
                              style: const TextStyle(
                                  fontSize: 14, color: AppColors.primeryColor),
                            ),
                            provider.selectedReminderDate != null &&
                                    provider.selectedReminderTime != null

                                // Clear Reminder button
                                ? IconButton(
                                    onPressed: () {
                                      // Clear the reminder
                                      provider.clearReminder();
                                    },
                                    icon: const Icon(
                                      Icons.close,
                                      color: AppColors.grey,
                                    ),
                                  )
                                : const SizedBox(),
                          ],
                        ),
                      ],
                    );
                  },
                ),

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
        ),
      ),
    );
  }
}
