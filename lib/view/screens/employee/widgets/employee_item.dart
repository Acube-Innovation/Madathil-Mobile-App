import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:madathil/app_images.dart';
import 'package:madathil/model/services/api_service/api_urls.dart';
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
          return NoDataFOund(
            onRefresh: () async {
              Provider.of<CommonDataViewmodel>(context, listen: false)
                  .resetEmployeePagination();
              Provider.of<CommonDataViewmodel>(context, listen: false)
                  .fetchEmployeeList();
            },
          );
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
                            return Center(child: NoDataFOund(
                              onRefresh: () {
                                Provider.of<CommonDataViewmodel>(context,
                                        listen: false)
                                    .resetEmployeePagination();
                                Provider.of<CommonDataViewmodel>(context,
                                        listen: false)
                                    .fetchEmployeeList();
                              },
                            ));
                          } else {
                            return const Column(
                              children: [
                                SizedBox(height: 200),
                                Center(
                                    child: Text(
                                  "No more Employees available.",
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
                                  // Left icon container with fixed size
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: CircleAvatar(
                                      radius: 30,
                                      backgroundImage: item.image != null &&
                                              item.image!.isNotEmpty
                                          ? NetworkImage(
                                              "${ApiUrls.kProdBaseURL}${item.image}")
                                          : const AssetImage(
                                              AppImages.maleEmployee),
                                    ),
                                  ),
                                  const SizedBox(
                                      width:
                                          10), // Spacing between avatar and text column

                                  // Expanded text column
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          item.employeeName ?? '',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall!
                                              .copyWith(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold,
                                                color: AppColors.black,
                                              ),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                        ),
                                        Text(
                                          item.designation ?? "",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall!
                                              .copyWith(
                                                fontSize: 13,
                                                color: AppColors.black
                                                    .withOpacity(0.5),
                                              ),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        ),
                                        Text(
                                          item.name ?? '',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall!
                                              .copyWith(
                                                fontSize: 13,
                                                color: AppColors.black
                                                    .withOpacity(0.5),
                                              ),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        )
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                      width:
                                          10), // Spacing between text column and arrow icon

                                  // Arrow icon with fixed size
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
