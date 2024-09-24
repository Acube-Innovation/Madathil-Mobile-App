import 'package:flutter/material.dart';
import 'package:madathil/app_colors.dart';
import 'package:madathil/app_images.dart';
import 'package:madathil/view/screens/attendance/attendance.dart';
import 'package:madathil/view/screens/homepage/components/drawer_widget.dart';
import 'package:madathil/view/screens/homepage/components/home_item_widget.dart';
import 'package:madathil/view/screens/products/product_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const DrawerWidget(),
        appBar: AppBar(
          title: const Text(
            "Hi, User!",
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Image.asset(AppImages.userImage, height: 25),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: [
                getDashboardDetails("admin"),
                const SizedBox(height: 10),
                getBody("admin", context),
              ],
            ),
          ),
        ));
  }

  getDashboardDetails(String? login) {
    return const Card(
      elevation: 5,
      child: SizedBox(
        height: 120,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
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
            VerticalDivider(endIndent: 50, indent: 50),
            Column(
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
            VerticalDivider(endIndent: 50, indent: 50),
            Column(
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AttendancePage(),
                        ));
                  },
                ),
                const SizedBox(width: 8),
                HomeItemWidget(
                  image: AppImages.leadsImage,
                  title: "Leads",
                  onTap: () {},
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
                  onTap: () {},
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                HomeItemWidget(
                  image: AppImages.transactionsImage,
                  title: "Transactions",
                  onTap: () {},
                ),
                const SizedBox(width: 8),
                HomeItemWidget(
                  image: AppImages.callListImage,
                  title: "Call List",
                  onTap: () {},
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                HomeItemWidget(
                  image: AppImages.tasksImage,
                  title: "Tasks",
                  onTap: () {},
                ),
                const SizedBox(width: 8),
                HomeItemWidget(
                  image: AppImages.serviceListImage,
                  title: "Service List",
                  onTap: () {},
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                HomeItemWidget(
                  image: AppImages.statementsImage,
                  title: "Statements",
                  onTap: () {},
                ),
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
