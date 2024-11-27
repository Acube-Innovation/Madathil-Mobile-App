import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:madathil/model/model_class/api_response_model/lead_list_own_response.dart';
import 'package:madathil/utils/color/app_colors.dart';

class LeadListItem extends StatelessWidget {
  final LeadsListOwnList? data;
  const LeadListItem({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none),
        elevation: 5,
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.primeryColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data?.leadName ?? "N/A",
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: AppColors.primeryColor,
                            fontWeight: FontWeight.w400),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 5),
                      data?.companyName != null && data!.companyName!.isNotEmpty
                          ? Text(
                              "Organization: ${data?.companyName ?? ""}  ",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                      color: AppColors.primeryColor,
                                      fontWeight: FontWeight.w400),
                              overflow: TextOverflow.ellipsis,
                            )
                          : const SizedBox(),
                      const SizedBox(height: 5),
                      Text(
                        "Phone:  ${data?.numberToBeContacted ?? "N/A"}",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: AppColors.primeryColor,
                            fontWeight: FontWeight.w400),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "Created: ${DateFormat('dd MMM yyyy').format(DateTime.parse(data?.creation ?? "N/A"))}",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: AppColors.primeryColor,
                            fontWeight: FontWeight.w400),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Container(
                  color: data?.status?.toLowerCase() == 'active'
                      ? AppColors.green
                      : AppColors.red,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(data?.status ?? "N/A",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: AppColors.white)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
