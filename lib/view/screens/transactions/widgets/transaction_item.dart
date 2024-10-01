import 'package:flutter/material.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/view/screens/common_widgets/custom_images.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.primeryColor.withOpacity(0.3),
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const CustomPngImage(
                    imageName: 'assets/images/person_icon.png',
                    height: 60,
                    width: 60,
                  ),
                  const SizedBox(
                    width: 17,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Jhon',
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                    height: 1.7,
                                    color: AppColors.primeryColor,
                                  )),
                      const SizedBox(
                        height: 5,
                      ),
                      Text('10 Feb',
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.black,
                                  ))
                    ],
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('\$1000',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            height: 1.7,
                            color: AppColors.primeryColor,
                          )),
                  const SizedBox(
                    height: 5,
                  ),
                  Text('Solar Panel',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: AppColors.black,
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
