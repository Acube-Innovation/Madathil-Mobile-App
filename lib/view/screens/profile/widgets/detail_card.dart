import 'package:flutter/material.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/view/screens/call_management/add_call_details_screen.dart';
import 'package:madathil/viewmodel/call_viewmodel.dart';
import 'package:provider/provider.dart';

class ProfileCards extends StatelessWidget {
  final String? leadName;
  final String? leadid;
  final String? data;
  final String? data2;
  final String? value;
  final String? value2;

  const ProfileCards({
    super.key,
    required this.leadName,
    this.leadid,
    this.data,
    this.data2,
    this.value,
    this.value2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey),
        color: AppColors.grey.withOpacity(0.1),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Label 1
              Flexible(
                flex: 4, // Adjust flex value as needed
                child: Text(
                  data ?? "",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        height: 1.7,
                        color: AppColors.black,
                      ),
                ),
              ),
              const Spacer(),
              // Value 1
              Flexible(
                flex: 5, // Allow more space for longer text
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      value ?? "",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            height: 1.7,
                            color: AppColors.black,
                          ),
                      maxLines:
                          null, // Allow text to wrap if it exceeds one line
                      overflow: TextOverflow.visible, // Handle overflow
                    ),
                    if (data == "Number") ...{
                      const SizedBox(width: 10),
                      InkWell(
                        onTap: () {
                          Provider.of<CallViewModel>(context, listen: false)
                              .disposeControllers();
                          Provider.of<CallViewModel>(context, listen: false)
                              .clearTime();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddCallDetailsScreen(
                                      name: leadName,
                                      id: leadid,
                                      number: value)));
                        },
                        child: Container(
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.malachit),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(Icons.call, color: AppColors.white),
                            )),
                      )
                    }
                  ],
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Divider(),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween, // Align at the top
            children: [
              // Label 2
              Flexible(
                flex: 4,
                child: Text(
                  data2 ?? "",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        height: 1.7,
                        color: AppColors.black,
                      ),
                ),
              ),
              const Spacer(),
              // Value 2
              Flexible(
                flex: 6,
                child: Text(
                  value2 ?? "",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        height: 1.7,
                        color: AppColors.black,
                      ),
                  maxLines: null, // Allow text to wrap
                  overflow: TextOverflow.visible, // Handle overflow
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
