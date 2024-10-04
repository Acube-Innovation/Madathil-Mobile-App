import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/view/screens/common_widgets/custom_appbarnew.dart';
import 'package:madathil/view/screens/employee/widgets/employee_item.dart';
import 'package:madathil/viewmodel/common_viewmodel.dart';
import 'package:provider/provider.dart';

class EmployeeListScreen extends StatelessWidget {
  const EmployeeListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final commonVm = Provider.of<CommonDataViewmodel>(context, listen: false);
    return Scaffold(
      appBar: const CustomAppBar(title: "Employee List"),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(
              height: 46,
              child: Consumer<CommonDataViewmodel>(builder: (ctx, cdv, _) {
                return TextField(
                  controller: commonVm.employeesearchController,
                  onChanged: (val) {
                    log(val);
                  },
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(left: 30),
                    suffixIcon: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.primeryColor,
                        ),
                        child: cdv.employeeSearchfn != null
                            ? GestureDetector(
                                onTap: () {
                                  commonVm.clearEmployeeSearchVal();
                                  commonVm.resetEmployeePagination();
                                  commonVm.fetchEmployeeList();
                                },
                                child: const Icon(
                                  Icons.clear,
                                  color: Colors.white,
                                ),
                              )
                            : GestureDetector(
                                onTap: () {
                                  commonVm.setEmployeeSearchValue(
                                      commonVm.employeesearchController.text);
                                  commonVm.resetEmployeePagination();
                                  commonVm.fetchEmployeeList();
                                },
                                child: const Icon(
                                  Icons.search,
                                  color: Colors.white,
                                ),
                              )),
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
                );
              }),
            ),
            const SizedBox(
              height: 15,
            ),
            const Expanded(child: EmployeeItem())
          ],
        ),
      ),
    );
  }
}
