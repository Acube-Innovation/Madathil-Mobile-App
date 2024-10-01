import 'package:flutter/material.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/view/screens/common_widgets/custom_appbarnew.dart';
import 'package:madathil/view/screens/transactions/transaction_details.dart';
import 'package:madathil/view/screens/transactions/widgets/transaction_filter.dart';
import 'package:madathil/view/screens/transactions/widgets/transaction_item.dart';

class TransactionList extends StatefulWidget {
  const TransactionList({super.key});

  @override
  State<TransactionList> createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  @override
  Widget build(BuildContext context) {
    bool FilterOn = false;
    return Scaffold(
      appBar: const CustomAppBar(title: "Transaction List"),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(
              height: 46,
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(left: 30),
                  suffixIcon: Container(
                      margin: const EdgeInsets.all(2),
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
              height: 15,
            ),
            // FilterOn == false
            //     ? Row(
            //         mainAxisAlignment: MainAxisAlignment.end,
            //         children: [
            //           IconButton(
            //             onPressed: () {
            //               setState(() {
            //                 FilterOn = true;
            //               });
            //             },
            //             icon: const Icon(
            //               Icons.tune,
            //               color: AppColors.territoryColor,
            //             ),
            //           )
            //         ],
            //       )
            //     :
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      height: 40,
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors.primeryColor),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '12/06',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: AppColors.primeryColor,
                                ),
                          ),
                          const Icon(
                            Icons.close,
                            size: 20,
                            color: AppColors.primeryColor,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      height: 40,
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors.primeryColor),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Mode',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: AppColors.primeryColor,
                                ),
                          ),
                          const Icon(
                            Icons.close,
                            size: 20,
                            color: AppColors.primeryColor,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {
                    // setState(() {
                    //   FilterOn = true;
                    // });
                    showModalBottomSheet(
                        context: context,
                        backgroundColor: AppColors.transparent,
                        builder: (context) {
                          return const TransactionFilterBottomSheet();
                        });
                  },
                  icon: const Icon(
                    Icons.tune,
                    color: AppColors.territoryColor,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const TransactionDetails(),
                              ));
                        },
                        child: const TransactionItem());
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox();
                  },
                  itemCount: 3),
            )
          ],
        ),
      ),
    );
  }
}
