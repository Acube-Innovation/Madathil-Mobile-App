import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:madathil/app_images.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/view/screens/employee/employee_details.dart';

class EmployeeItem extends StatelessWidget {
  const EmployeeItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        separatorBuilder: (context, index) {
          return const SizedBox();
        },
        itemCount: 3,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: GestureDetector(
              onTap: () {

                Navigator.push(context, MaterialPageRoute(builder: (context) => const EmployeeDetails()));
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          // Left icon container
                          Center(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child:
                                Image.asset(AppImages.maleEmployee, width: 80),
                          )),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Ajith KR",
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
                                "Tele Caller",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      height: 0,
                                      fontSize: 13,
                                      color: AppColors.black.withOpacity(0.5),
                                    ),
                              ),
                              Text(
                                "HR EMP 1235",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      height: 0,
                                      fontSize: 13,
                                      color: AppColors.black.withOpacity(0.5),
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
        });
  }
}
