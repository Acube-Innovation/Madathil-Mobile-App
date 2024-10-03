import 'package:flutter/material.dart';
import 'package:madathil/app_images.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/view/screens/Referal/referal_screen.dart';
import 'package:madathil/view/screens/attendance/attendance.dart';
import 'package:madathil/view/screens/call_management/call_list_screen.dart';
import 'package:madathil/view/screens/employee/employee_list_scree.dart';
import 'package:madathil/view/screens/homepage/components/drawer_widget.dart';
import 'package:madathil/view/screens/homepage/components/home_item_widget.dart';
import 'package:madathil/view/screens/leads/leads_screen.dart';
import 'package:madathil/view/screens/orders/orders_screen.dart';
import 'package:madathil/view/screens/payment_mode/payment_mode.dart';
import 'package:madathil/view/screens/products/product_list.dart';
import 'package:madathil/view/screens/profile/profile_screen.dart';
import 'package:madathil/view/screens/service_list/service_list.dart';
import 'package:madathil/view/screens/tasks/task_screen.dart';
import 'package:madathil/viewmodel/common_viewmodel.dart';
import 'package:madathil/viewmodel/task_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:madathil/view/screens/transactions/transaction_list.dart';
import 'package:madathil/view/screens/statments/closing_statements.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const DrawerWidget(),
        appBar: AppBar(
          title:
              Text("Hi, User!", style: Theme.of(context).textTheme.titleSmall),
          actions: [
            InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProfileScreen())),
              child: Padding(
                padding:
                    const EdgeInsets.only(right: 20.0, top: 10, bottom: 10),
                child: Image.asset(AppImages.userImage, height: 20),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: [
                getDashboardDetails("admin", context),
                const SizedBox(height: 10),
                getBody("admin", context),
              ],
            ),
          ),
        ));
  }

  getDashboardDetails(String? login, BuildContext context) {
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
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "10",
                    style: TextStyle(
                        color: AppColors.primaryLightColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                  ),
                  Text(
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
            const InkWell(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "8",
                    style: TextStyle(
                        color: AppColors.primaryLightColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                  ),
                  Text(
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
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "8",
                    style: TextStyle(
                        color: AppColors.primaryLightColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                  ),
                  Text(
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

  getBody(String? login, BuildContext context) {
    switch (login) {
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
                            builder: (context) =>
                                // const CallListScreen()
                                const PaymentModeScreen()));
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
                            builder: (context) => const ServiceList()));
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
                            builder: (context) =>
                                const EmployeeListScreen()));
                  },
                ),
               
              ],
            ),
          ],
        );
      default:
        return const SizedBox();
    }
  }
}
