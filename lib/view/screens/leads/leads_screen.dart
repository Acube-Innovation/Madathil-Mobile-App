import 'package:custom_date_range_picker/custom_date_range_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/view/screens/common_widgets/custom_appbarnew.dart';
import 'package:madathil/view/screens/leads/components/other_leads.dart';
import 'package:madathil/view/screens/leads/components/own_leads.dart';
import 'package:madathil/view/screens/leads/lead_creation.dart';
import 'package:madathil/viewmodel/leads_viewmodel.dart';
import 'package:provider/provider.dart';

class LeadsScreen extends StatelessWidget {
  final bool? isOtherTask;
  final String? otherOwnerId;
  const LeadsScreen({super.key, this.isOtherTask = false, this.otherOwnerId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: !isOtherTask!
          ? FloatingActionButton(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              backgroundColor: AppColors.primeryColor,
              child: const Icon(Icons.add),
              onPressed: () {
                Provider.of<LeadsViewmodel>(context, listen: false)
                    .getLeadsSourceList();
                Provider.of<LeadsViewmodel>(context, listen: false)
                    .getLeadsCategoryDetails();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LeadCreationScreen()));
              })
          : null,
      appBar: CustomAppBar(
        title: "Leads",
        actions: [
          IconButton(
              onPressed: () {
                showCustomDateRangePicker(context,
                    dismissible: true,
                    minimumDate:
                        DateTime.now().subtract(const Duration(days: 365)),
                    maximumDate: DateTime.now(),
                    onApplyClick: (DateTime startDate, DateTime endDate) {
                  Provider.of<LeadsViewmodel>(context, listen: false)
                      .addFromToTime(
                          (DateFormat('dd MMM yyyy').format(startDate)),
                          (DateFormat('dd MMM yyyy').format(endDate)));
                  //api call
                  if (isOtherTask!) {
                    Provider.of<LeadsViewmodel>(context, listen: false)
                        .resetleadsListOtherPagination();
                    Provider.of<LeadsViewmodel>(context, listen: false)
                        .getLeadsListOther(uderID: otherOwnerId ?? "");
                  } else {
                    Provider.of<LeadsViewmodel>(context, listen: false)
                        .resetleadsListOwnPagination();
                    Provider.of<LeadsViewmodel>(context, listen: false)
                        .getLeadsListOwn();
                  }
                },
                    onCancelClick: () {},
                    backgroundColor: AppColors.white,
                    primaryColor: AppColors.secondaryColor);
              },
              icon: const Icon(Icons.calendar_month_rounded))
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: !isOtherTask!
              ? const OwnLeads()
              : OtherLeads(employeeId: otherOwnerId)),
    );
  }
}
