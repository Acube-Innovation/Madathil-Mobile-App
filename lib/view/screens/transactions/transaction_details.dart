import 'package:flutter/material.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/view/screens/common_widgets/custom_appbarnew.dart';
import 'package:madathil/view/screens/common_widgets/custom_images.dart';

class TransactionDetails extends StatelessWidget {
  const TransactionDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.secondaryColor,
          ),
        ),
        title: 'Transaction Details',
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomPngImage(
                imageName: 'assets/images/person_icon.png',
                height: 130,
                width: 130,
              ),
              Text(
                'To Jhon',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      height: 1.7,
                      color: AppColors.primeryColor,
                    ),
              ),
              Text(
                '\$1000',
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      height: 1.7,
                      color: AppColors.primeryColor,
                    ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.check_circle,
                    color: AppColors.green,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Completed',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w500,
                          color: AppColors.black,
                        ),
                  ),
                ],
              ),
              Text(
                'Solar Panel',
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      height: 1.7,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black,
                    ),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                '12 Sep 2024, 01:35 PM',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.w500,
                      color: AppColors.black,
                    ),
              ),
              SizedBox(
                height: 60,
              ),
              Stack(
                children: [
                  Container(
                    height: 200,
                    width: 300,
                    padding: EdgeInsets.only(top: 70, bottom: 20, left: 5, right: 5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 6,
                              offset: const Offset(0, 3)),
                        ],
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Transaction ID',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.black,
                                    ),
                              ),
                              Text('098756447', style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.grey,
                                    ),),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'To',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.black,
                                    ),
                              ),
                              Text('Jhon', style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.grey,
                                    ),),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'From',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.black,
                                    ),
                              ),
                              Text('Harrytheman', style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.grey,
                                    ),),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                      top: 0,
                      child: Container(
                        height: 50,
                        width: 300,
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        decoration: BoxDecoration(
                            color: AppColors.secondaryColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        child: Text(
                          'SBI 12332',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.white,
                                  ),
                        ),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
