import 'package:flutter/material.dart';
import 'package:madathil/model/model_class/api_response_model/leads_detail_response.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/view/screens/common_widgets/custom_appbarnew.dart';
import 'package:madathil/view/screens/common_widgets/custom_images.dart';
import 'package:madathil/view/screens/leads/components/quoatation_item.dart';

class QuotationLst extends StatefulWidget {
  final LeadsDetailsData? data;
  const QuotationLst({super.key, this.data});

  @override
  State<QuotationLst> createState() => _QuotationLstState();
}

class _QuotationLstState extends State<QuotationLst> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: "Quotation List",
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                height: 80,
                width: 80,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.secondaryColor,
                ),
                child: const Center(
                  child: CustomPngImage(
                    imageName: 'assets/images/user_account.png',
                    height: 50,
                    width: 50,
                    boxFit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Center(
              child: Text(
                widget.data?.leadName ?? "N/A",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      height: 1.7,
                      color: AppColors.black,
                    ),
              ),
            ),
            Center(
              child: Text(
                widget.data?.leadOwner ?? "N/A",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      height: 1.7,
                      color: AppColors.grey,
                    ),
              ),
            ),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Quotation Details",
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          height: 1.7,
                          color: AppColors.grey,
                        ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Lead Details",
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .copyWith(
                              height: 1.7,
                              color: AppColors.blue,
                              fontSize: 14,
                              fontWeight: FontWeight.normal),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Quotation Items List
             Expanded(
              child: QuoatationItem(data: widget.data,), // Ensures it occupies the remaining space
            ),
          ],
        ),
      ),
    );
  }
}
