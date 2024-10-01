import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/utils/color/util_functions.dart';
import 'package:madathil/view/screens/check_out/check_out_screen.dart';
import 'package:madathil/view/screens/common_widgets/custom_appbarnew.dart';
import 'package:madathil/view/screens/common_widgets/custom_buttons.dart';
import 'package:madathil/view/screens/common_widgets/custom_images.dart';
import 'package:madathil/view/screens/customer/add_customer_screen.dart';
import 'package:madathil/view/screens/payment_mode/payment_mode.dart';
import 'package:madathil/viewmodel/common_viewmodel.dart';
import 'package:madathil/viewmodel/customer_viewmodel.dart';
import 'package:madathil/viewmodel/product_viewmodel.dart';
import 'package:provider/provider.dart';

class ChangeCustomer extends StatefulWidget {
  const ChangeCustomer({super.key});

  @override
  State<ChangeCustomer> createState() => _ChangeCustomerState();
}

class _ChangeCustomerState extends State<ChangeCustomer> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Provider.of<CustomerViewmodel>(context, listen: false)
          .resetCustomerPagination();

      Provider.of<CustomerViewmodel>(context, listen: false)
          .fetchCustomerList();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    final customerVm = Provider.of<CustomerViewmodel>(context, listen: false);
    final productVm = Provider.of<ProductViewmodel>(context, listen: false);

    return Scaffold(
      appBar: CustomAppBar(
        title: "Select Customer",
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Consumer<CustomerViewmodel>(builder: (context, csv, _) {
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
              const SizedBox(height: 20),
              Expanded(
                child: Consumer<CustomerViewmodel>(builder: (context, csv, _) {
                  if ((csv.customerPost ?? []).isEmpty) {
                    if (csv.isLoading) {
                      return const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CupertinoActivityIndicator(
                                color: AppColors.primeryColor),
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
                            Text("No Customers available."),
                          ],
                        ),
                      );
                    }
                  } else {
                    return RefreshIndicator(
                      onRefresh: () async {
                        Provider.of<CustomerViewmodel>(context, listen: false)
                            .resetCustomerPagination();

                        Provider.of<CustomerViewmodel>(context, listen: false)
                            .fetchCustomerList();
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: ListView.separated(
                          padding: const EdgeInsets.all(5),
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              height: 10,
                            );
                          },
                          scrollDirection: Axis.vertical,
                          itemCount: (csv.customerPost ?? []).length + 1,
                          itemBuilder: (context, index) {
                            if (index == (csv.customerPost ?? []).length) {
                              if (csv.ispaginationcstList) {
                                return const SizedBox(
                                    height: 30,
                                    width: 30,
                                    child: CupertinoActivityIndicator(
                                        animating: true, radius: 15));
                              } else {
                                if (!csv.cstListReachLength) {
                                  if (!csv.ispaginationcstList) {
                                    WidgetsBinding.instance
                                        .addPostFrameCallback((_) async {
                                      csv.fetchCustomerList();
                                    });
                                    return const Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                  if (csv.customerPost!.isEmpty) {
                                    return const Center(
                                        child: Text(
                                      "No customer available.",
                                    ));
                                  } else {
                                    return const Column(
                                      children: [
                                        SizedBox(height: 200),
                                        Center(
                                            child: Text(
                                          "No more customer available.",
                                          style: TextStyle(color: Colors.grey),
                                        )),
                                      ],
                                    );
                                  }
                                }
                              }
                            } else {
                              var item = customerVm.customerPost![index];
                              return GestureDetector(
                                onTap: () {
                                  customerVm.selectValue(item);
                                },
                                child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                AppColors.grey.withOpacity(0.5),
                                            spreadRadius: 2,
                                            blurRadius: 3,
                                            offset: const Offset(0,
                                                3), // changes position of shadow
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
                                              item.customerName ??
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
                                                item.emailId != null &&
                                                        item.emailId!.isNotEmpty
                                                    ? item.emailId.toString()
                                                    : "abc@mail.com",
                                                // "House no 3 , Advocate Lane Vytilla p.o Kochi ",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium!
                                                    .copyWith(
                                                        height: 1.7,
                                                        color: AppColors.black),
                                                maxLines: 3,
                                              ),
                                            ),
                                            Text(
                                              item.mobileNo ?? "56565658989",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium!
                                                  .copyWith(
                                                      height: 1.7,
                                                      color: AppColors.black),
                                            ),
                                          ],
                                        ),
                                        const Spacer(),
                                        Radio(
                                          activeColor: AppColors.black,
                                          value: item,
                                          groupValue: csv.selectedAddress,
                                          onChanged: (value) {
                                            customerVm.selectValue(value!);
                                            // Update the selected value
                                          },
                                        ),
                                      ],
                                    )),
                              );
                            }
                            return null;
                          },
                        ),
                      ),
                    );
                  }
                }),
              ),
              const SizedBox(
                height: 50,
              )
            ],
          );
        }),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Row(
          children: [
            Expanded(
              child: CustomButton(
                text: "Select",
                onPressed: () {
                  DateTime today = DateTime.now();

                  DateTime nextDay = today.add(const Duration(days: 2));

                  String nextDayString =
                      "${nextDay.year}-${nextDay.month.toString().padLeft(2, '0')}-${nextDay.day.toString().padLeft(2, '0')}";
                  UtilFunctions.loaderPopup(context);

                  productVm
                      .createCheckOut(
                          customer: customerVm.selectedAddress?.customerName,
                          date: nextDayString,
                          productData: productVm.productData)
                      .then((value) {
                    customerVm.getCustomerAddress(
                        name: customerVm.selectedAddress?.customerName);
                    Navigator.of(context).pop();

                    if (value) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CheckOutScreen(),
                          ));
                    } else {
                      Navigator.of(context).pop();
                      toast(customerVm.errormsg, context);
                    }
                  });
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 9),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.white,
                      border:
                          Border.all(color: AppColors.primeryColor, width: 2)),
                  child: const Icon(
                    Icons.add,
                    color: AppColors.primeryColor,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
