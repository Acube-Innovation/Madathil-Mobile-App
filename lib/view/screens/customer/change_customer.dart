import 'package:flutter/material.dart';

import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/view/screens/common_widgets/custom_appbarnew.dart';
import 'package:madathil/view/screens/common_widgets/custom_buttons.dart';
import 'package:madathil/view/screens/common_widgets/custom_images.dart';
import 'package:madathil/view/screens/customer/add_customer_screen.dart';
import 'package:madathil/view/screens/payment_mode/payment_mode.dart';
import 'package:madathil/viewmodel/common_viewmodel.dart';
import 'package:provider/provider.dart';

class ChangeCustomer extends StatelessWidget {
  const ChangeCustomer({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    final commonVm = Provider.of<CommonDataViewmodel>(context, listen: false);

    return Scaffold(
      appBar: CustomAppBar(
        title: "Change Customer",
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Consumer<CommonDataViewmodel>(builder: (context, cdv, _) {
            return Column(
              children: [
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
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: SizedBox(
                    height: 500,
                    child: ListView.separated(
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 10,
                        );
                      },
                      scrollDirection: Axis.vertical,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            commonVm.selectValue('Option $index');
                          },
                          child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 3,
                                      offset: const Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColors.white),
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "TestCustomer",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .copyWith(
                                                height: 1.7,
                                                color: AppColors.black),
                                      ),
                                      SizedBox(
                                        width: 150,
                                        child: Text(
                                          "House no 3 , Advocate Lane Vytilla p.o Kochi ",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                                  height: 1.7,
                                                  color: AppColors.black),
                                          maxLines: 3,
                                        ),
                                      )
                                    ],
                                  ),
                                  const Spacer(),
                                  Radio(
                                    activeColor: AppColors.black,
                                    value: 'Option $index',
                                    groupValue: cdv.selectedValue,
                                    onChanged: (value) {
                                      commonVm.selectValue(value!);
                                      // Update the selected value
                                    },
                                  ),
                                ],
                              )),
                        );
                      },
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        text: "Select",
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const PaymentModeScreen(),
                              ));
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AddNewCustomer(),
                            ));
                      },
                      child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 9),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.white,
                              border: Border.all(
                                  color: AppColors.primeryColor, width: 2)),
                          child: const Icon(
                            Icons.add,
                            color: AppColors.primeryColor,
                          )),
                    ),
                  ],
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}
