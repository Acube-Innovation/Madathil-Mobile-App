import 'package:flutter/material.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/view/screens/common_widgets/custom_appbarnew.dart';
import 'package:madathil/view/screens/common_widgets/custom_buttons.dart';
import 'package:madathil/view/screens/points/widgets/points_card.dart';

class ReferalScreen extends StatelessWidget {
  const ReferalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Referal"),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const PointsCard(points: "1240 pts"),
            const SizedBox(
              height: 35,
            ),
            Text("How to get points?",
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      height: 0,
                      fontSize: 16,
                      color: AppColors.black,
                    )),
            const SizedBox(
              height: 20,
            ),
            Text(
                "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen boo",
                textAlign: TextAlign.justify,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      height: 0,
                      fontSize: 12,
                      color: AppColors.black,
                    )),
            const SizedBox(
              height: 20,
            ),
            const Spacer(),
            CustomButton(
              color: AppColors.amber,
              height: 44,
              width: double.infinity,
              onPressed: () {},
              text: "VIEW POINT HISTORY",
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
              height: 44,
              width: double.infinity,
              onPressed: () {},
              text: "GET REFERRAL CODE",
            )
          ],
        ),
      ),
    );
  }
}
