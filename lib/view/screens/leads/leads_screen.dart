import 'package:flutter/material.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/view/screens/common_widgets/custom_appbarnew.dart';
import 'package:madathil/view/screens/leads/lead_creation.dart';
import 'package:madathil/view/screens/leads/lead_details.dart';

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
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const LeadCreationScreen()))),
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

class OwnLeads extends StatelessWidget {
  const OwnLeads({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const LeadDetailScreen()));
      },
      child: Column(
        children: [
          SizedBox(
            height: 46,
            child: TextField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: 30),
                suffixIcon: Container(
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: AppColors.primeryColor),
                    child: const Icon(Icons.search, color: Colors.white)),
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
          ListView.builder(
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (context, index) =>
                const LeadListItem(status: "active"),
          )
        ],
      ),
    );
  }
}

class OtherLeads extends StatelessWidget {
  const OtherLeads({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const LeadDetailScreen()));
      },
      child: Column(
        children: [
          SizedBox(
            height: 46,
            child: TextField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: 30),
                suffixIcon: Container(
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: AppColors.primeryColor),
                    child: const Icon(Icons.search, color: Colors.white)),
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
          ListView.builder(
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (context, index) =>
                const LeadListItem(status: "inactive"),
          )
        ],
      ),
    );
  }
}

class LeadListItem extends StatelessWidget {
  final String? status;
  const LeadListItem({super.key, this.status});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none),
        elevation: 5,
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.primeryColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "User Name",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: AppColors.primeryColor,
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "Address: user address",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.primeryColor,
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "Phone: +91 987654321",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.primeryColor,
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "Created: 25-Sept-2024 ",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.primeryColor,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Container(
                  color: status?.toLowerCase() == 'active'
                      ? AppColors.green
                      : AppColors.red,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        status?.toLowerCase() == 'active'
                            ? "Active"
                            : "InActive",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: AppColors.white)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
