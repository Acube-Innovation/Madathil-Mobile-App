import 'package:flutter/material.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/view/screens/common_widgets/custom_appbarnew.dart';

class SalaryDetailScreen extends StatelessWidget {
  const SalaryDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(title: "Salary Details"),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: const LinearGradient(colors: [
                      AppColors.secondaryColor,
                      AppColors.primeryColor
                    ], begin: Alignment.centerLeft, end: Alignment.centerRight),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 40.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Center(
                        child: Text(
                          "Total Salary",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: AppColors.white),
                        ),
                      ),
                      Center(
                        child: Text(
                          "₹ 27,000",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(color: AppColors.white, fontSize: 28),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Text(
                                "Total Points",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(color: AppColors.white),
                              ),
                              Text(
                                "15,000",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(
                                        color: AppColors.white, fontSize: 22),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 40,
                            child: VerticalDivider(
                                color: AppColors.white, thickness: 1),
                          ),
                          Column(
                            children: [
                              Text(
                                "Incentives",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(color: AppColors.white),
                              ),
                              Text(
                                "₹ 20,000",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(
                                        color: AppColors.white, fontSize: 22),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                //sales list
                Text(
                  "Sales",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(color: AppColors.primeryColor),
                ),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return const SalaeyDetailsListItem();
                  },
                )
              ],
            ),
          ),
        ));
  }
}

class SalaeyDetailsListItem extends StatefulWidget {
  const SalaeyDetailsListItem({super.key});

  @override
  _SalaeyDetailsListItemState createState() => _SalaeyDetailsListItemState();
}

class _SalaeyDetailsListItemState extends State<SalaeyDetailsListItem> {
  bool _isExpanded = false;

  void _toggleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleExpand,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "User Name",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(color: AppColors.black),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "5 kw",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(color: AppColors.black),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "₹ 3,20,000",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                  color: AppColors.black,
                                  fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "Incentives : ₹ 18,000",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(color: AppColors.grey),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "Points : 21,000",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(color: AppColors.grey),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "salary",
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.copyWith(color: AppColors.grey),
                      ),
                      Text(
                        "₹ 18,000",
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: AppColors.primaryLightColor, fontSize: 20),
                      ),
                      const SizedBox(height: 10),
                      Icon(
                        _isExpanded
                            ? Icons.arrow_drop_up
                            : Icons.arrow_drop_down_circle_sharp,
                        color: AppColors.grey.withOpacity(0.4),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              if (_isExpanded) ...[
                const Divider(thickness: 1, color: AppColors.black),
                const SizedBox(height: 10),
                Text(
                  "Transactions details",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: AppColors.black),
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }
}
