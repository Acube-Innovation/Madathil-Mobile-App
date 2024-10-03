import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:madathil/app_images.dart';
import 'package:madathil/model/model_class/api_response_model/employee_list_response.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/view/screens/attendance/attendance_history.dart';
import 'package:madathil/view/screens/common_widgets/custom_appbarnew.dart';
import 'package:madathil/view/screens/employee/lead_details.dart';
import 'package:madathil/view/screens/employee/widgets/details_button_widegt.dart';
import 'package:madathil/view/screens/employee/widgets/employee_details_card.dart';
import 'package:madathil/view/screens/leads/lead_details.dart';
import 'package:madathil/view/screens/profile/widgets/detail_card.dart';
import 'package:madathil/viewmodel/common_viewmodel.dart';
import 'package:provider/provider.dart';

class EmployeeDetails extends StatefulWidget {
  final Employees? item;
  const EmployeeDetails({super.key, this.item});

  @override
  State<EmployeeDetails> createState() => _EmployeeDetailsState();
}

class _EmployeeDetailsState extends State<EmployeeDetails> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<CommonDataViewmodel>(context, listen: false)
          .getEmployeeDetails(empId: widget.item?.name ?? '');
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: ""),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Consumer<CommonDataViewmodel>(builder: (ctx, cdv, _) {
            return cdv.isloading!
                ? const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.secondaryColor,
                    ),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                          child:
                              Image.asset(AppImages.maleEmployee, width: 120)),
                      const SizedBox(
                        height: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            cdv.employeeData?.employeeName ?? '',
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
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
                            cdv.employeeData?.designation ?? '',
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      height: 0,
                                      fontSize: 16,
                                      color: AppColors.black.withOpacity(0.5),
                                    ),
                          ),
                          Text(
                            cdv.employeeData?.name ?? '',
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
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
                      EmployeeDetailsCard(
                        data: "Contact Number",
                        value: cdv.employeeData?.cellNumber ?? '',
                        data2: "Contact Email",
                        value2: cdv.employeeData?.userId ?? '',
                        data3: "Address",
                        value3: cdv.employeeData?.permanentAddress ?? '',
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      DetailsButtonWidegt(
                        data: "Attendance Details",
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
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
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const LeadDetails();
                          }));
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      DetailsButtonWidegt(
                        data: "Task Details",
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const LeadDetails();
                          }));
                        },
                      )
                    ],
                  );
          }),
        ),
      ),
    );
  }
}
