import 'package:flutter/material.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/utils/color/util_functions.dart';
import 'package:madathil/view/screens/common_widgets/custom_buttons.dart';
import 'package:madathil/view/screens/common_widgets/custom_images.dart';
import 'package:madathil/view/screens/common_widgets/custom_text_field.dart';
import 'package:madathil/view/screens/customer_registration/customer_registration.dart';
import 'package:madathil/view/screens/products/product_list.dart';
import 'package:madathil/view/screens/profile/profile_screen.dart';
import 'package:madathil/viewmodel/auth_viewmodel.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailCtlr = TextEditingController();
    TextEditingController passwordCtlr = TextEditingController();
    final authVm = Provider.of<AuthViewmodel>(context, listen: false);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
            child: Form(
              key: authVm.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: CustomPngImage(
                      imageName: 'assets/images/logo.png',
                      height: 104,
                      width: 104,
                      boxFit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text(
                      "Welcome back",
                      style:
                          Theme.of(context).textTheme.headlineMedium!.copyWith(
                                height: 1.7,
                                color: AppColors.primeryColor,
                              ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Text(
                    "Username",
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
                    controller: emailCtlr,
                    hint: 'Eric Selvick',
                    validator: UtilFunctions.validateName,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Password",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          height: 1.7,
                          color: AppColors.grey,
                        ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Consumer<AuthViewmodel>(builder: (context, avm, _) {
                    return CustomTextField(
                      onchaged: (val) {},
                      controller: passwordCtlr,
                      hint: 'Password',
                      obscureText: avm.obscureText!,
                      validator: UtilFunctions.validatePassword,
                      suffixIcon: GestureDetector(
                          onTap: () {
                            authVm.setObscure(avm.obscureText!);
                          },
                          child: const Icon(
                            Icons.remove_red_eye,
                          )),
                    );
                  }),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => const PrdoductList()

                                  //  const ProfileScreen()

                                  ),
                            );
                          },
                          child: Text(
                            "Forgot Password?",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  height: 1.7,
                                  color: AppColors.secondaryColor,
                                ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    const CustomerRegistration(),
                              ),
                            );
                          },
                          child: RichText(
                              text: TextSpan(children: [
                            TextSpan(
                              text: "New User?",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    height: 1.7,
                                    color: AppColors.black,
                                  ),
                            ),
                            TextSpan(
                              text: "  Register here",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    height: 1.7,
                                    color: AppColors.primeryColor,
                                  ),
                            ),
                          ])),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: CustomButton(
          text: "Login",
          height: 43,
          width: double.maxFinite,
          onPressed: () {
            if (authVm.formKey.currentState!.validate()) {
            } else {
              toast("Required Field missing", context);
            }
          },
        ),
      ),
    );
  }
}