import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:madathil/model/model_class/api_response_model/leads_detail_response.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/utils/color/util_functions.dart';
import 'package:madathil/utils/custom_loader.dart';
import 'package:madathil/utils/no_data_found.dart';
import 'package:madathil/view/screens/leads/components/custom_button_wit_icon.dart';
import 'package:madathil/viewmodel/leads_viewmodel.dart';
import 'package:open_file/open_file.dart';
import 'package:provider/provider.dart';

class QuoatationItem extends StatefulWidget {
  final LeadsDetailsData? data;
  const QuoatationItem({super.key, this.data});

  @override
  State<QuoatationItem> createState() => _QuoatationItemState();
}

class _QuoatationItemState extends State<QuoatationItem> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final lvm = Provider.of<LeadsViewmodel>(context, listen: false);

      lvm.getQuotationLead(leadId: widget.data?.name).then((value) {
        // if (value && lvm.quotationLead?.isNotEmpty == true) {
        //   lvm.getQuotationFile(quotationId: lvm.quotationLead!.first.name);
        // }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final localContext = context;

    return Consumer<LeadsViewmodel>(builder: (ctx, lvm, _) {
      if (lvm.isLoading) {
        return const CustomLoader();
      } else if ((lvm.quotationLead ?? []).isEmpty) {
        return const NoDataFOund();
      } else {
        return RefreshIndicator(
          onRefresh: () async {
            final lvm = Provider.of<LeadsViewmodel>(context, listen: false);

            lvm.getQuotationLead(leadId: widget.data?.name).then((value) {});
          },
          child: ListView.separated(
            separatorBuilder: (context, index) {
              return const SizedBox(height: 10); // Add spacing between items
            },
            itemCount: (lvm.quotationLead ?? []).length,
            itemBuilder: (context, index) {
              var item = lvm.quotationLead![index];
              return Padding(
                padding: const EdgeInsets.all(0),
                child: Card(
                  shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide:
                        BorderSide(color: AppColors.black.withOpacity(0.3)),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.grey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding:
                        const EdgeInsets.all(16), // Add padding for content
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.name ?? '',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(
                                  color: AppColors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                        ),
                          const SizedBox(height: 10),
                        Text(
                          item.fileName ?? 'N/A',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12),
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Dated: ${formatDate(item.creation)}',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12),
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 10),
                        CustomButtonWithIcon(
                          icon: Icons.file_download_sharp,
                          color: AppColors.orange,
                          text: "Download Quotation",
                          height: 40,
                          onPressed: () async {
                            UtilFunctions.loaderPopup(localContext);

                            if (lvm.quotationLead?.isNotEmpty == true) {
                              lvm
                                  .getQuotationFile(quotationId: item.name)
                                  .then((value) {
                                if (value) {
                                  lvm
                                      .getQuotation(
                                          quotationPath: lvm
                                              .quotationLeadFile?.first.fileUrl)
                                      .then((value) {
                                    if (mounted) Navigator.pop(localContext);

                                    if (value) {
                                      log("${lvm.file?.path.toLowerCase()}");

                                      OpenFile.open(lvm.file?.path);
                                    } else {
                                      toast(lvm.errormsg, context);
                                    }
                                  });
                                }
                              });
                            }
                          },
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      }
    });
  }
}

/// Helper function to get the day suffix
String getDaySuffix(int day) {
  if (day >= 11 && day <= 13) {
    return 'th';
  }
  switch (day % 10) {
    case 1:
      return 'st';
    case 2:
      return 'nd';
    case 3:
      return 'rd';
    default:
      return 'th';
  }
}

String formatDate(String? creationDate) {
  if (creationDate == null || creationDate.isEmpty) return "Invalid Date";

  try {
    // Parse the date string into a DateTime object
    final date = DateTime.parse(creationDate);

    // Format the day, month, and year
    final day = date.day;
    final suffix = getDaySuffix(day);
    final formattedMonth = DateFormat('MMM').format(date);
    final year = date.year;

    // Return the formatted date string
    return '$day$suffix $formattedMonth $year';
  } catch (e) {
    return "Invalid Date";
  }
}
