import 'package:flutter/material.dart';
import 'package:madathil/utils/color/app_colors.dart';

class CustomDropdown extends StatelessWidget {
  final String hint;
  final List<String> items;
  final String? selectedItem;
  final ValueChanged<String?> onChanged;

  const CustomDropdown({
    super.key,
    required this.hint,
    required this.items,
    this.selectedItem,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      icon: const Icon(Icons.keyboard_arrow_down),
      value: selectedItem,
      hint: Text(
        hint,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              height: 1.7,
              color: AppColors.grey,
            ),
      ),
      items: items.map((String item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(
            item,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  height: 1.7,
                  color: AppColors.black,
                ),
          ),
        );
      }).toList(),
      onChanged: onChanged,
      decoration: const InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.primeryColor,
          ),
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 10),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.primeryColor,
            ),
            borderRadius: BorderRadius.all(Radius.circular(5.0))),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.primeryColor,
            ),
            borderRadius: BorderRadius.all(Radius.circular(5.0))),
      ),
    );
  }
}
