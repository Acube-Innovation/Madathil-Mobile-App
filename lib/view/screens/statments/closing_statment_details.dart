import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:madathil/app_images.dart';
import 'package:madathil/model/model_class/api_response_model/closing_statment_list_response.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/utils/color/util_functions.dart';
import 'package:madathil/view/screens/common_widgets/custom_appbarnew.dart';
import 'package:madathil/viewmodel/common_viewmodel.dart';
import 'package:provider/provider.dart';

class ClosingStatmentDetails extends StatefulWidget {
  final ClosingStatmentList? items;
  const ClosingStatmentDetails({super.key, this.items});

  @override
  State<ClosingStatmentDetails> createState() => _ClosingStatmentDetailsState();
}

class _ClosingStatmentDetailsState extends State<ClosingStatmentDetails> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Provider.of<CommonDataViewmodel>(context, listen: false)
          .getClosingStatmentDetails(closingId: widget.items?.name);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final commonVm = Provider.of<CommonDataViewmodel>(context, listen: false);
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
                        CircleAvatar(
                          backgroundColor: AppColors.primeryColor,
                          radius: 50,
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(AppImages.statementImage,
                                width: 60),
                          )),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Text(
                          cdv.closingStatment?.customerName ?? '',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  height: 0,
                                  color: AppColors.black,
                                  fontSize: 20),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Text(
                          "Close Amount",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  height: 0,
                                  color: AppColors.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal),
                        ),
                        Text(
                          "₹ ${cdv.closingStatment?.projectCost?.toDouble().round() ?? 0.0}",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  height: 1.3,
                                  color: AppColors.primeryColor,
                                  fontSize: 28),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          cdv.closingStatment?.closingDate != null
                              ? DateFormat('dd MMMM yyyy').format(
                                  DateTime.parse(
                                      cdv.closingStatment!.closingDate!))
                              : '',
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
                          height: 60,
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
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Mobile Number",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall!
                                              .copyWith(
                                                fontSize: 12,
                                                height: 0,
                                                color: AppColors.black
                                                    .withOpacity(0.5),
                                              ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          cdv.closingStatment?.mobileNumber
                                                  .toString() ??
                                              '',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge!
                                              .copyWith(
                                                  height: 0,
                                                  color: AppColors.black,
                                                  fontSize: 15),
                                        )
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          "Close Kw",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall!
                                              .copyWith(
                                                fontSize: 12,
                                                height: 0,
                                                color: AppColors.black
                                                    .withOpacity(0.5),
                                              ),
                                          textAlign: TextAlign.end,
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          cdv.closingStatment?.kw.toString() ??
                                              '',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge!
                                              .copyWith(
                                                  height: 0,
                                                  color: AppColors.black,
                                                  fontSize: 15),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Address",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall!
                                                .copyWith(
                                                  fontSize: 12,
                                                  height: 0,
                                                  color: AppColors.black
                                                      .withOpacity(0.5),
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 5,
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                      
                                            UtilFunctions.removeHtmlTags(cdv.closingStatment
                                                    ?.customerAddress ??
                                                '')
                                            ,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleLarge!
                                                .copyWith(
                                                    height: 0,
                                                    color: AppColors.black,
                                                    fontSize: 15),
                                          )
                                        ],
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          "Item margin",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall!
                                              .copyWith(
                                                fontSize: 12,
                                                height: 0,
                                                color: AppColors.black
                                                    .withOpacity(0.5),
                                              ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          '${cdv.closingStatment?.itemMargin?.toDouble().round() ?? 0.0}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge!
                                              .copyWith(
                                                  height: 0,
                                                  color: AppColors.black,
                                                  fontSize: 15),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Business",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall!
                                              .copyWith(
                                                fontSize: 12,
                                                height: 0,
                                                color: AppColors.black
                                                    .withOpacity(0.5),
                                              ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          cdv.closingStatment?.selectBusiness ??
                                              '',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge!
                                              .copyWith(
                                                  height: 0,
                                                  color: AppColors.black,
                                                  fontSize: 15),
                                        )
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall!
                                              .copyWith(
                                                height: 0,
                                                color: AppColors.black
                                                    .withOpacity(0.5),
                                              ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge!
                                              .copyWith(
                                                  height: 0,
                                                  color: AppColors.black,
                                                  fontSize: 15),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall!
                                              .copyWith(
                                                fontSize: 12,
                                                height: 0,
                                                color: AppColors.black
                                                    .withOpacity(0.5),
                                              ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge!
                                              .copyWith(
                                                  height: 0,
                                                  color: AppColors.black,
                                                  fontSize: 15),
                                        )
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall!
                                              .copyWith(
                                                height: 0,
                                                color: AppColors.black
                                                    .withOpacity(0.5),
                                              ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge!
                                              .copyWith(
                                                  height: 0,
                                                  color: AppColors.black,
                                                  fontSize: 15),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
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
