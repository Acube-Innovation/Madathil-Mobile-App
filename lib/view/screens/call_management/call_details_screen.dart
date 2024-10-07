import 'package:flutter/material.dart';
import 'package:madathil/model/model_class/api_response_model/call_details_response.dart';
import 'package:madathil/model/model_class/api_response_model/call_list_response.dart';
import 'package:madathil/utils/color/app_colors.dart';

import 'package:madathil/view/screens/common_widgets/custom_appbarnew.dart';
import 'package:madathil/viewmodel/call_viewmodel.dart';
import 'package:madathil/viewmodel/payment_viewmodel.dart';
import 'package:provider/provider.dart';

class CallDetailsScreen extends StatefulWidget {
  final CallListResponse? item;
  const CallDetailsScreen({super.key, this.item});

  @override
  State<CallDetailsScreen> createState() => _CallDetailsScreenState();
}

class _CallDetailsScreenState extends State<CallDetailsScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Provider.of<CallViewModel>(context, listen: false)
          .getCallDetails(callId: widget.item?.name);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final callVm = Provider.of<CallViewModel>(context, listen: false);
    var duration;
    return Scaffold(
      appBar: CustomAppBar(
        title: "Call Details",
        actions: [
          Padding(
            padding: const EdgeInsets.all(13.0),
            child: InkWell(
              onTap: () {},
              child: const Icon(Icons.mode_edit_outlined),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Consumer<CallViewModel>(builder: (context, cvm, _) {
          if (cvm.callDetails?.conversationDuration != null) {
            duration = callVm.formatTimeFromSeconds(
                cvm.callDetails!.conversationDuration as double);
          }
          return cvm.isLoading!
              ? const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.secondaryColor,
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            cvm.callDetails?.name ?? 'N/A',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                    height: 0,
                                    color: AppColors.black,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w400),
                          ),
                          Text(
                            cvm.callDetails?.calledDate ?? 'N/A',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                    height: 0,
                                    color: AppColors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      const Divider(
                        color: AppColors.black,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Customer Name",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                    height: 0,
                                    color: AppColors.grey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal),
                          ),
                          Text(
                            cvm.callDetails?.customer ?? 'N/A',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                    height: 0,
                                    color: AppColors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      if(cvm.callDetails?.conversationDuration != null)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Duration",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                    height: 0,
                                    color: AppColors.grey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal),
                          ),
                          Text(
                            duration ?? 'N/A',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                    height: 0,
                                    color: AppColors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400),
                          ),
                          const SizedBox(
                        height: 25,
                      ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Call Status",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                    height: 0,
                                    color: AppColors.grey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal),
                          ),
                          Text(
                            cvm.callDetails?.callStatus ?? 'N/A',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                    height: 0,
                                    color: AppColors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400),
                          ),
                          const SizedBox(
                        height: 25,
                      ),
                        ],
                      ),
                      
                      const Divider(
                        color: AppColors.black,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      if (cvm.callTracking!.isNotEmpty)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Points",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                    height: 0,
                                    color: AppColors.grey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          if (cvm.callTracking!.isNotEmpty)
                            ListView.builder(
                              shrinkWrap: true,
                              itemCount: cvm.callTracking?.length,
                              itemBuilder: (BuildContext context, int index) {
                                if (cvm.callTracking?[index]?.feedback !=
                                        null ||
                                    cvm.callTracking?[index]?.feedback != '') {
                                  return Text(
                                    '- ${cvm.callTracking?[index]?.feedback}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .copyWith(
                                            height: 0,
                                            color: AppColors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal),
                                  );
                                }
                              },
                            ),
                          const SizedBox(
                            height: 25,
                          ),
                          if (cvm.callTracking!.isNotEmpty)
                          const Divider(
                            color: AppColors.black,
                          ),
                          // const SizedBox(
                          //   height: 15,
                          // ),
                          // Text(
                          //   "Reminders",
                          //   style: Theme.of(context)
                          //       .textTheme
                          //       .titleLarge!
                          //       .copyWith(
                          //           height: 0,
                          //           color: AppColors.grey,
                          //           fontSize: 14,
                          //           fontWeight: FontWeight.normal),
                          // ),
                          // const SizedBox(
                          //   height: 10,
                          // ),
                          // Container(
                          //   decoration: BoxDecoration(
                          //       border: Border.all(color: AppColors.black),
                          //       borderRadius: BorderRadius.circular(6)),
                          //   child: Padding(
                          //     padding: const EdgeInsets.all(15.0),
                          //     child: Row(
                          //       mainAxisAlignment:
                          //           MainAxisAlignment.spaceBetween,
                          //       children: [
                          //         Text("24 Mar 2022 03:30 PM",
                          //             style: Theme.of(context)
                          //                 .textTheme
                          //                 .titleLarge!
                          //                 .copyWith(
                          //                     height: 0,
                          //                     color: AppColors.black,
                          //                     fontSize: 18,
                          //                     fontWeight: FontWeight.w400)),
                          //         const Icon(Icons.notifications_outlined)
                          //       ],
                          //     ),
                          //   ),
                          // ),
                          // const SizedBox(
                          //   height: 15,
                          // ),
                          // Container(
                          //   decoration: BoxDecoration(
                          //       border: Border.all(color: AppColors.black),
                          //       borderRadius: BorderRadius.circular(6)),
                          //   child: Padding(
                          //     padding: const EdgeInsets.all(15.0),
                          //     child: Row(
                          //       mainAxisAlignment:
                          //           MainAxisAlignment.spaceBetween,
                          //       children: [
                          //         Text("25 Mar 2022 09:30 AM ",
                          //             style: Theme.of(context)
                          //                 .textTheme
                          //                 .titleLarge!
                          //                 .copyWith(
                          //                     height: 0,
                          //                     color: AppColors.black,
                          //                     fontSize: 18,
                          //                     fontWeight: FontWeight.w400)),
                          //         const Icon(Icons.notifications_outlined)
                          //       ],
                          //     ),
                          //   ),
                          // )
                        ],
                      ),
                    ],
                  ),
                );
        }),
      ),
    );
  }
}
