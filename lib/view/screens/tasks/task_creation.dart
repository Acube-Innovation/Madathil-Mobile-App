import 'package:flutter/material.dart';
import 'package:madathil/utils/color/util_functions.dart';
import 'package:madathil/view/screens/common_widgets/custom_appbarnew.dart';
import 'package:madathil/view/screens/common_widgets/custom_buttons.dart';
import 'package:madathil/view/screens/common_widgets/custom_text_field.dart';
import 'package:madathil/viewmodel/auth_viewmodel.dart';
import 'package:provider/provider.dart';

import '../../../utils/color/app_colors.dart';

class TaskCreationScreen extends StatelessWidget {
  const TaskCreationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailCTLR = TextEditingController();
    TextEditingController fullnameCTLR = TextEditingController();
    TextEditingController numberCTLR = TextEditingController();
    final authVm = Provider.of<AuthViewmodel>(context, listen: false);

    return Scaffold(
      appBar: const CustomAppBar(title: "Add Task"),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: authVm.formKey1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Task Title ",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          height: 1.7,
                          color: AppColors.grey,
                        ),
                  ),
                  const SizedBox(height: 5),
                  CustomTextField(
                    onchaged: (val) {},
                    controller: fullnameCTLR,
                    hint: 'Enter the task title',
                    validator: UtilFunctions.validateName,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Task Description",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          height: 1.7,
                          color: AppColors.grey,
                        ),
                  ),
                  const SizedBox(height: 5),
                  CustomTextField(
                      onchaged: (val) {},
                      maxLines: 8,
                      controller: emailCTLR,
                      hint: 'Enter the description',
                      validator: UtilFunctions.validateEmail),
                  const SizedBox(height: 10),
                  Text(
                    "Task type",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          height: 1.7,
                          color: AppColors.grey,
                        ),
                  ),
                  const SizedBox(height: 5),
                  CustomTextField(
                    onchaged: (val) {},
                    controller: numberCTLR,
                    suffixIcon: const Icon(Icons.arrow_drop_down,
                        color: AppColors.primeryColor),
                    hint: 'Select type',
                    validator: UtilFunctions.validateMobileNumber,
                    // obscureText: avm.obscureText!,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Date",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          height: 1.7,
                          color: AppColors.grey,
                        ),
                  ),
                  const SizedBox(height: 5),
                  CustomTextField(
                    onchaged: (val) {},
                    controller: fullnameCTLR,
                    suffixIcon: const Icon(Icons.calendar_month,
                        color: AppColors.primeryColor),
                    enabled: false,
                    hint: 'Select date',
                    validator: UtilFunctions.validateName,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Assignee",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          height: 1.7,
                          color: AppColors.grey,
                        ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomTextField(
                    onchaged: (val) {},
                    enabled: false,
                    controller: fullnameCTLR,
                    suffixIcon: const Icon(Icons.arrow_drop_down,
                        color: AppColors.primeryColor),
                    hint: 'Select Assignee',
                    validator: UtilFunctions.validateName,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: CustomButton(
                        text: "Add Task",
                        width: double.maxFinite,
                        onPressed: () {}),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
