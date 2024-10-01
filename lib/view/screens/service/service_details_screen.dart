import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:madathil/model/model_class/api_response_model/service_history_list_response.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/view/screens/common_widgets/custom_appbarnew.dart';
import 'package:madathil/viewmodel/common_viewmodel.dart';
import 'package:provider/provider.dart';

class ServiceDetailsScreen extends StatefulWidget {
  final ServiceHistory? items;
  const ServiceDetailsScreen({super.key, this.items});

  @override
  State<ServiceDetailsScreen> createState() => _ServiceDetailsScreenState();
}

class _ServiceDetailsScreenState extends State<ServiceDetailsScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Provider.of<CommonDataViewmodel>(context, listen: false)
          .resetServiceDetails();
      Provider.of<CommonDataViewmodel>(context, listen: false)
          .getServiceHistoryDetails(serviecId: widget.items?.name);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Service Details",
      ),
      body: Consumer<CommonDataViewmodel>(builder: (ctx, cdv, _) {
        return cdv.isloading!
            ? const Center(
                child: CircularProgressIndicator(
                  color: AppColors.secondaryColor,
                ),
              )
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(cdv.servicePurpose?.purposes?.first.parenttype ?? '',
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    height: 0,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.black,
                                  )),
                      const SizedBox(
                        height: 40,
                      ),
                      const Divider(
                        color: AppColors.black,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Text("Details",
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    height: 0,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.black,
                                  )),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("ID",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    height: 0,
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: AppColors.grey,
                                  )),
                          const SizedBox(
                            width: 60,
                          ),
                          Text(cdv.servicePurpose!.name ?? '',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    height: 0,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.black,
                                  ))
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Customer name",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    height: 0,
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: AppColors.grey,
                                  )),
                          const SizedBox(
                            width: 60,
                          ),
                          Text(cdv.servicePurpose!.customer ?? '',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    height: 0,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.black,
                                  ))
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Address",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    height: 0,
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: AppColors.grey,
                                  )),
                          const SizedBox(
                            width: 60,
                          ),
                          Expanded(
                            child: Text(
                                cdv.servicePurpose!.addressDisplay ?? '',
                                textAlign: TextAlign.right,
                                maxLines: 5,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      height: 0,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.black,
                                    )),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Maintenece Type",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    height: 0,
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: AppColors.grey,
                                  )),
                          const SizedBox(
                            width: 60,
                          ),
                          Text(cdv.servicePurpose?.maintenanceType ?? '',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    height: 0,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.black,
                                  ))
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Date",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    height: 0,
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: AppColors.grey,
                                  )),
                          const SizedBox(
                            width: 60,
                          ),
                          Text(
                              cdv.servicePurpose?.mntcDate != null
                                  ? DateFormat('dd MMM yyyy').format(
                                      DateTime.parse(cdv
                                          .servicePurpose!.mntcDate
                                          .toString()))
                                  : '',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    height: 0,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.black,
                                  ))
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Status",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    height: 0,
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: AppColors.grey,
                                  )),
                          const SizedBox(
                            width: 60,
                          ),
                          Text(cdv.servicePurpose?.workCompletionStatus ?? '',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    height: 0,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.black,
                                  ))
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      const Divider(
                        color: AppColors.black,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      // Container(
                      //   padding: const EdgeInsets.all(15),
                      //   decoration: BoxDecoration(
                      //       border: Border.all(
                      //           color: AppColors.black.withOpacity(0.7)),
                      //       borderRadius: BorderRadius.circular(4)),
                      //   child: Column(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: [
                      //       Text("Remarks",
                      //           style: Theme.of(context)
                      //               .textTheme
                      //               .bodySmall!
                      //               .copyWith(
                      //                 height: 0,
                      //                 fontSize: 16,
                      //                 fontWeight: FontWeight.w600,
                      //                 color: AppColors.black,
                      //               )),
                      //       const SizedBox(
                      //         height: 15,
                      //       ),
                      //       Text(
                      //           "The issue is fixed successfully, now it is perfect.",
                      //           style: Theme.of(context)
                      //               .textTheme
                      //               .bodySmall!
                      //               .copyWith(
                      //                 height: 0,
                      //                 fontSize: 14,
                      //                 fontWeight: FontWeight.normal,
                      //                 color: AppColors.black,
                      //               ))
                      //     ],
                      //   ),
                      // )
                    ],
                  ),
                ),
              );
      }),
    );
  }
}
