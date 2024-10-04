import 'package:flutter/material.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/utils/custom_loader.dart';
import 'package:madathil/utils/no_data_found.dart';
import 'package:madathil/view/screens/leads/components/lead_list_item.dart';
import 'package:madathil/view/screens/leads/lead_details.dart';
import 'package:madathil/viewmodel/leads_viewmodel.dart';
import 'package:provider/provider.dart';

class OwnLeads extends StatefulWidget {
  const OwnLeads({super.key});

  @override
  State<OwnLeads> createState() => _OwnLeadsState();
}

class _OwnLeadsState extends State<OwnLeads> {
  @override
  void didChangeDependencies() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<LeadsViewmodel>(context, listen: false)
          .resetleadsListOwnPagination();
      Provider.of<LeadsViewmodel>(context, listen: false).getLeadsListOwn();
    });
    super.didChangeDependencies();
  }

  TextEditingController? controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 46,
          child: TextField(
            controller: controller,
            onSubmitted: (value) {
              Provider.of<LeadsViewmodel>(context, listen: false)
                  .resetleadsListOwnPagination();
              Provider.of<LeadsViewmodel>(context, listen: false)
                  .getLeadsListOwn(searchTerm: value);
            },
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(left: 30),
              suffixIcon: InkWell(
                onTap: () {
                  Provider.of<LeadsViewmodel>(context, listen: false)
                      .resetleadsListOwnPagination();
                  Provider.of<LeadsViewmodel>(context, listen: false)
                      .getLeadsListOwn(searchTerm: controller?.text);
                },
                child: Container(
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: AppColors.primeryColor),
                    child: const Icon(Icons.search, color: Colors.white)),
              ),
              enabled: true,
              disabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                borderSide: BorderSide(color: AppColors.black),
              ),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
                borderSide: BorderSide(color: AppColors.grey, width: 1),
              ),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
                borderSide: BorderSide(color: AppColors.grey, width: 1),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
                borderSide: BorderSide(color: AppColors.primeryColor, width: 1),
              ),
              errorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
                borderSide: BorderSide(color: AppColors.red),
              ),
              hintText: "Search",
              counterText: "",
              hintStyle: const TextStyle(
                // fontFamily: "SF Pro Display",
                fontSize: 18,
                fontWeight: FontWeight.w400,
                height: 1.275,
                color: AppColors.grey,
              ),
            ),
          ),
        ),
        const SizedBox(height: 15),
        Expanded(
          child: Consumer<LeadsViewmodel>(builder: (context, lvm, _) {
            return RefreshIndicator(
              onRefresh: () async {
                controller?.clear();
                lvm.clearDates();
                lvm.resetleadsListOwnPagination();
                lvm.getLeadsListOwn();
              },
              child: (lvm.leadsListOwnList ?? []).isEmpty
                  ? NoDataFOund(
                      onRefresh: () {
                        controller?.clear();
                        lvm.clearDates();
                        lvm.resetleadsListOwnPagination();
                        lvm.getLeadsListOwn();
                      },
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: (lvm.leadsListOwnList ?? []).length,
                      itemBuilder: (context, index) {
                        if (index == (lvm.leadsListOwnList ?? []).length - 1) {
                          if (lvm.isLoadingleadsListOwnPagination) {
                            return const CustomLoader();
                          } else {
                            if (!lvm.reachedLastPageleadsListOwn) {
                              if (!lvm.isLoadingleadsListOwnPagination) {
                                lvm.getLeadsListOwn();
                              }
                              return const CustomLoader();
                            } else {
                              if (lvm.leadsListOwnList!.isEmpty) {
                                return NoDataFOund(
                                  onRefresh: () {
                                    controller?.clear();
                                    lvm.clearDates();
                                    lvm.resetleadsListOwnPagination();
                                    lvm.getLeadsListOwn();
                                  },
                                );
                              } else {
                                return const CustomLoader();
                              }
                            }
                          }
                        } else {
                          return InkWell(
                              onTap: () {
                                Provider.of<LeadsViewmodel>(context,
                                        listen: false)
                                    .getLeadsDetails(
                                        id: lvm.leadsListOwnList?[index].name);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LeadDetailScreen()));
                              },
                              child: LeadListItem(
                                  data: lvm.leadsListOwnList?[index]));
                        }
                      },
                    ),
            );
          }),
        )
      ],
    );
  }
}
