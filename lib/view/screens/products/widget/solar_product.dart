import 'package:flutter/material.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/view/screens/common_widgets/custom_images.dart';

class SolarProductList extends StatelessWidget {
  const SolarProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return const SizedBox();
      },
      itemCount: 2,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 10),
          child: Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.primeryColor),
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image and Text Column
                Expanded(
                  child: Row(
                    children: [
                      // Image Container
                      Container(
                        decoration: BoxDecoration(
                            color: AppColors.grey.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(10)),
                        padding: const EdgeInsets.all(5),
                        child: const CustomPngImage(
                          imageName: "assets/images/solar.png",
                          height: 160,
                          width: 114,
                          boxFit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(width: 10),
                      // Text Information
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Brand",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  height: 1.7,
                                  color: AppColors.grey,
                                ),
                          ),
                          Text(
                            "Solar Panel ",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  height: 1.7,
                                  color: AppColors.primeryColor,
                                ),
                          ),
                          Text(
                            "Size",
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      height: 1.7,
                                      color: AppColors.primeryColor,
                                    ),
                          ),
                          Text(
                            "1200*100 / 1350 *700",
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .copyWith(
                                  height: 1.7,
                                  color: AppColors.primeryColor,
                                ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                // Right side with Arrow and Text
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // Vertically centering the arrow icon
                    SizedBox(
                      height: 140, // Same height as the image
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.grey.withOpacity(0.1)),
                          child: const Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                    ),
                    // Text placed at the bottom right
                    Text(
                      "180022",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            height: 1.7,
                            color: AppColors.primeryColor,
                          ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}


// class SolarProductList extends StatelessWidget {
//   const SolarProductList({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ListView.separated(
//       separatorBuilder: (context, index) {
//         return const SizedBox();
//       },
//       itemCount: 2,
//       itemBuilder: (context, index) {
//         return Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 10),
//           child: Container(
//             padding: const EdgeInsets.all(5),
//             decoration: BoxDecoration(
//                 border: Border.all(color: AppColors.primeryColor),
//                 borderRadius: BorderRadius.circular(10)),
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Image and Text Column
//                 Expanded(
//                   child: Row(
//                     children: [
//                       // Image Container
//                       Container(
//                         decoration: BoxDecoration(
//                             color: AppColors.grey.withOpacity(0.1),
//                             borderRadius: BorderRadius.circular(10)),
//                         padding: const EdgeInsets.all(5),
//                         child: const CustomPngImage(
//                           imageName: "assets/images/solar.png",
//                           height: 140,
//                           width: 114,
//                           boxFit: BoxFit.contain,
//                         ),
//                       ),
//                       const SizedBox(width: 10),
//                       // Text Information
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             "Brand",
//                             style: Theme.of(context)
//                                 .textTheme
//                                 .bodyMedium!
//                                 .copyWith(
//                                   height: 1.7,
//                                   color: AppColors.grey,
//                                 ),
//                           ),
//                           Text(
//                             "Solar Panel ",
//                             style: Theme.of(context)
//                                 .textTheme
//                                 .titleLarge!
//                                 .copyWith(
//                                   height: 1.7,
//                                   color: AppColors.primeryColor,
//                                 ),
//                           ),
//                           Text(
//                             "Size",
//                             style:
//                                 Theme.of(context).textTheme.bodySmall!.copyWith(
//                                       height: 1.7,
//                                       color: AppColors.primeryColor,
//                                     ),
//                           ),
//                           Text(
//                             "1200*100 / 1350 *700",
//                             style: Theme.of(context)
//                                 .textTheme
//                                 .labelSmall!
//                                 .copyWith(
//                                   height: 1.7,
//                                   color: AppColors.primeryColor,
//                                 ),
//                           )
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//                 // Right side column (Arrow and Text)
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   children: [
//                     // Arrow placed at the center right
//                     Container(
//                       padding: const EdgeInsets.all(5),
//                       decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           color: AppColors.grey.withOpacity(0.1)),
//                       child: const Icon(Icons.arrow_forward_ios),
//                     ),
//                     const SizedBox(height: 80),
//                     // Text placed at the bottom right
//                     Text(
//                       "180022",
//                       style: Theme.of(context).textTheme.titleLarge!.copyWith(
//                             height: 1.7,
//                             color: AppColors.primeryColor,
//                           ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }



// class SolarProductList extends StatelessWidget {
//   const SolarProductList({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ListView.separated(
//       separatorBuilder: (context, index) {
//         return const SizedBox();
//       },
//       itemCount: 2,
//       itemBuilder: (context, index) {
//         return Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 10),
//           child: Container(
//             padding: const EdgeInsets.all(5),
//             decoration: BoxDecoration(
//                 border: Border.all(color: AppColors.primeryColor),
//                 borderRadius: BorderRadius.circular(10)),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Container(
//                   decoration: BoxDecoration(
//                       color: AppColors.grey.withOpacity(0.1),
//                       borderRadius: BorderRadius.circular(10)),
//                   padding: const EdgeInsets.all(5),
//                   child: const CustomPngImage(
//                     imageName: "assets/images/solar.png",
//                     height: 140,
//                     width: 114,
//                     boxFit: BoxFit.contain,
//                   ),
//                 ),
//                 const SizedBox(
//                   width: 10,
//                 ),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       "Brand",
//                       style: Theme.of(context).textTheme.bodyMedium!.copyWith(
//                             height: 1.7,
//                             color: AppColors.grey,
//                           ),
//                     ),
//                     Text(
//                       "Solar Panel ",
//                       style: Theme.of(context).textTheme.titleLarge!.copyWith(
//                             height: 1.7,
//                             color: AppColors.primeryColor,
//                           ),
//                     ),
//                     Text(
//                       "Size",
//                       style: Theme.of(context).textTheme.bodySmall!.copyWith(
//                             height: 1.7,
//                             color: AppColors.primeryColor,
//                           ),
//                     ),
//                     Text(
//                       "1200*100 / 1350 *700",
//                       style: Theme.of(context).textTheme.labelSmall!.copyWith(
//                             height: 1.7,
//                             color: AppColors.primeryColor,
//                           ),
//                     )
//                   ],
//                 ),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Container(
//                       padding: const EdgeInsets.all(5),
//                       decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           color: AppColors.grey.withOpacity(0.1)),
//                       child: const Icon(Icons.arrow_forward_ios),
//                     ),
//                     const SizedBox(
//                       height: 80,
//                     ),
//                     Text(
//                       "180022",
//                       style: Theme.of(context).textTheme.titleLarge!.copyWith(
//                             height: 1.7,
//                             color: AppColors.primeryColor,
//                           ),
//                     ),
//                   ],
//                 ),
//                 // Padding(
//                 //   padding: const EdgeInsets.only(top: 120),
//                 //   child:
//                 // ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
