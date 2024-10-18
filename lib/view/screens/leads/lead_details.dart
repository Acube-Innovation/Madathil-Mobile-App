import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/utils/color/util_functions.dart';
import 'package:madathil/utils/custom_loader.dart';
import 'package:madathil/view/screens/common_widgets/custom_appbarnew.dart';
import 'package:madathil/view/screens/common_widgets/custom_buttons.dart';
import 'package:madathil/view/screens/common_widgets/custom_images.dart';
import 'package:madathil/view/screens/leads/components/custom_button_wit_icon.dart';
import 'package:madathil/view/screens/profile/widgets/detail_card.dart';
import 'package:madathil/viewmodel/leads_viewmodel.dart';
import 'package:open_file/open_file.dart';
import 'package:provider/provider.dart';

class LeadDetailScreen extends StatelessWidget {
  const LeadDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: AppColors.secondaryColor,
            ),
          ),
          title: "Lead Details"),
      body: Consumer<LeadsViewmodel>(builder: (context, lvm, _) {
        if (lvm.leadsDetails == null) {
          return const CustomLoader();
        }
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.secondaryColor,
                    ),
                    child: const Center(
                      child: CustomPngImage(
                        //TODO:
                        imageName: 'assets/images/user_account.png',
                        height: 50,
                        width: 50,
                        boxFit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    lvm.leadsDetails?.data?.leadName ?? "N/A",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          height: 1.7,
                          color: AppColors.black,
                        ),
                  ),
                ),
                Center(
                  child: Text(
                    lvm.leadsDetails?.data?.leadOwner ?? "N/A",
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          height: 1.7,
                          color: AppColors.grey,
                        ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    "Lead Details",
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          height: 1.7,
                          color: AppColors.grey,
                        ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                ProfileCards(
                  data: "Lead Source",
                  value: lvm.leadsDetails?.data?.ldSource ?? "N/A",
                  data2: "Lead Category",
                  value2: lvm.leadsDetails?.data?.leadCategory ?? "N/A",
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    "Contact Details",
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          height: 1.7,
                          color: AppColors.grey,
                        ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                ProfileCards(
                  data: "Contact Number",
                  value: lvm.leadsDetails?.data?.numberToBeContacted ?? "N/A",
                  data2: "Contact Email",
                  value2: lvm.leadsDetails?.data?.owner ?? "N/A",
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    "Identifiers",
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          height: 1.7,
                          color: AppColors.grey,
                        ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                ProfileCards(
                  data: "Aadhar Number",
                  //TODO:
                  value: lvm.leadsDetails?.data?.consumerNumber ?? "N/A",
                  data2: "Consumer Number",
                  value2: lvm.leadsDetails?.data?.consumerNumber ?? "N/A",
                ),
                const SizedBox(
                  height: 25,
                ),
                CustomButton(
                  text: "Order Product",
                  height: 60,
                  onPressed: () {},
                ),
                const SizedBox(
                  height: 15,
                ),
                lvm.leadsDetails?.data?.status == "Converted"
                    ? CustomButtonWithIcon(
                        icon: Icons.file_download_sharp,
                        color: AppColors.orange,
                        text: "Download Quotation",
                        height: 60,
                        onPressed: () async {
                          UtilFunctions.loaderPopup(context);

                          if (lvm.leadsDetails?.data?.name != null) {
                            await lvm
                                .getQuotationLead(
                                    leadId: lvm.leadsDetails?.data?.name)
                                .then((value) {

                                  Navigator.pop(context);
                              if (value) {
                                 UtilFunctions.loaderPopup(context);
                                lvm
                                    .getQuotationFile(
                                        quotationId:
                                            lvm.quotationLead?.first.name)
                                    .then((value) {
                                  Navigator.pop(context);
                                  if (value) {

                                     UtilFunctions.loaderPopup(context);
                                    //

                                    lvm
                                        .getQuotation(
                                            quotationPath: lvm.quotationLeadFile
                                                ?.first.fileUrl)
                                        .then((value) {
                                          Navigator.pop(context);
                                      if (value) {
                                        log("${lvm.file?.path.toLowerCase()}");

                                        OpenFile.open(lvm.file?.path);
                                      } else {
                                        toast(lvm.errormsg, context);
                                      }
                                    });
                                  } else {
                                    toast(lvm.errormsg, context);
                                  }
                                });
                              }
                            });
                          }
                        },
                      )
                    : const SizedBox()
              ],
            ),
          ),
        );
      }),
    );
  }
}
