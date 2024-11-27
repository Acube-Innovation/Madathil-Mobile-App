import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:madathil/model/model_class/api_response_model/leads_detail_response.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/view/screens/common_widgets/custom_appbarnew.dart';
import 'package:madathil/view/screens/common_widgets/custom_images.dart';
import 'package:madathil/view/screens/leads/add_addres_screen.dart';
import 'package:madathil/view/screens/leads/add_follow_up_screen.dart';
import 'package:madathil/view/screens/leads/components/follow_up_item.dart';

class FollowUpListScreen extends StatelessWidget {
  final LeadsDetailsData? data;
  final LeadTracking? tracking;
  const FollowUpListScreen({super.key, this.data, this.tracking});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Follow Up"),
        floatingActionButton: FloatingActionButton(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15))),
          backgroundColor: AppColors.primeryColor,
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AddFollowUpScreen(
                      data: data,
                         
                        )));
          }),
      body: Column(children: [

          Center(
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.secondaryColor,
                    ),
                    child: const Center(
                      child: CustomPngImage(
                        //TODO:
                        imageName: 'assets/images/user_account.png',
                        height: 50,
                        width: 50,
                        boxFit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),

                      Center(
                  child: Text(
                    data?.leadName ?? "N/A",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          height: 1.7,
                          color: AppColors.black,
                        ),
                  ),
                ),
                Center(
                  child: Text(
                    data?.leadOwner ?? "N/A",
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          height: 1.7,
                          color: AppColors.grey,
                        ),
                  ),
                ),
                SizedBox(height: 15,),

                Padding(
                  padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Follow up",
                          style:
                              Theme.of(context).textTheme.labelMedium!.copyWith(
                                    height: 1.7,
                                    color: AppColors.grey,
                                  ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                         
                          },
                          child: Text(
                            "Back to Lead Details",
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(
                                    height: 1.7,
                                    color: AppColors.blue,
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal),
                          ),
                        )
                      ],
                    ),
                ),

                Expanded(child: FollowUpItem(data: data,))

                
      ],),
    );
  }
}