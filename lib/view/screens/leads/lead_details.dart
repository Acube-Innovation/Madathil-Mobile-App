import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/utils/color/util_functions.dart';
import 'package:madathil/utils/custom_loader.dart';
import 'package:madathil/view/screens/common_widgets/custom_appbarnew.dart';
import 'package:madathil/view/screens/common_widgets/custom_buttons.dart';
import 'package:madathil/view/screens/common_widgets/custom_dropdown.dart';
import 'package:madathil/view/screens/common_widgets/custom_images.dart';
import 'package:madathil/view/screens/common_widgets/image_picker_bottom_sheet.dart';
import 'package:madathil/view/screens/employee/widgets/details_button_widegt.dart';
import 'package:madathil/view/screens/leads/addres_contact_screen.dart';
import 'package:madathil/view/screens/leads/components/assign_employee_widget.dart';
import 'package:madathil/view/screens/leads/components/custom_button_wit_icon.dart';
import 'package:madathil/view/screens/leads/components/employee_serachable_dropdown.dart';
import 'package:madathil/view/screens/leads/components/quotation_lst.dart';
import 'package:madathil/view/screens/leads/follow_up_list_screen.dart';
import 'package:madathil/view/screens/products/product_list.dart';
import 'package:madathil/view/screens/profile/widgets/detail_card.dart';
import 'package:madathil/view/screens/profile/widgets/detail_card_single.dart';
import 'package:madathil/viewmodel/leads_viewmodel.dart';
import 'package:open_file/open_file.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LeadDetailScreen extends StatelessWidget {
  const LeadDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String? employee;
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
        String? feedback;
        if (lvm.leadsDetails == null) {
          return const CustomLoader();
        }
        if (lvm.leadsDetails!.data!.leadTracking?.isNotEmpty ?? false) {
          if (lvm.leadsDetails!.data!.leadTracking?.length == 2) {
            if (RegExp('[a-zA-Z]').hasMatch(
                    lvm.leadsDetails!.data!.leadTracking![1].feedback!) &&
                !(lvm.leadsDetails!.data!.leadTracking![1].feedback!
                    .toLowerCase()
                    .contains('kw'))) {
              feedback = lvm.leadsDetails!.data!.leadTracking![1].feedback;
            }
          } else if (lvm.leadsDetails!.data!.leadTracking?.length == 1) {
            if (lvm.leadsDetails!.data!.leadTracking![0].feedback != null) {
              if (RegExp('[a-zA-Z]').hasMatch(
                      lvm.leadsDetails!.data!.leadTracking![0].feedback!) &&
                  !(lvm.leadsDetails!.data!.leadTracking![0].feedback!
                      .toLowerCase()
                      .contains('kw'))) {
                feedback = lvm.leadsDetails!.data!.leadTracking![0].feedback;
              }
            }
          }
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
                lvm.leadsDetails?.data?.comapnyName != null &&
                        lvm.leadsDetails!.data!.comapnyName!.isNotEmpty
                    ? Center(
                        child: Text(
                          lvm.leadsDetails?.data?.comapnyName ?? "N/A",
                          style:
                              Theme.of(context).textTheme.labelMedium!.copyWith(
                                    height: 1.7,
                                    color: AppColors.black,
                                  ),
                        ),
                      )
                    : const SizedBox(),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Lead Details",
                        style:
                            Theme.of(context).textTheme.labelMedium!.copyWith(
                                  height: 1.7,
                                  color: AppColors.grey,
                                ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddresContactScreen(
                                        data: lvm.leadsDetails?.data,
                                      )));
                        },
                        child: Text(
                          "Address and conatcts",
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .copyWith(
                                  height: 1.7,
                                  color: AppColors.blue,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                ProfileCards(
                  leadName: lvm.leadsDetails?.data?.leadName ?? "N/A",
                  data: "Source",
                  value: lvm.leadsDetails?.data?.ldSource ?? "N/A",
                  data2: "Category",
                  value2: lvm.leadsDetails?.data?.leadCategory ?? "N/A",
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Contact Details",
                        style:
                            Theme.of(context).textTheme.labelMedium!.copyWith(
                                  height: 1.7,
                                  color: AppColors.grey,
                                ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FollowUpListScreen(
                                        data: lvm.leadsDetails?.data,
                                      )));
                        },
                        child: Text(
                          "Follow up",
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .copyWith(
                                  height: 1.7,
                                  color: AppColors.blue,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                ProfileCards(
                  leadid: lvm.leadsDetails?.data?.name ?? "",
                  leadName: lvm.leadsDetails?.data?.leadName ?? "N/A",
                  data: "Number",
                  value: lvm.leadsDetails?.data?.numberToBeContacted ?? "N/A",
                  data2: "Email",
                  value2: lvm.leadsDetails?.data?.emailId ?? "N/A",
                ),
                const SizedBox(height: 10),
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

                const SizedBox(height: 5),
                ProfileCards(
                  leadName: lvm.leadsDetails?.data?.leadName ?? "N/A",
                  data: "Aadhar Number",
                  //TODO:
                  value: lvm.leadsDetails?.data?.consumerNumber ?? "N/A",
                  data2: "Consumer Number",
                  value2: lvm.leadsDetails?.data?.consumerNumber ?? "N/A",
                ),

                const SizedBox(
                  height: 5,
                ),

                const SizedBox(
                  height: 10,
                ),

                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.grey),
                      color: AppColors.grey.withOpacity(0.1)),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "KSEB bill ",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  height: 1.7,
                                  color: AppColors.black,
                                ),
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              log(lvm.billPicked.toString());

                              showModalBottomSheet(
                                  isDismissible: true,
                                  isScrollControlled: true,
                                  backgroundColor: Colors.white,
                                  context: context,
                                  builder: (BuildContext ctx) {
                                    return ImagePickerBottomSheet1(
                                      onImagePicked: (XFile? image) {
                                        UtilFunctions.loaderPopup(context);

                                        lvm
                                            .ksebBillupload(
                                                File(image?.path ?? ""),
                                                lvm.leadsDetails?.data?.name ??
                                                    "",
                                                lvm.leadsDetails?.data
                                                        ?.doctype ??
                                                    "")
                                            .then((val) {
                                          Navigator.pop(context);
                                          if (val != null) {
                                            Fluttertoast.showToast(
                                                gravity: ToastGravity.TOP,
                                                backgroundColor:
                                                    AppColors.green,
                                                msg: "uploaded success",
                                                toastLength: Toast.LENGTH_LONG);

                                            log("${val.toJson()}");
                                          } else {
                                            Fluttertoast.showToast(
                                                gravity: ToastGravity.TOP,
                                                backgroundColor: AppColors.red,
                                                msg:
                                                    "failed to  upload document ",
                                                toastLength: Toast.LENGTH_LONG);
                                            // toast("failed to  upload document ",
                                            //     context);
                                          }
                                        });
                                      },
                                    );
                                  });
                            },
                            child: SizedBox(
                              width: 60,
                              child: Text(
                                "Upload",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      height: 1.7,
                                      color: AppColors.blue,
                                    ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                if (feedback != null)
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Text(
                            "Feedback",
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(
                                  height: 1.7,
                                  color: AppColors.grey,
                                ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        ProfileCardSingle(
                            data: "Feedback",
                            //TODO

                            value: feedback),
                        const SizedBox(
                          height: 10,
                        ),
                      ]),

                //assigned to show only if assigned to someone and lead is not closed

                if (lvm.leadsDetails?.data?.status == "Lead" &&
                    lvm.leadsDetails?.data?.contactBy != null) ...{
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      "Assigned To",
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            height: 1.7,
                            color: AppColors.grey,
                          ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),

                  Row(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
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
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        lvm.leadsDetails?.data?.contactBy ?? "",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              height: 1.7,
                              color: AppColors.black,
                            ),
                      ),
                    ],
                  ),

                  // Container(
                  //   padding: const EdgeInsets.symmetric(
                  //       horizontal: 15, vertical: 15),
                  //   decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(20),
                  //       border: Border.all(color: Colors.grey),
                  //       color: AppColors.grey.withOpacity(0.1)),
                  //   child: Column(
                  //     children: [
                  //       Row(
                  //         children: [
                  //           Text(
                  //             lvm.leadsDetails?.data?.contactBy ?? "",
                  //             style: Theme.of(context)
                  //                 .textTheme
                  //                 .bodyMedium!
                  //                 .copyWith(
                  //                   height: 1.7,
                  //                   color: AppColors.black,
                  //                 ),
                  //           ),
                  //         ],
                  //       ),
                  //     ],
                  //   ),
                  // ),
                },
                const SizedBox(
                  height: 25,
                ),

                //assign button will be shown only if lead is not closed

                lvm.leadsDetails?.data?.status == "Lead"
                    ? AssignEmployeeWidget(
                        data: "Assign Employee",
                        onTap: () {
                          employee = null;

                          showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return Consumer<LeadsViewmodel>(
                                    builder: (context, tvm, _) {
                                  return Padding(
                                    padding: const EdgeInsets.all(30.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          'Select Employee',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge,
                                        ),
                                        const SizedBox(height: 20),
                                        EmployeeSearchableDropdown(
                                          hintText: "Select Employee to assign",
                                          onItemSelected: (selectedCustomer) {
                                            employee = selectedCustomer;
                                          },
                                        ),
                                        const SizedBox(height: 20),
                                        CustomButton(
                                          text: "UPDATE LEAD",
                                          height: 60,
                                          onPressed: () {
                                            if (employee != null) {
                                              UtilFunctions.loaderPopup(
                                                  context);

                                              Provider.of<LeadsViewmodel>(
                                                      context,
                                                      listen: false)
                                                  .assignEmployeeLead(
                                                      assignTo: employee,
                                                      leadId: lvm.leadsDetails
                                                          ?.data?.name)
                                                  .then((value) {
                                                Navigator.pop(context);

                                                if (value) {
                                                  Navigator.pop(context);

                                                  Provider.of<LeadsViewmodel>(
                                                          context,
                                                          listen: false)
                                                      .getLeadsDetails(
                                                          id: lvm.leadsDetails
                                                              ?.data?.name);

                                                  if (lvm.serverMessage !=
                                                      null) {
                                                    toast(
                                                        "Already in the assigned employee list",
                                                        context,
                                                        isError: true);
                                                  } else {
                                                    toast(
                                                        "Employee assigned succesfully",
                                                        context);
                                                  }
                                                } else {
                                                  Navigator.pop(context);
                                                  toast(
                                                      lvm.errormsg ??
                                                          'Something went wrong',
                                                      context,
                                                      isError: true);
                                                }
                                              });
                                            } else {
                                              Navigator.pop(context);

                                              toast("Please select employee",
                                                  context,
                                                  isError: true);
                                            }
                                          },
                                        )
                                      ],
                                    ),
                                  );
                                });
                              });
                        },
                      )
                    : const SizedBox(),
                const SizedBox(
                  height: 25,
                ),
                CustomButton(
                  text: "Order Product",
                  height: 60,
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => const PrdoductList()),
                    );
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                lvm.leadsDetails?.data?.status == "Converted"
                    ? CustomButtonWithIcon(
                        icon: Icons.file_download_sharp,
                        color: AppColors.orange,
                        text: "Download Quotations",
                        height: 60,
                        onPressed: () async {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => QuotationLst(
                                        data: lvm.leadsDetails?.data,
                                      )));
                          // UtilFunctions.loaderPopup(context);

                          // if (lvm.leadsDetails?.data?.name != null) {
                          //   await lvm
                          //       .getQuotationLead(
                          //           leadId: lvm.leadsDetails?.data?.name)
                          //       .then((value) {
                          //     Navigator.pop(context);
                          //     if (value) {
                          //       UtilFunctions.loaderPopup(context);
                          //       lvm
                          //           .getQuotationFile(
                          //               quotationId:
                          //                   lvm.quotationLead?.first.name)
                          //           .then((value) {
                          //         Navigator.pop(context);
                          //         if (value) {
                          //           UtilFunctions.loaderPopup(context);
                          //           //

                          //           lvm
                          //               .getQuotation(
                          //                   quotationPath: lvm.quotationLeadFile
                          //                       ?.first.fileUrl)
                          //               .then((value) {
                          //             Navigator.pop(context);
                          //             if (value) {
                          //               log("${lvm.file?.path.toLowerCase()}");

                          //               OpenFile.open(lvm.file?.path);
                          //             } else {
                          //               toast(lvm.errormsg, context);
                          //             }
                          //           });
                          //         } else {
                          //           toast(lvm.errormsg, context);
                          //         }
                          //       });
                          //     }
                          //   });
                          // }
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
