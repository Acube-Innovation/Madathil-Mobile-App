import 'package:flutter/material.dart';
import 'package:madathil/utils/color/util_functions.dart';
import 'package:madathil/view/screens/common_widgets/custom_appbarnew.dart';
import 'package:madathil/view/screens/common_widgets/custom_buttons.dart';
import 'package:madathil/view/screens/common_widgets/custom_text_field.dart';
import 'package:madathil/viewmodel/auth_viewmodel.dart';
import 'package:provider/provider.dart';

import '../../../utils/color/app_colors.dart';

class LeadCreationScreen extends StatelessWidget {
  const LeadCreationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailCTLR = TextEditingController();
    TextEditingController fullnameCTLR = TextEditingController();
    TextEditingController numberCTLR = TextEditingController();
    final authVm = Provider.of<AuthViewmodel>(context, listen: false);

    return Scaffold(
      appBar: const CustomAppBar(title: "Add Lead"),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: authVm.formKey1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Lead Source",
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
                    controller: fullnameCTLR,
                    hint: 'Enter the lead source',
                    validator: UtilFunctions.validateName,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Lead Name",
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
                      controller: emailCTLR,
                      hint: 'Enter the lead name',
                      validator: UtilFunctions.validateEmail),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Lead Category",
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
                    controller: numberCTLR,
                    hint: 'Select Lead Category',
                    validator: UtilFunctions.validateMobileNumber,
                    // obscureText: avm.obscureText!,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Contact Number",
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
                    controller: fullnameCTLR,
                    hint: 'Enter contact number',
                    validator: UtilFunctions.validateName,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Contact Email",
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
                    controller: fullnameCTLR,
                    hint: 'Enter contact email',
                    validator: UtilFunctions.validateName,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Consumer Number",
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
                    controller: fullnameCTLR,
                    hint: 'Enter the Consumer Number',
                    validator: UtilFunctions.validateName,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Aadhar Number",
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
                    controller: fullnameCTLR,
                    hint: 'Enter the aadhar number',
                    validator: UtilFunctions.validateName,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Address",
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
                    controller: fullnameCTLR,
                    hint: 'Enter Address',
                    validator: UtilFunctions.validateName,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Image of the lead",
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
                    suffixIcon: const Icon(Icons.camera_alt_outlined,
                        color: AppColors.primeryColor),
                    controller: fullnameCTLR,
                    enabled: false,
                    hint: 'Select image of the lead',
                    validator: UtilFunctions.validateName,
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: CustomButton(
                      text: "Add Lead",
                      height: 43,
                      width: double.maxFinite,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
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
