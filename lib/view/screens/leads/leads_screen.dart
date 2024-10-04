import 'package:custom_date_range_picker/custom_date_range_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/view/screens/common_widgets/custom_appbarnew.dart';
import 'package:madathil/view/screens/leads/components/own_leads.dart';
import 'package:madathil/view/screens/leads/lead_creation.dart';
import 'package:madathil/viewmodel/leads_viewmodel.dart';
import 'package:provider/provider.dart';

class LeadsScreen extends StatelessWidget {
  const LeadsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
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
          }),
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
                },
                    onCancelClick: () {},
                    backgroundColor: AppColors.white,
                    primaryColor: AppColors.secondaryColor);
              },
              icon: const Icon(Icons.calendar_month_rounded))
        ],
      ),
      body: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0), child: OwnLeads()),
    );
  }
}
