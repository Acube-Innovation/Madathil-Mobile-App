import 'package:flutter/material.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/view/screens/common_widgets/custom_appbarnew.dart';
import 'package:madathil/view/screens/leads/components/other_leads.dart';
import 'package:madathil/view/screens/leads/components/own_leads.dart';
import 'package:madathil/view/screens/leads/lead_creation.dart';
import 'package:madathil/viewmodel/leads_viewmodel.dart';
import 'package:provider/provider.dart';

class LeadsScreen extends StatelessWidget {
  const LeadsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
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
        appBar: const CustomAppBar(title: "Leads"),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 40,
                child: TabBar(
                    dividerColor: Colors.transparent,
                    labelStyle: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: AppColors.primeryColor),
                    indicatorSize: TabBarIndicatorSize.tab,
                    labelColor: AppColors.primeryColor,
                    unselectedLabelColor: AppColors.primeryColor,
                    tabs: const [
                      Tab(text: 'Own'),
                      Tab(text: 'Others'),
                    ],
                    indicatorColor: AppColors.primeryColor),
              ),
              const SizedBox(height: 20),
              const Expanded(
                child: TabBarView(
                  children: [OwnLeads(), OtherLeads()],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
