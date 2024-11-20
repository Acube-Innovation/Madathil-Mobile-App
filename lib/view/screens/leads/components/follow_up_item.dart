import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:madathil/model/model_class/api_response_model/leads_detail_response.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/utils/custom_loader.dart';
import 'package:madathil/utils/no_data_found.dart';
import 'package:madathil/view/screens/common_widgets/custom_images.dart';
import 'package:madathil/viewmodel/leads_viewmodel.dart';
import 'package:provider/provider.dart';

class FollowUpItem extends StatefulWidget {
  final LeadsDetailsData? data;
  final List<LeadTracking>? tracking;
  const FollowUpItem({super.key, this.tracking, this.data});

  @override
  State<FollowUpItem> createState() => _FollowUpItemState();
}

class _FollowUpItemState extends State<FollowUpItem> {
  @override
  Widget build(BuildContext context) {
    return Consumer<LeadsViewmodel>(builder: (ctx, lvm, _) {
      if(lvm.isLoading){
        return CustomLoader();

      }
      if ((lvm.leadsDetails?.data?.leadTracking ?? []).isEmpty) {
        return NoDataFOund(
          onRefresh: () {
            WidgetsBinding.instance.addPostFrameCallback((_){
                Provider.of<LeadsViewmodel>(context, listen: false)
                .getLeadsDetails(id: widget.data?.name);

            });
          
          },
        );
      }
      return RefreshIndicator(
        onRefresh: () async{
            WidgetsBinding.instance.addPostFrameCallback((_){
                Provider.of<LeadsViewmodel>(context, listen: false)
                .getLeadsDetails(id: widget.data?.name);

            });
        },
        child: ListView.separated(
          separatorBuilder: (context, index) {
            return const SizedBox();
          },
          itemCount: (lvm.leadsDetails?.data?.leadTracking ?? []).length,
          itemBuilder: (context, index) {
            var item = lvm.leadsDetails?.data?.leadTracking![index];
        
            return Padding(
              padding: const EdgeInsets.fromLTRB(15, 8, 15, 0),
              child: Card(
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide:
                        BorderSide(color: AppColors.black.withOpacity(0.3))),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _formatDateAndTime(item?.dateAndTime),
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                        color: AppColors.primeryColor,
                                        fontWeight: FontWeight.w400),
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                item?.status ?? '',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                      color: _getStatusColor(item?.status),
                                      fontWeight: FontWeight.w400,
                                    ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 10,
                              ),
                              Text(
                                "Feedback: ${item?.feedback ?? "N/A"}",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                        color: AppColors.black,
                                        fontWeight: FontWeight.w400),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 10,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      );
    });
  }

  String _formatDateAndTime(String? dateTimeString) {
    if (dateTimeString == null || dateTimeString.isEmpty) {
      return ""; // Return an empty string if dateAndTime is null or empty
    }

    try {
      final DateTime parsedDate = DateTime.parse(dateTimeString);
      final String formattedDate =
          DateFormat('d MMM yyyy, h:mm a').format(parsedDate);
      return "Called on $formattedDate";
    } catch (e) {
      return ""; // Return an empty string in case of formatting errors
    }
  }

  Color _getStatusColor(String? status) {
    switch (status) {
      case "Fresh Lead":
        return Colors.green;
      case "Do Not Contact":
        return Colors.red;
      case "Call Back":
        return Colors.orange;
      case "Invalid Number":
        return Colors.grey;
      case "Rejected":
        return Colors.redAccent;
      case "Not Interested":
        return Colors.blue;
      case "Busy":
        return Colors.orange;
      case "No Response":
        return Colors.brown;
      case "Wrong Number":
        return Colors.purple;
      case "Replied":
        return Colors.teal;
      case "Opportunity":
        return Colors.cyan;
      case "Interested":
        return Colors.greenAccent;
      default:
        return Colors.black; // Default color for unknown statuses
    }
  }
}
