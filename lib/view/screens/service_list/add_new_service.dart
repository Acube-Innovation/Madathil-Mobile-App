import 'package:flutter/material.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/view/screens/common_widgets/custom_appbarnew.dart';
import 'package:madathil/view/screens/common_widgets/custom_buttons.dart';
import 'package:madathil/view/screens/common_widgets/custom_dropdown.dart';
import 'package:madathil/view/screens/common_widgets/custom_text_field.dart';

class AddService extends StatelessWidget {
  const AddService({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Add Service"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Service Title",
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: AppColors.grey),
            ),
            const SizedBox(
              height: 5,
            ),
            CustomTextField(
              hint: "Solar panal installation ",
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Select Type",
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: AppColors.grey),
            ),
            const SizedBox(
              height: 5,
            ),
            CustomDropdown(
                hint: "Select Type",
                items: const ["Technical", "Service"],
                onChanged: (val) {}),
            const Spacer(),
            CustomButton(
              text: "Submit",
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
