import 'package:flutter/material.dart';
import 'package:madathil/app_images.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/view/screens/common_widgets/custom_appbarnew.dart';
import 'package:madathil/view/screens/common_widgets/custom_buttons.dart';
import 'package:madathil/view/screens/common_widgets/custom_images.dart';
import 'package:madathil/view/screens/service_list/add_new_service.dart';
import 'package:madathil/view/screens/service_list/servce_detail.dart';

class ServiceList extends StatelessWidget {
  const ServiceList({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> item = [
      "AC Filter Cleaning",
      "Solar Panel Install",
      "TV Servicing",
      "Plumbing"
    ];
    return Scaffold(
      backgroundColor: AppColors.screenBgColor,
      appBar: const CustomAppBar(
        title: "Service List",
        bgcolor: AppColors.screenBgColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            SizedBox(
              height: 46,
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(left: 30),
                  suffixIcon: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.primeryColor,
                      ),
                      child: const Icon(
                        Icons.search,
                        color: Colors.white,
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
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
                child: ListView.separated(
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 10,
                );
              },
              itemCount: item.length,
              itemBuilder: (context, index) {
                var service = item[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ServiceDetail()));
                  },
                  child: Card(
                    elevation: 2,
                    shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadiusDirectional.all(Radius.circular(10))),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColors.primeryColor),
                            child: const CustomPngImage(
                              height: 40,
                              width: 40,
                              imageName: AppImages.serviceIcon,
                              boxFit: BoxFit.contain,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            service,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(color: AppColors.primeryColor),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ))
          ],
        ),
      ),
      floatingActionButton: CustomButton(
        height: 50,
        width: 40,
        child: const Icon(
          Icons.add,
          color: AppColors.white,
        ),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddService()));
        },
      ),
    );
  }
}
