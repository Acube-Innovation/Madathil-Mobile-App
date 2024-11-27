import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:madathil/model/model_class/api_response_model/leads_detail_response.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/utils/custom_loader.dart';
import 'package:madathil/utils/no_data_found.dart';
import 'package:madathil/view/screens/common_widgets/custom_images.dart';
import 'package:madathil/view/screens/leads/add_addres_screen.dart';
import 'package:madathil/viewmodel/leads_viewmodel.dart';
import 'package:provider/provider.dart';

class AddressItem extends StatefulWidget {
  final LeadsDetailsData? data;
  const AddressItem({super.key, this.data});

  @override
  State<AddressItem> createState() => _AddressItemState();
}

class _AddressItemState extends State<AddressItem> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<LeadsViewmodel>(context, listen: false)
          .getAddressList(leadId: widget.data?.name);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LeadsViewmodel>(builder: (ctx, lvm, _) {
      if (lvm.isLoading) {
        return const Center(
          child: CustomLoader(),
        );
      } else if ((lvm.addressDetails ?? []).isEmpty) {
        return NoDataFOund(
          onRefresh: () async {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Provider.of<LeadsViewmodel>(context, listen: false)
                  .getAddressList(leadId: widget.data?.name);
            });
          },
        );
      } else {
        return RefreshIndicator(
          onRefresh: () async {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Provider.of<LeadsViewmodel>(context, listen: false)
                  .getAddressList(leadId: widget.data?.name);
            });
          },
          child: ListView.separated(
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 0,
              );
            },
            itemCount: (lvm.addressDetails ?? []).length,
            itemBuilder: (context, index) {
              var item = lvm.addressDetails![index];
              return Padding(
                padding: const EdgeInsets.all(10),
                child: Card(
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:
                          BorderSide(color: AppColors.black.withOpacity(0.3))),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddAddressScreen(
                                    isEdit: true,
                                    details: item,
                                    data: widget.data,
                                  )));
                    },
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
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        widget.data?.leadName ?? '',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge
                                            ?.copyWith(
                                                color: AppColors.primeryColor,
                                                fontWeight: FontWeight.w400),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        AddAddressScreen(
                                                          isEdit: true,
                                                          details: item,
                                                          data: widget.data,
                                                        )));
                                          },
                                          child: const Icon(
                                            Icons.edit,
                                            size: 18,
                                          ))
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    item.addressLine1 ?? "N/A",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                            color: AppColors.black,
                                            fontWeight: FontWeight.w400),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 10,
                                  ),
                                  Text(
                                    item.addressLine2 ?? "N/A",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                            color: AppColors.black,
                                            fontWeight: FontWeight.w400),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 10,
                                  ),
                                  Text(
                                    item.city ?? "N/A",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                            color: AppColors.black,
                                            fontWeight: FontWeight.w400),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 10,
                                  ),
                                  Text(
                                    item.state ?? "N/A",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                            color: AppColors.black,
                                            fontWeight: FontWeight.w400),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 10,
                                  ),
                                  Text(
                                    "PIN : ${item.pincode ?? "N/A"}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                            color: AppColors.black,
                                            fontWeight: FontWeight.w600),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
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
