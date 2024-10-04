import 'package:flutter/material.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/utils/custom_loader.dart';
import 'package:madathil/utils/no_data_found.dart';
import 'package:madathil/view/screens/leads/components/lead_list_item.dart';
import 'package:madathil/view/screens/leads/lead_details.dart';
import 'package:madathil/viewmodel/leads_viewmodel.dart';
import 'package:provider/provider.dart';

class OtherLeads extends StatefulWidget {
  final String? employeeId;
  const OtherLeads({super.key, required this.employeeId});

  @override
  State<OtherLeads> createState() => _OtherLeadsState();
}

class _OtherLeadsState extends State<OtherLeads> {
  @override
  void didChangeDependencies() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<LeadsViewmodel>(context, listen: false)
          .resetleadsListOtherPagination();
      Provider.of<LeadsViewmodel>(context, listen: false)
          .getLeadsListOther(uderID: widget.employeeId ?? "");
    });
    super.didChangeDependencies();
  }

  TextEditingController? controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const LeadDetailScreen()));
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 46,
            child: TextField(
              controller: controller,
              onSubmitted: (value) {
                Provider.of<LeadsViewmodel>(context, listen: false)
                    .resetleadsListOtherPagination();
                Provider.of<LeadsViewmodel>(context, listen: false)
                    .getLeadsListOther(
                        searchTerm: value, uderID: widget.employeeId ?? "");
              },
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: 30),
                suffixIcon: InkWell(
                  onTap: () {
                    Provider.of<LeadsViewmodel>(context, listen: false)
                        .resetleadsListOtherPagination();
                    Provider.of<LeadsViewmodel>(context, listen: false)
                        .getLeadsListOther(
                            searchTerm: controller?.text ?? "",
                            uderID: widget.employeeId ?? "");
                  },
                  child: Container(
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.primeryColor),
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
                  borderSide:
                      BorderSide(color: AppColors.primeryColor, width: 1),
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
                  lvm.clearDates();
                  lvm.resetleadsListOtherPagination();
                  lvm.getLeadsListOther(uderID: widget.employeeId ?? "");
                },
                child: (lvm.leadsListOtherList ?? []).isEmpty
                    ? NoDataFOund(
                        onRefresh: () {
                          lvm.clearDates();
                          lvm.resetleadsListOtherPagination();
                          lvm.getLeadsListOther(
                              uderID: widget.employeeId ?? "");
                        },
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: (lvm.leadsListOtherList ?? []).length,
                        itemBuilder: (context, index) {
                          if (index ==
                              (lvm.leadsListOtherList ?? []).length - 1) {
                            if (lvm.isLoadingleadsListOtherPagination) {
                              return const CustomLoader();
                            } else {
                              if (!lvm.reachedLastPageleadsListOther) {
                                if (!lvm.isLoadingleadsListOtherPagination) {
                                  lvm.getLeadsListOther(
                                      uderID: widget.employeeId ?? "");
                                }
                                return const CustomLoader();
                              } else {
                                if (lvm.leadsListOtherList!.isEmpty) {
                                  return NoDataFOund(
                                    onRefresh: () {
                                      lvm.clearDates();
                                      lvm.resetleadsListOtherPagination();
                                      lvm.getLeadsListOther(
                                          uderID: widget.employeeId ?? "");
                                    },
                                  );
                                } else {
                                  return Container();
                                }
                              }
                            }
                          } else {
                            return LeadListItem(
                                data: lvm.leadsListOtherList?[index]);
                          }
                        },
                      ),
              );
            }),
          )
        ],
      ),
    );
  }
}
