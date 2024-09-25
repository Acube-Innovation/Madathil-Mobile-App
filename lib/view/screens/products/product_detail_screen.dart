import 'package:flutter/material.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/view/screens/cart/cart_screen.dart';
import 'package:madathil/view/screens/check_out/check_out_screen.dart';
import 'package:madathil/view/screens/common_widgets/custom_appbarnew.dart';
import 'package:madathil/view/screens/common_widgets/custom_buttons.dart';
import 'package:madathil/view/screens/common_widgets/custom_images.dart';
import 'package:madathil/viewmodel/common_viewmodel.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHight = MediaQuery.of(context).size.height * 0.6;
    final commonVm = Provider.of<CommonDataViewmodel>(context, listen: false);
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: CustomAppBar(
        bgcolor: AppColors.transparent,
        title: "Solar Panel",
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.secondaryColor,
          ),
        ),
      ),
      body: Consumer<CommonDataViewmodel>(builder: (context, cdv, _) {
        return Stack(
          children: [
            // Top part (Image with shadow)
            Column(
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(color: AppColors.bgColor
                      // boxShadow: [
                      //   BoxShadow(
                      //     color: Colors.black12,
                      //     spreadRadius: 5,
                      //     blurRadius: 20,
                      //     offset: Offset(0, 10), // changes position of shadow
                      //   ),
                      // ],
                      ),
                ),

                // Space before bottom content
                const SizedBox(height: 10),
              ],
            ),

            // Bottom rounded section
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: screenHight,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, -5),
                    ),
                  ],
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 30,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  // Brand information
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Brand",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(color: AppColors.grey)),
                                      Text("Madathil",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge!
                                              .copyWith(
                                                  color:
                                                      AppColors.primeryColor)),
                                    ],
                                  ),
                                  // Price information
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text("Price",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(color: AppColors.grey)),
                                      Text("\$150000",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge!
                                              .copyWith(
                                                  color: AppColors.black)),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text("Product Name",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          color: AppColors.grey, height: 1.7)),
                              Text("Solar Panel",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(
                                          color: AppColors.primeryColor,
                                          height: 1.7)),
                              Text("Size",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          color: AppColors.grey, height: 1.7)),
                              const SizedBox(
                                height: 5,
                              ),
                              SizedBox(
                                height: 30,
                                child: ListView.separated(
                                  separatorBuilder: (context, index) {
                                    return const SizedBox(
                                      width: 10,
                                    );
                                  },
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 2,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        commonVm.selectIndex(index);
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10,
                                        ),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color:
                                                    AppColors.secondaryColor),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: cdv.selectedIndex == index
                                                ? AppColors.secondaryColor
                                                : AppColors.white),
                                        child: Center(
                                          child: Text(
                                            "1200*100 ",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium!
                                                .copyWith(
                                                    color: AppColors.black,
                                                    height: 1.7),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text("Details",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          color: AppColors.grey, height: 1.7)),
                              Text(
                                "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen boo",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                        color: AppColors.black, height: 1.7),
                                maxLines: 4,
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                              Row(
                                children: [
                                  CustomButton(
                                    width: 200,
                                    text: "Buy Now",
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const CheckOutScreen(),
                                          ));
                                    },
                                  ),
                                  const Spacer(),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const CartScreen(),
                                          ));
                                    },
                                    child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 6),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: AppColors.white,
                                            border: Border.all(
                                                color: AppColors.primeryColor)),
                                        child: const CustomPngImage(
                                          imageName:
                                              'assets/images/Add_cart.png',
                                          boxFit: BoxFit.contain,
                                        )),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Positioned Image
            const Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: CustomPngImage(
                  height: 300, // Adjust height as needed
                  width: 250,
                  imageName: "assets/images/solar.png",
                  boxFit: BoxFit.contain,
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
