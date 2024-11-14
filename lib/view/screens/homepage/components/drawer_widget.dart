import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:madathil/app_images.dart';
import 'package:madathil/constants.dart';
import 'package:madathil/model/services/api_service/api_urls.dart';
import 'package:madathil/utils/color/util_functions.dart';
import 'package:madathil/utils/custom_loader.dart';
import 'package:madathil/view/screens/Referal/referal_screen.dart';
import 'package:madathil/view/screens/attendance/attendance_history.dart';
import 'package:madathil/view/screens/login/login_screen.dart';
import 'package:madathil/view/screens/ongoing_transaction/ongoing_transaction_screen.dart';
import 'package:madathil/view/screens/payments/payments_list.dart';
import 'package:madathil/view/screens/points/customer_points_screen.dart';
import 'package:madathil/view/screens/profile/profile_screen.dart';
import 'package:madathil/view/screens/service/service_history_screen.dart';
import 'package:madathil/view/screens/orders/transactions_list_screen.dart';
import 'package:madathil/viewmodel/common_viewmodel.dart';
import 'package:provider/provider.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var cdv = Provider.of<CommonDataViewmodel>(context, listen: false);
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: cdv.homeDetailData == null
                ? const CustomLoader()
                : CircleAvatar(
                    radius: 60,
                    backgroundImage: cdv.homeDetailData?.message?.image !=
                                null &&
                            cdv.homeDetailData!.message!.image!.isNotEmpty
                        ? NetworkImage(
                            "${ApiUrls.kProdBaseURL}${cdv.homeDetailData?.message?.image}")
                        : const AssetImage(AppImages.userImage),
                  ),
          ),
          InkWell(
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ProfileScreen())),
            child: Text(
              cdv.homeDetailData?.message?.fullName ?? 'User Name',
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
              textAlign: TextAlign.center,
            ),
          ),
          Text(cdv.homeDetailData?.message?.roleProfile ?? "Designation",
              style:
                  const TextStyle(fontSize: 15, fontWeight: FontWeight.w300)),
          const SizedBox(height: 20),
          const Divider(indent: 20, endIndent: 20),
          const SizedBox(height: 20),
          drawerItem("My Profile", AppImages.profileImage, () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const ProfileScreen()),
            );
          }),
          const SizedBox(height: 20),
          drawerItem("Service History", AppImages.serviceHistoryImage, () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ServiceHistoryScreen()));
          }),
          const SizedBox(height: 20),
          // drawerItem("Attendance History", AppImages.attendancehistoryImage,
          //     () async {
          //   var cdv = Provider.of<CommonDataViewmodel>(context, listen: false);
          //   await cdv.clearAttendanceData();
          //   cdv.resetattendanceListPagination();
          //   cdv.getattendanceListOwn();
          //   Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //           builder: (context) => const AttendanceHistoryScreen()));
          // }),
          // const SizedBox(height: 20),
          drawerItem("Points", AppImages.pointsImage, () {
            Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context) => const CustomerPointsScreen()),
            );
          }),
          const SizedBox(height: 20),
          drawerItem("Referal", AppImages.referalImage, () {
            // Navigator.of(context).push(
            //   MaterialPageRoute(builder: (context) => const ReferalScreen()),
            // );

            toast("In progress, we will update you soon!", context);
          }),
          const SizedBox(height: 20),
          // drawerItem("Settings", AppImages.settingsImage, () {
          //   Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //           builder: (context) => const OrderTranscationList()));
          // }),
          //    drawerItem("Payments", AppImages.walletImage, () {
          //   Navigator.of(context).push(
          //     MaterialPageRoute(builder: (context) => const PaymentListScreen()),
          //   );
          // }),
          const SizedBox(height: 20),
          const Divider(indent: 20, endIndent: 20),
          const SizedBox(height: 20),
          drawerItem("Terms and Conditions", AppImages.termsImage, () {
            toast("In progress, we will update you soon!", context);
          }),
          const SizedBox(height: 20),
          drawerItem("Support", AppImages.supportImage, () {
            toast("In progress, we will update you soon!", context);
          }),
          const SizedBox(height: 20),
          drawerItem("Log Out", AppImages.logoutImage, () {
            cdv.appLogOut();
            log("$userEmail");
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const LoginScreen()));
          }),
        ],
      ),
    );
  }

  drawerItem(String? title, String? image, Function()? onTap) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(image ?? "", height: 25),
            const SizedBox(width: 25),
            Text(title ?? "",
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.w400)),
          ],
        ),
      ),
    );
  }
}
