import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/utils/util_functions.dart';
import 'package:madathil/view/screens/common_widgets/custom_appbarnew.dart';
import 'package:madathil/view/screens/common_widgets/custom_buttons.dart';
import 'package:madathil/view/screens/common_widgets/custom_text_field.dart';
import 'package:madathil/view/screens/common_widgets/image_picker_bottom_sheet.dart';
import 'package:madathil/view/screens/customer/customer_detail_screen.dart';
import 'package:madathil/viewmodel/customer_viewmodel.dart';
import 'package:provider/provider.dart';

class AddNewCustomer extends StatelessWidget {
  const AddNewCustomer({super.key});

  @override
  Widget build(BuildContext context) {
    final customerVm = Provider.of<CustomerViewmodel>(context, listen: false);

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
            key: customerVm.formKey,
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
                          color: AppColors.black,
                        ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomTextField(
                    onchaged: (val) {
                      customerVm.addCustomerUtilModelData(name: val);
                    },
                    // controller: nameCTLR,
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
                          color: AppColors.black,
                        ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomTextField(
                      onchaged: (val) {
                        customerVm.addCustomerUtilModelData(email: val);
                      },
                      // controller: emailCTLR,
                      hint: '123@mail.com',
                      validator: UtilFunctions.validateEmail),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Contact Number",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          height: 1.7,
                          color: AppColors.black,
                        ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomTextField(
                    keyboardType: TextInputType.number,
                    onchaged: (val) {
                      customerVm.addCustomerUtilModelData(phoneNumber: val);
                    },
                    // controller: numberCTLR,
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
                          color: AppColors.black,
                        ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomTextField(
                    keyboardType: TextInputType.number,
                    // controller: pincodeCTLR,
                    hint: "Enter the pin code",
                    hintcolor: AppColors.grey,
                    onchaged: (val) {
                      customerVm.addCstAddressUtilModelData(pincode: val);
                      // dashboardVM.setReviewMsg(val);
                    },
                    validator: UtilFunctions.validatepincode,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "City",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          height: 1.7,
                          color: AppColors.black,
                        ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomTextField(
                    // controller: pincodeCTLR,
                    hint: "Enter the City",
                    hintcolor: AppColors.grey,
                    onchaged: (val) {
                      customerVm.addCstAddressUtilModelData(city: val);
                      // dashboardVM.setReviewMsg(val);
                    },
                    validator: UtilFunctions.requiredField,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "State",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          height: 1.7,
                          color: AppColors.black,
                        ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomTextField(
                    // controller: pincodeCTLR,
                    hint: "Enter your state",
                    hintcolor: AppColors.grey,
                    onchaged: (val) {
                      customerVm.addCstAddressUtilModelData(state: val);
                      // dashboardVM.setReviewMsg(val);
                    },
                    validator: UtilFunctions.requiredField,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Country",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          height: 1.7,
                          color: AppColors.black,
                        ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomTextField(
                    // controller: pincodeCTLR,
                    hint: "India",
                    hintcolor: AppColors.grey, enabled: false,
                    onchaged: (val) {
                      customerVm.addCstAddressUtilModelData(country: "India");
                      // dashboardVM.setReviewMsg(val);
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "AddressLine 1",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          height: 1.7,
                          color: AppColors.black,
                        ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomTextField(
                    // controller: addressCTLR,
                    hint: "Enter the Address1",
                    hintcolor: AppColors.grey,
                    maxLines: 4,
                    onchaged: (val) {
                      customerVm.addCstAddressUtilModelData(address1: val);
                      // dashboardVM.setReviewMsg(val);
                    },
                    validator: UtilFunctions.validateAddress,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "AddressLine 2",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          height: 1.7,
                          color: AppColors.black,
                        ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomTextField(
                    // controller: addressCTLR,
                    hint: "Enter the Address 2",
                    hintcolor: AppColors.grey,
                    maxLines: 4,
                    onchaged: (val) {
                      log(val.toString());
                      customerVm.addCstAddressUtilModelData(address2: val);
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
                          color: AppColors.black,
                        ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Consumer<CustomerViewmodel>(builder: (context, csv, _) {
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
                                    onImagePicked: (XFile? image) {
                                      customerVm
                                          .uploadDocument(
                                              File(image?.path ?? ""))
                                          .then((val) {
                                        if (val?.message?.fileUrl != null) {
                                          customerVm.addCustomerUtilModelData(
                                              image: val?.message?.fileUrl);
                                        } else {
                                          toast("failed to  upload document ",
                                              context);
                                        }
                                      });
                                      //  commonVm.addCstAddressUtilModelData(city: val);
                                    },
                                  );
                                });
                          },
                          child: AbsorbPointer(
                            child: CustomTextField(
                              controller: TextEditingController(
                                  text: csv.pickedImage?.path ?? ""),
                              suffixIcon: const Icon(
                                Icons.camera_alt_outlined,
                                color: AppColors.secondaryColor,
                              ),
                              hint: "Take a picture",
                              hintcolor: AppColors.grey,
                              onchaged: (val) {},
                              // validator: UtilFunctions.requiredField,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        csv.pickedImage != null
                            ? Stack(
                                children: [
                                  Image.file(
                                    File(csv.pickedImage!.path),
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
                                        customerVm
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
                        log(customerVm.cstAddressUtilModel.toString());
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) =>
                        //           const CustomerDetailScreen(),
                        //     ));
                        if (customerVm.formKey.currentState!.validate()) {
                          UtilFunctions.loaderPopup(context);

                          customerVm
                              .createCustomer(
                                  utilModel: customerVm.customerUtilModel)
                              .then((value) {
                            if (value) {
                              customerVm
                                  .createAddress(
                                      name: customerVm.customerData?.name,
                                      addrssutilModel:
                                          customerVm.cstAddressUtilModel)
                                  .then((value) {
                                Navigator.of(context).pop();
                                if (value) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            CustomerDetailScreen(
                                          customerName: customerVm
                                                  .customerData?.name
                                                  .toString() ??
                                              "",
                                        ),
                                      ));
                                  customerVm.clearCustomerForm();
                                } else {
                                  Navigator.of(context).pop();

                                  toast(customerVm.errormsg, context);
                                }
                              });
                            } else {
                              Navigator.of(context).pop();

                              toast(customerVm.errormsg, context);
                            }
                          });
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
}
