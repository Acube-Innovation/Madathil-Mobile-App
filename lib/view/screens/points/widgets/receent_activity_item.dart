import 'package:flutter/material.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/view/screens/common_widgets/custom_images.dart';
import 'package:madathil/view/screens/points/points_details_screen.dart';

class ReceentActivityItem extends StatelessWidget {
  const ReceentActivityItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.separated(
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 10,
            );
          },
          itemCount: 3,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              child: GestureDetector(
                onTap: () {

                  Navigator.push(context, MaterialPageRoute(builder: (context) => PointsDetailsScreen()));
                  
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: AppColors.grey300,
                          blurRadius: 5.0,
                          offset: Offset(0, 3),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const CustomPngImage(
                              imageName: "assets/images/points_star.png",
                              boxFit: BoxFit.fitWidth,
                              width: 60,
                              height: 60,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("You Earned 100 points",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .copyWith(
                                            height: 0,
                                            color: AppColors.black,
                                            fontSize: 15, // Responsive font size
                                            fontWeight: FontWeight.bold)),
                                Text("By selling 4 solar panels",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .copyWith(
                                            height: 0,
                                            color: AppColors.black,
                                            fontSize: 12, // Responsive font size
                                            fontWeight: FontWeight.normal))
                              ],
                            )
                          ],
                        ),
                        Text("26 May 2022",
                            style:
                                Theme.of(context).textTheme.titleLarge!.copyWith(
                                    height: 0,
                                    color: AppColors.grey,
                                    fontSize: 10, // Responsive font size
                                    fontWeight: FontWeight.normal))
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
