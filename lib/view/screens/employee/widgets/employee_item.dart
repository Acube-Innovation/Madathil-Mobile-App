import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:madathil/app_images.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/utils/custom_loader.dart';
import 'package:madathil/utils/no_data_found.dart';
import 'package:madathil/view/screens/employee/employee_details.dart';
import 'package:madathil/viewmodel/common_viewmodel.dart';
import 'package:provider/provider.dart';

class EmployeeItem extends StatefulWidget {
  const EmployeeItem({super.key});

  @override
  State<EmployeeItem> createState() => _EmployeeItemState();
}

class _EmployeeItemState extends State<EmployeeItem> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<CommonDataViewmodel>(context, listen: false)
          .resetEmployeePagination();
      Provider.of<CommonDataViewmodel>(context, listen: false)
          .fetchEmployeeList();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CommonDataViewmodel>(builder: (ctx, cdv, _) {
      if ((cdv.employeePost ?? []).isEmpty) {
        if (cdv.isloading!) {
          return const CustomLoader();
        } else {
          return const NoDataFOund();
        }
      } else {
        return RefreshIndicator(
          color: AppColors.primeryColor,
          onRefresh: () async {
            Provider.of<CommonDataViewmodel>(context, listen: false)
                .resetEmployeePagination();
            Provider.of<CommonDataViewmodel>(context, listen: false)
                .fetchEmployeeList();
          },
          child: (cdv.employeePost ?? []).isEmpty
              ? const NoDataFOund()
              : ListView.separated(
                  separatorBuilder: (context, index) {
                    return const SizedBox();
                  },
                  itemCount: (cdv.employeePost ?? []).length + 1,
                  itemBuilder: (context, index) {
                    if (index == (cdv.employeePost ?? []).length) {
                      if (cdv.ispaginationemployee) {
                        return const SizedBox(
                            height: 30,
                            width: 30,
                            child: CupertinoActivityIndicator(
                                animating: true, radius: 15));
                      } else {
                        if (!cdv.employeeReachLength) {
                          if (!cdv.ispaginationemployee) {
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              cdv.fetchEmployeeList();
                            });
                            return const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(height: 5),
                                SizedBox(
                                    height: 30,
                                    width: 30,
                                    child: CupertinoActivityIndicator(
                                        animating: true, radius: 15))
                              ],
                            );
                          }
                        } else {
                          if (cdv.employeePost!.isEmpty) {
                            return const Center(
                                child: Text(
                              "No Service History available.",
                            ));
                          } else {
                            return const Column(
                              children: [
                                SizedBox(height: 200),
                                Center(
                                    child: Text(
                                  "No more Service History available.",
                                  style: TextStyle(color: Colors.grey),
                                )),
                              ],
                            );
                          }
                        }
                      }
                    } else {
                      var item = cdv.employeePost![index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EmployeeDetails(
                                          item: item,
                                        )));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: AppColors.grey.withOpacity(0.5),
                                    blurRadius: 5.0,
                                    offset: const Offset(0, 3)),
                              ],
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      // Left icon container
                                      Center(
                                          child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.asset(
                                            AppImages.maleEmployee,
                                            width: 70),
                                      )),

                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            item.employeeName ?? '',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall!
                                                .copyWith(
                                                  height: 0,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold,
                                                  color: AppColors.black,
                                                ),
                                          ),
                                          Text(
                                            item.designation ?? "",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall!
                                                .copyWith(
                                                  height: 0,
                                                  fontSize: 13,
                                                  color: AppColors.black
                                                      .withOpacity(0.5),
                                                ),
                                          ),
                                          Text(
                                            item.name ?? '',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall!
                                                .copyWith(
                                                  height: 0,
                                                  fontSize: 13,
                                                  color: AppColors.black
                                                      .withOpacity(0.5),
                                                ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  Image.asset(AppImages.arrow, width: 30),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                    return null;
                  }),
        );
      }
    });
  }
}
