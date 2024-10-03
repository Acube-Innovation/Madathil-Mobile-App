import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:madathil/app_images.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/view/screens/attendance/attendance_history.dart';
import 'package:madathil/view/screens/common_widgets/custom_appbarnew.dart';
import 'package:madathil/view/screens/employee/lead_details.dart';
import 'package:madathil/view/screens/employee/widgets/details_button_widegt.dart';
import 'package:madathil/view/screens/employee/widgets/employee_details_card.dart';
import 'package:madathil/view/screens/leads/lead_details.dart';
import 'package:madathil/view/screens/profile/widgets/detail_card.dart';

class EmployeeDetails extends StatelessWidget {
  const EmployeeDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: ""),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(child: Image.asset(AppImages.maleEmployee, width: 120)),
              const SizedBox(
                height: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Ajith KR",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          height: 0,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColors.black,
                        ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Tele Caller",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          height: 0,
                          fontSize: 16,
                          color: AppColors.black.withOpacity(0.5),
                        ),
                  ),
                  Text(
                    "HR EMP 1235",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          height: 0,
                          fontSize: 12,
                          color: AppColors.black.withOpacity(0.5),
                        ),
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              const EmployeeDetailsCard(
                data: "Contact Number",
                value: "980100311",
                data2: "Contact Email",
                value2: "test@gmail.com",
                data3: "Address",
                value3: "Lane 2\nVidaya bahavan,\nVytilla",
              ),
              const SizedBox(
                height: 30,
              ),
              DetailsButtonWidegt(
                data: "Attendance Details",
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const AttendanceHistoryScreen();
                  }));
                },
              ),
              const SizedBox(
                height: 20,
              ),
              DetailsButtonWidegt(
                data: "Lead Details",
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const LeadDetails();
                  }));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
