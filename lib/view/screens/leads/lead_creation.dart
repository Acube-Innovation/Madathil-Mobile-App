import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:madathil/utils/custom_loader.dart';
import 'package:madathil/utils/util_functions.dart';
import 'package:madathil/view/screens/common_widgets/custom_appbarnew.dart';
import 'package:madathil/view/screens/common_widgets/custom_buttons.dart';
import 'package:madathil/view/screens/common_widgets/custom_dropdown.dart';
import 'package:madathil/view/screens/common_widgets/custom_text_field.dart';
import 'package:madathil/view/screens/common_widgets/image_picker_bottom_sheet.dart';
import 'package:madathil/viewmodel/auth_viewmodel.dart';
import 'package:madathil/viewmodel/common_viewmodel.dart';
import 'package:madathil/viewmodel/leads_viewmodel.dart';
import 'package:provider/provider.dart';
import '../../../utils/color/app_colors.dart';

class LeadCreationScreen extends StatelessWidget {
  const LeadCreationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Controllers for each input field
    TextEditingController ldSourceCTLR = TextEditingController();
    TextEditingController ldNameCTLR = TextEditingController();
    TextEditingController ldCtgryCTLR = TextEditingController();
    TextEditingController cntNoCTLR = TextEditingController();
    TextEditingController cntEmailCTLR = TextEditingController();
    TextEditingController cnsmrNoCTLR = TextEditingController();
    TextEditingController adhrNoCTLR = TextEditingController();
    TextEditingController adrsCTLR = TextEditingController();
    TextEditingController cityCTLR = TextEditingController();

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
                  // Lead Source
                  Text(
                    "Lead Source",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          height: 1.7,
                          color: AppColors.grey,
                        ),
                  ),
                  const SizedBox(height: 5),
                  Consumer<LeadsViewmodel>(builder: (context, lvm, _) {
                    if (lvm.leadsSourceDetails != null &&
                        (lvm.leadsSourceDetails ?? []).isNotEmpty) {
                      return CustomDropdown(
                        hint: 'Select Lead Source',
                        items: lvm.leadsSourceDetails ?? [],
                        onChanged: (value) {
                          ldSourceCTLR.text = value ?? "";
                        },
                        validator: UtilFunctions.validateName,
                      );
                    }
                    return const CustomLoader();
                  }),
                  // CustomTextField(
                  //   onchaged: (val) {},
                  //   controller: ldSourceCTLR,
                  //   hint: 'Enter the lead source',
                  //   validator: UtilFunctions.validateName,
                  // ),
                  const SizedBox(height: 10),

                  // Lead Name
                  Text(
                    "Lead Name",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          height: 1.7,
                          color: AppColors.grey,
                        ),
                  ),
                  const SizedBox(height: 5),
                  CustomTextField(
                    onchaged: (val) {},
                    controller: ldNameCTLR,
                    hint: 'Enter the lead name',
                    validator: UtilFunctions.validateName,
                  ),
                  const SizedBox(height: 10),

                  // Lead Category
                  Text(
                    "Lead Category",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          height: 1.7,
                          color: AppColors.grey,
                        ),
                  ),
                  const SizedBox(height: 5),
                  const SizedBox(height: 5),
                  Consumer<LeadsViewmodel>(builder: (context, lvm, _) {
                    if (lvm.leadsCategoryDetails != null &&
                        (lvm.leadsCategoryDetails ?? []).isNotEmpty) {
                      return CustomDropdown(
                        hint: 'Select Lead Category',
                        items: lvm.leadsCategoryDetails ?? [],
                        onChanged: (value) {
                          ldCtgryCTLR.text = value ?? "";
                        },
                        validator: UtilFunctions.validateName,
                      );
                    }
                    return const CustomLoader();
                  }),
                  // CustomTextField(
                  //   onchaged: (val) {},
                  //   controller: ldCtgryCTLR,
                  //   hint: 'Select Lead Category',
                  //   validator: UtilFunctions.validateName,
                  // ),
                  const SizedBox(height: 10),
                  // Contact Number
                  Text(
                    "Contact Number",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          height: 1.7,
                          color: AppColors.grey,
                        ),
                  ),
                  const SizedBox(height: 5),
                  CustomTextField(
                    onchaged: (val) {},
                    controller: cntNoCTLR,
                    hint: 'Enter contact number',
                    validator: UtilFunctions.validateMobileNumber,
                  ),
                  const SizedBox(height: 10),

                  // Contact Email
                  Text(
                    "Contact Email",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          height: 1.7,
                          color: AppColors.grey,
                        ),
                  ),
                  const SizedBox(height: 5),
                  CustomTextField(
                    onchaged: (val) {},
                    controller: cntEmailCTLR,
                    hint: 'Enter contact email',
                    validator: UtilFunctions.validateEmail,
                  ),
                  const SizedBox(height: 10),

                  // Consumer Number
                  Text(
                    "Consumer Number",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          height: 1.7,
                          color: AppColors.grey,
                        ),
                  ),
                  const SizedBox(height: 5),
                  CustomTextField(
                    onchaged: (val) {},
                    controller: cnsmrNoCTLR,
                    hint: 'Enter the Consumer Number',
                    validator: UtilFunctions.validateConsumerNumber,
                  ),
                  const SizedBox(height: 10),

                  // Aadhar Number
                  Text(
                    "Aadhar Number",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          height: 1.7,
                          color: AppColors.grey,
                        ),
                  ),
                  const SizedBox(height: 5),
                  CustomTextField(
                    onchaged: (val) {},
                    controller: adhrNoCTLR,
                    hint: 'Enter the Aadhar number',
                    validator: UtilFunctions.validateAadhar,
                  ),
                  const SizedBox(height: 10),

                  // Address
                  Text(
                    "Address",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          height: 1.7,
                          color: AppColors.grey,
                        ),
                  ),
                  const SizedBox(height: 5),
                  CustomTextField(
                    onchaged: (val) {},
                    controller: adrsCTLR,
                    hint: 'Enter Address',
                    validator: UtilFunctions.validateName,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "City",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          height: 1.7,
                          color: AppColors.grey,
                        ),
                  ),
                  const SizedBox(height: 5),
                  CustomTextField(
                    onchaged: (val) {},
                    controller: cityCTLR,
                    hint: 'Enter City',
                    validator: UtilFunctions.validateName,
                  ),
                  const SizedBox(height: 10),

                  // Image of the lead
                  Text(
                    "Image of the lead",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          height: 1.7,
                          color: AppColors.grey,
                        ),
                  ),

                  Consumer<LeadsViewmodel>(builder: (context, lvm, _) {
                    return InkWell(
                      onTap: () {
                        showModalBottomSheet(
                            isDismissible: true,
                            isScrollControlled: true,
                            backgroundColor: Colors.white,
                            context: context,
                            builder: (BuildContext context) {
                              return ImagePickerBottomSheet1(
                                onImagePicked: (XFile? image) {
                                  lvm
                                      .uploadDocument(File(image?.path ?? ""))
                                      .then((val) {
                                    if (val?.message?.fileUrl != null) {
                                      lvm.addImage(val?.message?.fileUrl);
                                    } else {
                                      toast("failed to  upload document ",
                                          context);
                                    }
                                  });
                                },
                              );
                            });
                      },
                      child: CustomTextField(
                          onchaged: (val) {},
                          suffixIcon: const Icon(Icons.camera_alt_outlined,
                              color: AppColors.primeryColor),
                          enabled: false,
                          hint: lvm.leadCreationImage ??
                              'Select image of the lead',
                          validator: (val) {
                            return;
                          }),
                    );
                  }),
                  const SizedBox(height: 10),
                  // Add Lead Button
                  Consumer2<LeadsViewmodel, CommonDataViewmodel>(
                      builder: (context, lvm, cdv, _) {
                    return CustomButton(
                      text: "Add Lead",
                      height: 43,
                      width: double.maxFinite,
                      onPressed: () async {
                        if (authVm.formKey1.currentState!.validate()) {
                          UtilFunctions.loaderPopup(context);
                          await UtilFunctions()
                              .checkLocationPermission(context);
                          if (cdv.lat != null && cdv.long != null) {
                            lvm.createLead({
                              "lead_name": ldNameCTLR.text,
                              "ld_source": ldSourceCTLR.text,
                              "lead_category": ldCtgryCTLR.text,
                              "number_to_be_contacted": cntNoCTLR.text,
                              "email_id": cntEmailCTLR.text,
                              "consumer_number": cnsmrNoCTLR.text,
                              "aadhaar_number": adhrNoCTLR.text,
                              "image": lvm.leadCreationImage,
                              "latitude": cdv.lat,
                              "longitude": cdv.long
                            }).then(
                              (value) {
                                if (value) {
                                  // Handle lead addition logic
                                  lvm.createLeadAddress({
                                    "address_line1": adrsCTLR.text,
                                    "city": cityCTLR.text,
                                    "links": [
                                      {
                                        "link_doctype": "Lead",
                                        "link_name":
                                            lvm.leadCreationDetails ?? ""
                                      }
                                    ]
                                  }).then(
                                    (value) {
                                      toast(
                                          "Lead created successfully", context);
                                      Navigator.pop(context);
                                      Navigator.pop(context);
                                    },
                                  );
                                } else {
                                  toast(lvm.errormsg, context, isError: true);
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                }
                              },
                            );
                          }
                        } else {
                          // Handle validation failure
                          toast("Please check if all the fields are added",
                              context,
                              isError: true);
                        }
                      },
                    );
                  }),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
