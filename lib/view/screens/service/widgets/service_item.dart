import 'package:flutter/material.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/view/screens/service/service_details_screen.dart';

class ServiceItem extends StatelessWidget {
  const ServiceItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 10,
          );
        },
        itemCount: 3,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: GestureDetector(
              onTap: () {

                Navigator.push(context, MaterialPageRoute(builder: (context) => const ServiceDetailsScreen()));


                
              },
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(color: AppColors.primeryColor, borderRadius: BorderRadius.circular(12)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("25842",  style:
                                    Theme.of(context).textTheme.bodySmall!.copyWith(
                                          height: 0,
                                          fontSize: 14,
                                          color: AppColors.white,
                                        ),),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(color: AppColors.amber, borderRadius: BorderRadius.circular(50)),
                          child: Text("HIGH",style:
                                    Theme.of(context).textTheme.bodySmall!.copyWith(
                                          height: 0,
                                          fontSize: 12,
                                          color: AppColors.white,
                                        ), ),
                        )
                      ],
                    ),
              
                    const SizedBox(height: 10,),
                    Text("Fix a damaged \nwashing machine",style:
                                    Theme.of(context).textTheme.bodySmall!.copyWith(
                                          height: 0,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.white,
                                        ),),
                                        const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("22 May 2022",style:
                                    Theme.of(context).textTheme.bodySmall!.copyWith(
                                          height: 0,
                                          fontSize: 12,
                                          color: AppColors.white,
                                        ),),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(color: AppColors.green, borderRadius: BorderRadius.circular(50)),
                          child: Text("Completed",style:
                                    Theme.of(context).textTheme.bodySmall!.copyWith(
                                          height: 0,
                                          fontSize: 12,
                                          color: AppColors.white,
                                        ),),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
