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
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Full Name",
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
                    hint: 'full name',
                    validator: UtilFunctions.validateName,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Email ID",
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
                      hint: '123@mail.com',
                      validator: UtilFunctions.validateEmail),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Mobile Number",
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
                    hint: '9785857456',
                    validator: UtilFunctions.validateMobileNumber,
                    // obscureText: avm.obscureText!,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Full Name",
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
                    hint: 'full name',
                    validator: UtilFunctions.validateName,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Full Name",
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
                    hint: 'full name',
                    validator: UtilFunctions.validateName,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Full Name",
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
                    hint: 'full name',
                    validator: UtilFunctions.validateName,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Full Name",
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
                    hint: 'full name',
                    validator: UtilFunctions.validateName,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 50),
                    child: CustomButton(
                      text: "Add Lead",
                      height: 43,
                      width: double.maxFinite,
                      onPressed: () {},
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
