import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:madathil/model/model_class/api_response_model/points_list_model_response.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/view/screens/common_widgets/custom_appbarnew.dart';
import 'package:madathil/view/screens/common_widgets/custom_images.dart';
import 'package:madathil/viewmodel/common_viewmodel.dart';
import 'package:provider/provider.dart';

class PointsDetailsScreen extends StatefulWidget {
  final ClosingStatements? pointsMessage;
  const PointsDetailsScreen({super.key, this.pointsMessage});

  @override
  State<PointsDetailsScreen> createState() => _PointsDetailsScreenState();
}

class _PointsDetailsScreenState extends State<PointsDetailsScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<CommonDataViewmodel>(context, listen: false)
          .getPointDetails(id: widget.pointsMessage?.name ?? '');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Details"),
      body: Consumer<CommonDataViewmodel>(builder: (ctx, cdv, _) {
        return cdv.isloading!
            ? const Center(
                child: CircularProgressIndicator(
                  color: AppColors.secondaryColor,
                ),
              )
            : SingleChildScrollView(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 60,
                        ),
                        const CustomPngImage(
                          imageName: "assets/images/point_detail_icon.png",
                          boxFit: BoxFit.fitWidth,
                          width: 130,
                          height: 130,
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Text(
                          "You earned points",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  height: 0,
                                  color: AppColors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          '+${cdv.pointDetailsMessage?.first.holderPoints?.toDouble().round() ?? 0}',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  height: 1.3,
                                  color: AppColors.green,
                                  fontSize: 28),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          cdv.pointDetailsMessage?.first.item ?? '',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  height: 0,
                                  color: AppColors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal),
                        ),
                        const SizedBox(
                          height: 90,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: AppColors.grey.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(12)),
                          child: Padding(
                            padding: const EdgeInsets.all(25),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Customer Name",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(
                                              height: 0,
                                              color: AppColors.grey,
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal),
                                    ),
                                    Text(
                                      cdv.pointDetailsMessage?.first.customerName ?? '',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(
                                              height: 0,
                                              color: AppColors.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w800),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Date",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(
                                              height: 0,
                                              color: AppColors.grey,
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal),
                                    ),
                                    Text(
                                       cdv.pointDetailsMessage?.first.closingDate != null
                                    ? DateFormat('dd MMM yyyy').format(
                                        DateTime.parse(
                                            cdv.pointDetailsMessage?.first.closingDate ?? ''))
                                    : '',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(
                                              height: 0,
                                              color: AppColors.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w800),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Project Cost",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(
                                              height: 0,
                                              color: AppColors.grey,
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal),
                                    ),
                                    Text(
                                      cdv.pointDetailsMessage?.first.projectCost.toString() ?? '',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(
                                              height: 0,
                                              color: AppColors.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w800),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Item",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(
                                              height: 0,
                                              color: AppColors.grey,
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal),
                                    ),
                                    Text(
                                      cdv.pointDetailsMessage?.first.item ?? 'N/A',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(
                                              height: 0,
                                              color: AppColors.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w800),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                // Row(
                                //   mainAxisAlignment:
                                //       MainAxisAlignment.spaceBetween,
                                //   children: [
                                //     Text(
                                //       "Product count",
                                //       style: Theme.of(context)
                                //           .textTheme
                                //           .titleMedium!
                                //           .copyWith(
                                //               height: 0,
                                //               color: AppColors.grey,
                                //               fontSize: 14,
                                //               fontWeight: FontWeight.normal),
                                //     ),
                                //     Text(
                                //       '4',
                                //       style: Theme.of(context)
                                //           .textTheme
                                //           .titleMedium!
                                //           .copyWith(
                                //               height: 0,
                                //               color: AppColors.black,
                                //               fontSize: 14,
                                //               fontWeight: FontWeight.w800),
                                //     )
                                //   ],
                                // )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
      }),
    );
  }
}
