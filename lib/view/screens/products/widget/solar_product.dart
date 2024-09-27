import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:madathil/app_images.dart';
import 'package:madathil/model/services/api_service/api_urls.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/view/screens/common_widgets/custom_images.dart';
import 'package:madathil/view/screens/products/product_detail_screen.dart';
import 'package:madathil/viewmodel/product_viewmodel.dart';
import 'package:provider/provider.dart';

class SolarProductList extends StatefulWidget {
  final bool issolarProduct;
  const SolarProductList({super.key, required this.issolarProduct});

  @override
  State<SolarProductList> createState() => _SolarProductListState();
}

class _SolarProductListState extends State<SolarProductList> {
  @override
  void initState() {
    log("category--->${widget.issolarProduct.toString()}");
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Provider.of<ProductViewmodel>(context, listen: false)
          .resetProductPagination();
      Provider.of<ProductViewmodel>(context, listen: false)
          .fetchProductList(isSolarProduct: widget.issolarProduct);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final productVm = Provider.of<ProductViewmodel>(context, listen: false);
    return Consumer<ProductViewmodel>(builder: (context, pvm, _) {
      if ((pvm.productPost ?? []).isEmpty) {
        if (pvm.isLoading) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CupertinoActivityIndicator(color: AppColors.primeryColor),
                SizedBox(height: 10),
                Text("Loading..!")
              ],
            ),
          );
        } else {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // CupertinoActivityIndicator(color: AppColors.primeryColor),
                Text("No product available."),
              ],
            ),
          );
        }
      } else {
        return RefreshIndicator(
          onRefresh: () async {
            Provider.of<ProductViewmodel>(context, listen: false)
                .resetProductPagination();
            Provider.of<ProductViewmodel>(context, listen: false)
                .fetchProductList(isSolarProduct: widget.issolarProduct);
          },
          child: ListView.separated(
            separatorBuilder: (context, index) {
              return const SizedBox();
            },
            itemCount: (pvm.productPost ?? []).length + 1,
            itemBuilder: (context, index) {
              if (index == (pvm.productPost ?? []).length) {
                if (pvm.ispaginationproduct) {
                  return const SizedBox(
                      height: 30,
                      width: 30,
                      child: CupertinoActivityIndicator(
                          animating: true, radius: 15));
                } else {
                  if (!pvm.productReachLength) {
                    if (!pvm.ispaginationproduct) {
                      WidgetsBinding.instance.addPostFrameCallback((_) async {
                        pvm.fetchProductList(
                            isSolarProduct: widget.issolarProduct);
                      });
                      return const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 5),
                          SizedBox(
                              height: 30,
                              width: 30,
                              child: CupertinoActivityIndicator(
                                  animating: true, radius: 15))
                        ],
                      );
                    }
                  } else {
                    if (pvm.productPost!.isEmpty) {
                      return const Center(
                          child: Text(
                        "No product available.",
                      ));
                    } else {
                      return const Column(
                        children: [
                          SizedBox(height: 200),
                          Center(
                              child: Text(
                            "No more product available.",
                            style: TextStyle(color: Colors.grey),
                          )),
                        ],
                      );
                    }
                  }
                }
              } else {
                var item = productVm.productPost![index];

                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 2, vertical: 10),
                  child: GestureDetector(
                    onTap: () {
                      log(item.itemName.toString());
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ProductDetailScreen(item: item),
                          ));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.primeryColor),
                        borderRadius: BorderRadius.circular(10),
                      ),
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
                                    color: AppColors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  padding: const EdgeInsets.all(5),
                                  child: item.image != null
                                      ? Image.network(
                                          height: 121,
                                          width: 114,
                                          "${ApiUrls.kProdBaseURL}${item.image}",
                                          fit: BoxFit.contain,
                                        )
                                      : const CustomPngImage(
                                          imageName: AppImages.placeHolder,
                                          height: 100,
                                          width: 114,
                                          boxFit: BoxFit.contain,
                                        ),
                                ),
                                const SizedBox(width: 10),
                                // Text Information
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                        item.itemName ?? "",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .copyWith(
                                              height: 1.7,
                                              color: AppColors.primeryColor,
                                            ),
                                      ),
                                      Text(
                                        "Size",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(
                                              height: 1.7,
                                              color: AppColors.primeryColor,
                                            ),
                                      ),
                                      Text(
                                        item.creation?.day.toString() ?? "",
                                        // "1200*100 / 1350 *700",
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall!
                                            .copyWith(
                                              height: 1.7,
                                              color: AppColors.primeryColor,
                                            ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                    ],
                                  ),
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
                                height: 105, // Same height as the image
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppColors.secondaryColor
                                            .withOpacity(0.1)),
                                    child: const Icon(
                                      Icons.arrow_forward_ios,
                                      color: AppColors.secondaryColor,
                                    ),
                                  ),
                                ),
                              ),
                              // Text placed at the bottom right
                              Text(
                                "\$ ${item.rate?.toDouble().round() ?? 0.0}",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                      height: 1.7,
                                      color: AppColors.primeryColor,
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }
              return null;
            },
          ),
        );
      }
    });
  }
}
