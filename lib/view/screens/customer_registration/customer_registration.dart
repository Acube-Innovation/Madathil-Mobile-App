import 'package:flutter/material.dart';
import 'package:madathil/utils/util_functions.dart';
import 'package:madathil/view/screens/common_widgets/custom_buttons.dart';
import 'package:madathil/view/screens/common_widgets/custom_images.dart';
import 'package:madathil/view/screens/common_widgets/custom_text_field.dart';
import 'package:madathil/viewmodel/auth_viewmodel.dart';
import 'package:provider/provider.dart';

import '../../../utils/color/app_colors.dart';

class CustomerRegistration extends StatelessWidget {
  const CustomerRegistration({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailCTLR = TextEditingController();
    TextEditingController fullnameCTLR = TextEditingController();
    TextEditingController numberCTLR = TextEditingController();
    TextEditingController addressCTLR = TextEditingController();
    final authVm = Provider.of<AuthViewmodel>(context, listen: false);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: authVm.formKey1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: CustomPngImage(
                      imageName: 'assets/images/logo.png',
                      height: 54,
                      width: 54,
                      boxFit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text(
                      "New Customer",
                      style:
                          Theme.of(context).textTheme.headlineMedium!.copyWith(
                                height: 1.7,
                                color: AppColors.primeryColor,
                              ),
                    ),
                  ),
                  Center(
                    child: Text(
                      "Please fill the required fields",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            height: 1.7,
                            color: AppColors.grey,
                          ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
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
                    controller: addressCTLR,
                    hint: "",
                    hintcolor: AppColors.grey,
                    maxLines: 4,
                    onchaged: (val) {
                      // dashboardVM.setReviewMsg(val);
                    },
                    validator: UtilFunctions.validateAddress,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 50),
                    child: CustomButton(
                      text: "Register",
                      height: 43,
                      width: double.maxFinite,
                      onPressed: () {
                        if (authVm.formKey1.currentState!.validate()) {
                          showVerificationPopup(context);
                        } else {
                          toast("Required Field missing", context);
                        }
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

  void showVerificationPopup(BuildContext context) {
    // Wrap the logic that accesses MediaQuery in a Builder
    showModalBottomSheet(
      isDismissible: false,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        final popupHeight =
            MediaQuery.of(context).size.height * 0.4; // Calculate height here
        return PopScope(
          canPop: false,
          child: SingleChildScrollView(
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(20)),
              child: Container(
                color: AppColors.white,
                padding: const EdgeInsets.all(20),
                height: popupHeight, // Use the calculated height
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 86,
                      width: 86,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.primeryColor,
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.task_alt,
                          size: 60, // Adjust the size as needed
                          color: AppColors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'User Created',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            height: 1.7,
                            color: AppColors.black,
                            fontSize: 19,
                          ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      'New user created successfully',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            height: 1.7,
                            color: AppColors.black,
                            fontSize: 13,
                          ),
                    ),
                    const SizedBox(
                        height: 30), // Provides spacing before the button
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: CustomButton(
                        height: 44,
                        width: double.infinity,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        text: "Done",
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
