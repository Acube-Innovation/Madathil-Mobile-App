import 'package:flutter/material.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/view/screens/common_widgets/custom_appbarnew.dart';
import 'package:madathil/view/screens/products/widget/solar_product.dart';

class PrdoductList extends StatefulWidget {
  const PrdoductList({super.key});

  @override
  State<PrdoductList> createState() => _PrdoductListState();
}

class _PrdoductListState extends State<PrdoductList> {
  @override
  Widget build(BuildContext context) {
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
          actions: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.tune,
                color: AppColors.secondaryColor,
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
      ),
    );
  }
}
