import 'package:flutter/material.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/view/screens/common_widgets/custom_appbarnew.dart';

class ServiceDetailsScreen extends StatelessWidget {
  const ServiceDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Service Details",
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Fix a damaged \nwashing machine",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        height: 0,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.black,
                      )),
                      const SizedBox(height: 40,),
                      const Divider(color: AppColors.black,),
                      const SizedBox(height: 40,),

                      Text("Details",  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        height: 0,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.black,
                      )),
                      const SizedBox(height: 15,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        
                        children: [Text("ID", style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        height: 0,
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: AppColors.grey,
                      )), const SizedBox(width: 60,), Text("25842",  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        height: 0,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black,
                      ))],),
                       const SizedBox(height: 15,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text("Priority", style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        height: 0,
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: AppColors.grey,
                      )), const SizedBox(width: 60,), Text("HIGH",  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        height: 0,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black,
                      ))],),
                          const SizedBox(height: 15,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        
                        children: [Text("Date", style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        height: 0,
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: AppColors.grey,
                      )), const SizedBox(width: 60,), Text("22 May 2022",  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        height: 0,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black,
                      ))],),

                             const SizedBox(height: 15,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        
                        children: [Text("Status", style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        height: 0,
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: AppColors.grey,
                      )), const SizedBox(width: 60,), Text("COMPLETED",  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        height: 0,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black,
                      ))],),

                      const SizedBox(height: 40,),
                      const Divider(color: AppColors.black,),
                      const SizedBox(height: 40,),

                      Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(border: Border.all(color: AppColors.black.withOpacity(0.7)), borderRadius: BorderRadius.circular(4)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [Text("Remarks", style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        height: 0,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.black,
                      )),

                      const SizedBox(height: 15,),
                      
                       Text("The issue is fixed successfully, now it is perfect.", style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        height: 0,
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: AppColors.black,
                      ))],),
                      )

                     
            ],
          ),
        ),
      ),
    );
  }
}
