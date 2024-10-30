import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:madathil/app_images.dart';
import 'package:madathil/model/services/api_service/api_urls.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/view/screens/check_out/check_out_screen.dart';
import 'package:madathil/view/screens/common_widgets/custom_appbarnew.dart';
import 'package:madathil/view/screens/common_widgets/custom_buttons.dart';
import 'package:madathil/view/screens/common_widgets/custom_images.dart';
import 'package:madathil/view/screens/customer/change_customer.dart';
import 'package:madathil/viewmodel/product_viewmodel.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productVm = Provider.of<ProductViewmodel>(context, listen: false);
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Cart",
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            // SizedBox(
            //   height: 46,
            //   child: TextField(
            //     decoration: InputDecoration(
            //       contentPadding: const EdgeInsets.only(left: 30),
            //       suffixIcon: Container(
            //           decoration: const BoxDecoration(
            //             shape: BoxShape.circle,
            //             color: AppColors.primeryColor,
            //           ),
            //           child: const Icon(
            //             Icons.search,
            //             color: Colors.white,
            //           )),
            //       enabled: true,
            //       disabledBorder: const OutlineInputBorder(
            //         borderRadius: BorderRadius.all(Radius.circular(5.0)),
            //         borderSide: BorderSide(color: AppColors.black),
            //       ),
            //       border: const OutlineInputBorder(
            //         borderRadius: BorderRadius.all(Radius.circular(25.0)),
            //         borderSide: BorderSide(color: AppColors.grey, width: 1),
            //       ),
            //       enabledBorder: const OutlineInputBorder(
            //         borderRadius: BorderRadius.all(Radius.circular(25.0)),
            //         borderSide: BorderSide(color: AppColors.grey, width: 1),
            //       ),
            //       focusedBorder: const OutlineInputBorder(
            //         borderRadius: BorderRadius.all(Radius.circular(25.0)),
            //         borderSide:
            //             BorderSide(color: AppColors.primeryColor, width: 1),
            //       ),
            //       errorBorder: const OutlineInputBorder(
            //         borderRadius: BorderRadius.all(Radius.circular(25.0)),
            //         borderSide: BorderSide(color: AppColors.red),
            //       ),
            //       hintText: "Search",
            //       counterText: "",
            //       hintStyle: const TextStyle(
            //         // fontFamily: "SF Pro Display",
            //         fontSize: 18,
            //         fontWeight: FontWeight.w400,
            //         height: 1.275,
            //         color: AppColors.grey,
            //       ),
            //     ),
            //   ),
            // ),
            const SizedBox(
              height: 20,
            ),
            Consumer<ProductViewmodel>(builder: (context, pvm, _) {
              // ignore: unnecessary_null_comparison
              return (pvm.cartItmes.isEmpty)
                  ? const Center(
                      child: Text("No items in cart"),
                    )
                  : Expanded(
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                // crossAxisCount: 2, // number of items in each row
                                // mainAxisSpacing: 8.0, // spacing between rows
                                // crossAxisSpacing: 8.0,
                                // childAspectRatio: 0.65,
                                crossAxisCount: 2, // Number of items per row
                                crossAxisSpacing:
                                    10, // Space between items horizontally
                                mainAxisSpacing:
                                    10, // Space between items vertically
                                childAspectRatio: 3 / 4.5
                                // spacing between columns
                                ),
                        padding: const EdgeInsets.all(
                            5.0), // padding around the grid
                        itemCount:
                            pvm.cartItmes.length, // total number of items
                        itemBuilder: (context, index) {
                          var item = pvm.cartItmes[index];
                          return Stack(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                width: double.maxFinite,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.grey.withOpacity(0.5),
                                      spreadRadius: 1,
                                      blurRadius: 7,
                                      offset: const Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColors.white,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Center(
                                      child: item.product?.image != null
                                          ? Image.network(
                                              height: 90,
                                              width: 100,
                                              "${ApiUrls.kProdBaseURL}${item.product?.image}",
                                              fit: BoxFit.contain,
                                            )
                                          : const CustomPngImage(
                                              height: 90,
                                              width: 100,
                                              imageName: AppImages.placeHolder,
                                              boxFit: BoxFit.contain,
                                            ),
                                    ),
                                    const SizedBox(
                                        height:
                                            8), // Add spacing between image and text
                                    Text(
                                      item.product?.itemName ?? "",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(
                                            height: 1.5,
                                            color: AppColors.primeryColor,
                                          ),
                                      textAlign: TextAlign
                                          .center, // Align text to center
                                    ),

                                    const SizedBox(
                                        height: 4), // Add spacing between text
                                    Text(
                                      "Qauntity",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                            height: 1.5,
                                            color: AppColors.grey,
                                          ),
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      item.quantity.toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                            height: 1.5,
                                            color: AppColors.black,
                                          ),
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(
                                        height: 4), // Add spacing between text
                                    Text(
                                      "Price",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                            height: 1.5,
                                            color: AppColors.grey,
                                          ),
                                      textAlign: TextAlign.center,
                                    ),
                                    // Add spacing between text
                                    Text(
                                      "₹ ${item.product?.rate?.toInt()}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge!
                                          .copyWith(
                                            height: 1.5,
                                            color: AppColors
                                                .black, // Use a different color for price
                                          ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                right: 10,
                                top: 10,
                                child: GestureDetector(
                                  onTap: () {
                                    log("clicked");
                                    productVm.removeFromCart(item.product!);
                                  },
                                  child: const Icon(Icons.close),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    );
            }),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: CustomButton(
          text: "Check Out",
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        // const CheckOutScreen(),
                        const ChangeCustomer(
                          isFromCart: true,
                        )));
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => const CheckOutScreen(),
            //     ));
          },
        ),
      ),
    );
  }
}
