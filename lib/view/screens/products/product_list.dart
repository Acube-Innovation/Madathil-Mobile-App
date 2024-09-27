import 'package:flutter/material.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/view/screens/cart/cart_screen.dart';
import 'package:madathil/view/screens/common_widgets/custom_appbarnew.dart';
import 'package:madathil/view/screens/common_widgets/custom_buttons.dart';
import 'package:madathil/view/screens/common_widgets/custom_dropdown.dart';
import 'package:madathil/view/screens/common_widgets/custom_images.dart';
import 'package:madathil/view/screens/common_widgets/custom_text_field.dart';
import 'package:madathil/view/screens/products/widget/solar_product.dart';
import 'package:madathil/viewmodel/auth_viewmodel.dart';
import 'package:madathil/viewmodel/common_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class PrdoductList extends StatefulWidget {
  const PrdoductList({super.key});

  @override
  State<PrdoductList> createState() => _PrdoductListState();
}

class _PrdoductListState extends State<PrdoductList> {
  @override
  Widget build(BuildContext context) {
    final commonVm = Provider.of<CommonDataViewmodel>(context, listen: false);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
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
          title: "Product List",
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  showfilterPopup(context);
                },
                child: const Icon(
                  Icons.tune,
                  color: AppColors.secondaryColor,
                ),
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(children: <Widget>[
            Container(
              height: 40,
              // Set a fixed height for the TabBar
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                  color: const Color(0xff466E20), // Border color for the TabBar
                ),
                borderRadius: BorderRadius.circular(20), // Rounded TabBar
              ),
              child: TabBar(
                dividerColor: Colors.transparent,
                labelStyle: Theme.of(context).textTheme.headlineSmall!,
                onTap: (index) {
                  // bookinVm.setTabIndex(index);
                },
                indicatorSize: TabBarIndicatorSize.tab,
                labelColor: AppColors.white,
                unselectedLabelColor: AppColors.primeryColor,
                tabs: const [
                  Tab(text: 'Solar'),
                  Tab(text: 'Trading'),
                ],
                indicator: BoxDecoration(
                  color: const Color(
                      0xff466E20), // Background color for the selected tab
                  borderRadius: BorderRadius.circular(20),
                ),
                // indicatorColor:
                //     AppColors.primeryColor, // Correct field name is needed
              ),
            ),
            const SizedBox(
              height: 20,
            ),
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
              height: 40,
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  SolarProductList(),
                  // Return a BookingCard for each item
                  SolarProductList()
                  // Return a BookingCard for each item
                ],
              ),
            ),
          ]),
        ),
        floatingActionButton: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CartScreen(),
                ));
          },
          child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.primeryColor,
              ),
              child: const Icon(
                size: 30,
                Icons.shopping_cart,
                color: Colors.white,
              )),
        ),
      ),
    );
  }

  void showfilterPopup(BuildContext context) {
    // Wrap the logic that accesses MediaQuery in a Builder
    final commonVm = Provider.of<CommonDataViewmodel>(context, listen: false);
    showModalBottomSheet(
      isDismissible: true,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        final popupHeight =
            MediaQuery.of(context).size.height * 0.6; // Calculate height here
        return Stack(
          children: [
            SingleChildScrollView(
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(20)),
                child: Container(
                  color: AppColors.white,
                  padding: const EdgeInsets.all(5),
                  height: popupHeight, // Use the calculated height
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Consumer<CommonDataViewmodel>(
                        builder: (context, cdv, _) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.tune,
                                color: AppColors.black,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Filter",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                      height: 1.7,
                                      color: AppColors.black,
                                    ),
                              )
                            ],
                          ),
                          const SizedBox(height: 20),
                          GestureDetector(
                            onTap: () {
                              commonVm.selectDate(context);
                            },
                            child: AbsorbPointer(
                              child: CustomTextField(
                                controller: cdv.dobController,
                                hint: 'Enter DOB',
                                suffixIcon: const Icon(Icons.calendar_month),
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),

                          CustomDropdown(
                            hint: 'Select Brand',
                            items: const ["Brand", "LG"],
                            selectedItem: 'Brand',
                            onChanged: (String? value) {},
                          ),
                          const SizedBox(height: 15),

                          CustomDropdown(
                            hint: 'Select Size',
                            items: const ["Size", "walt"],
                            selectedItem: 'Size',
                            onChanged: (String? value) {},
                          ),

                          const SizedBox(height: 30),

                          // Provides spacing before the button
                          const Spacer(),
                          CustomButton(
                            height: 44,
                            width: double.infinity,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            text: "Apply",
                          )
                        ],
                      );
                    }),
                  ),
                ),
              ),
            ),
            Positioned(
              top:
                  -5, // Adjust position to place it outside the bottom sheet content
              left: 0,
              right: 0,

              child: Shimmer.fromColors(
                  baseColor: AppColors.grey300,
                  highlightColor: AppColors.grey300.withOpacity(0.2),
                  period: const Duration(seconds: 5),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 120, vertical: 10),
                    child: Container(
                      height: 6,
                      decoration: BoxDecoration(
                          color: AppColors.grey,
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  )),
            )
          ],
        );
      },
    );
  }
}
