import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/utils/color/util_functions.dart';
import 'package:madathil/view/screens/common_widgets/custom_appbarnew.dart';
import 'package:madathil/view/screens/common_widgets/custom_buttons.dart';
import 'package:madathil/view/screens/common_widgets/custom_text_field.dart';
import 'package:madathil/view/screens/common_widgets/image_picker_bottom_sheet.dart';
import 'package:madathil/view/screens/customer/customer_detail_screen.dart';
import 'package:madathil/viewmodel/common_viewmodel.dart';
import 'package:provider/provider.dart';

class AddNewCustomer extends StatelessWidget {
  const AddNewCustomer({super.key});

  @override
  Widget build(BuildContext context) {
    final commonVm = Provider.of<CommonDataViewmodel>(context, listen: false);

    TextEditingController emailCTLR = TextEditingController();
    TextEditingController nameCTLR = TextEditingController();
    TextEditingController numberCTLR = TextEditingController();
    TextEditingController addressCTLR = TextEditingController();
    TextEditingController pincodeCTLR = TextEditingController();

    return Scaffold(
      appBar: const CustomAppBar(title: "Add Customer"),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            // key: commonVm.formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Customer Name",
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
                    controller: nameCTLR,
                    hint: 'Enter the full name',
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
                      controller: emailCTLR,
                      hint: '123@mail.com',
                      validator: UtilFunctions.validateEmail),
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
                    keyboardType: TextInputType.number,
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
                    "Pincode",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          height: 1.7,
                          color: AppColors.grey,
                        ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomTextField(
                    keyboardType: TextInputType.number,
                    controller: pincodeCTLR,
                    hint: "Enter the pin code",
                    hintcolor: AppColors.grey,
                    onchaged: (val) {
                      // dashboardVM.setReviewMsg(val);
                    },
                    validator: UtilFunctions.validatepincode,
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
                    hint: "Enter the Address",
                    hintcolor: AppColors.grey,
                    maxLines: 4,
                    onchaged: (val) {
                      // dashboardVM.setReviewMsg(val);
                    },
                    validator: UtilFunctions.validateAddress,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Images",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          height: 1.7,
                          color: AppColors.grey,
                        ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Consumer<CommonDataViewmodel>(builder: (context, cdv, _) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                                isDismissible: true,
                                isScrollControlled: true,
                                backgroundColor: Colors.white,
                                context: context,
                                builder: (BuildContext context) {
                                  final popupHeight =
                                      MediaQuery.of(context).size.height *
                                          0.6; // Calculate height here
                                  return ImagePickerBottomSheet1(
                                    onImagePicked: (XFile? image) {},
                                  );
                                });
                          },
                          child: AbsorbPointer(
                            child: CustomTextField(
                              controller: TextEditingController(
                                  text: cdv.pickedImage?.path ?? ""),
                              suffixIcon: const Icon(
                                Icons.camera_alt_outlined,
                                color: AppColors.secondaryColor,
                              ),
                              hint: "Take a picture",
                              hintcolor: AppColors.grey,
                              onchaged: (val) {},
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        cdv.pickedImage != null
                            ? Stack(
                                children: [
                                  Image.file(
                                    File(cdv.pickedImage!.path),
                                    height: 100,
                                    width: 100,
                                    // Adjust width as per your need
                                    fit: BoxFit
                                        .cover, // Ensure the image fits nicely
                                  ),
                                  Positioned(
                                    top: 0,
                                    right: 0,
                                    child: GestureDetector(
                                      onTap: () {
                                        // Add logic to clear the image from provider
                                        commonVm
                                            .clearCustomerimage(); // You will need to add this method in your provider
                                      },
                                      child: const Icon(Icons.clear,
                                          color: AppColors.primeryColor),
                                    ),
                                  ),
                                ],
                              )
                            : const SizedBox(),
                      ],
                    );
                  }),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 50),
                    child: CustomButton(
                      text: "Submit",
                      width: double.maxFinite,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const CustomerDetailScreen(),
                            ));

                        /*  if (commonVm.formKey.currentState!.validate()) {
                     
                        } else {
                          toast("Required Field missing", context);
                        }*/
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
