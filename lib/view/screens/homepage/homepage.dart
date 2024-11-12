import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:madathil/app_images.dart';
import 'package:madathil/constants.dart';
import 'package:madathil/model/services/api_service/api_urls.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/utils/color/util_functions.dart';
import 'package:madathil/view/screens/Referal/referal_screen.dart';
import 'package:madathil/view/screens/attendance/attendance.dart';
import 'package:madathil/view/screens/call_management/call_list_screen.dart';
import 'package:madathil/view/screens/employee/employee_list_scree.dart';
import 'package:madathil/view/screens/homepage/components/drawer_widget.dart';
import 'package:madathil/view/screens/homepage/components/home_item_widget.dart';
import 'package:madathil/view/screens/leads/leads_screen.dart';
import 'package:madathil/view/screens/orders/orders_screen.dart';
import 'package:madathil/view/screens/products/product_list.dart';
import 'package:madathil/view/screens/profile/profile_screen.dart';
import 'package:madathil/view/screens/salary/salary_screen.dart';
import 'package:madathil/view/screens/service/service_history_screen.dart';
import 'package:madathil/view/screens/tasks/task_screen.dart';
import 'package:madathil/viewmodel/common_viewmodel.dart';
import 'package:madathil/viewmodel/leads_viewmodel.dart';
import 'package:madathil/viewmodel/task_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:madathil/view/screens/transactions/transaction_list.dart';
import 'package:madathil/view/screens/statments/closing_statements.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime preBackpress = DateTime.now();
    var data = Provider.of<CommonDataViewmodel>(context, listen: false).homeDetailData?.message;

    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        final timegap = DateTime.now().difference(preBackpress);
        final cantExit = timegap >= const Duration(seconds: 2);
        preBackpress = DateTime.now();
        if (cantExit) {
          toast('Press Back button again to Exit', context);
        } else {
          SystemNavigator.pop();
        }
      },
      child: Scaffold(
          drawer: const DrawerWidget(),
          appBar: AppBar(
            title: Text("Hi, ${data?.fullName ?? 'User!'}",
                style: Theme.of(context).textTheme.titleSmall),
            actions: [
              InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfileScreen())),
                child: Padding(
                  padding:
                      const EdgeInsets.only(right: 20.0, top: 10, bottom: 10),
                  child: Consumer<CommonDataViewmodel>(builder: (ctx, cdv, _) {
                    return CircleAvatar(
                      radius: 20,
                      backgroundImage: cdv.homeDetailData?.message?.image !=
                                  null &&
                              cdv.homeDetailData!.message!.image!.isNotEmpty
                          ? NetworkImage(
                              "${ApiUrls.kProdBaseURL}${cdv.homeDetailData?.message?.image}")
                          : const AssetImage(AppImages.userImage),
                    );
                  }),
                ),
              )
            ],
          ),
          body: Consumer<CommonDataViewmodel>(builder: (context, cdv, _) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: cdv.homeDetailData == null
                    ? const Center(child: CupertinoActivityIndicator())
                    : Column(
                        children: [
                          getDashboardDetails("admin", context, cdv),
                          const SizedBox(height: 10),
                          getBody(roleProfile ?? "admin", context, cdv),
                        ],
                      ),
              ),
            );
          })),
    );
  }

  getDashboardDetails(
      String? login, BuildContext context, CommonDataViewmodel cdv) {
    var data = cdv.homeDetailData?.message;
    return Card(
      elevation: 5,
      child: SizedBox(
        height: 120,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LeadsScreen())),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data?.openLeads.toString() ?? "",
                    style: const TextStyle(
                        color: AppColors.primaryLightColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                  ),
                  const Text(
                    "New Leads",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const VerticalDivider(endIndent: 50, indent: 50),
            InkWell(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data?.sales.toString() ?? "",
                    style: const TextStyle(
                        color: AppColors.primaryLightColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                  ),
                  const Text(
                    "Sales",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const VerticalDivider(endIndent: 50, indent: 50),
            InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ReferalScreen())),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data?.referralPoints.toString() ?? "",
                    style: const TextStyle(
                        color: AppColors.primaryLightColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                  ),
                  const Text(
                    "Reference Points",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  getBody(String? login, BuildContext context, CommonDataViewmodel cdv) {
    print(".................$roleProfile");
    switch (login) {
      case "Dealer":
        return const SizedBox();
      case "Service Staff":
        return const SizedBox();
      case "admin":
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                HomeItemWidget(
                  image: AppImages.attendaneImage,
                  title: "Attendance",
                  onTap: () {
                    Provider.of<CommonDataViewmodel>(context, listen: false)
                        .employeeCheckinList();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AttendancePage()));
                  },
                ),
                const SizedBox(width: 8),
                HomeItemWidget(
                  image: AppImages.leadsImage,
                  title: "Leads",
                  onTap: () {
                    Provider.of<LeadsViewmodel>(context, listen: false)
                        .clearDates();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LeadsScreen()));
                  },
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                HomeItemWidget(
                  image: AppImages.productsImage,
                  title: "Products",
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => const PrdoductList()),
                    );
                  },
                ),
                const SizedBox(width: 8),
                HomeItemWidget(
                  image: AppImages.ordersImage,
                  title: "Orders",
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const OrderHistory(),
                        ));
                  },
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                HomeItemWidget(
                  image: AppImages.transactionsImage,
                  title: "Transactions",
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TransactionList(),
                        ));
                  },
                ),
                const SizedBox(width: 8),
                HomeItemWidget(
                  image: AppImages.callListImage,
                  title: "Call List",
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CallListScreen()
                            // const PaymentModeScreen()
                            ));
                  },
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                HomeItemWidget(
                  image: AppImages.tasksImage,
                  title: "Tasks",
                  onTap: () {
                    Provider.of<TasksViewmodel>(context, listen: false)
                        .clearFilter();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TasksScreen()));
                  },
                ),
                const SizedBox(width: 8),
                HomeItemWidget(
                  image: AppImages.serviceListImage,
                  title: "Service List",
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const ServiceHistoryScreen()));
                  },
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                HomeItemWidget(
                  image: AppImages.statementsImage,
                  title: "Statements",
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const ClosingStatmentsListScreen()));
                  },
                ),
                const SizedBox(width: 8),
                HomeItemWidget(
                  image: AppImages.employeesImage,
                  title: "Employee List",
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const EmployeeListScreen()));
                  },
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                HomeItemWidget(
                  image: AppImages.salary,
                  title: "Salary",
                  onTap: () {
                    Provider.of<CommonDataViewmodel>(context, listen: false)
                        .clearDates();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SalaryScreen()));
                  },
                ),
                const SizedBox(width: 8),
                const Expanded(child: SizedBox())
              ],
            ),
          ],
        );
      default:
        return const SizedBox();
    }
  }
}
