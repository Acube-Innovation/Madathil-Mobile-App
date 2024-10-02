import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:madathil/app_images.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/view/screens/common_widgets/custom_images.dart';

class OptionCard extends StatelessWidget {
  final String? title;
  final String? subTitle;
  final Function()? onPressed;
  final String? icons;
  final String? groupValue;
  final String? radioValue;
  final void Function(String?)? onchaged;

  const OptionCard(
      {super.key,
      this.title,
      this.subTitle,
      this.onPressed,
      this.icons,
      this.groupValue,
      this.radioValue,
      this.onchaged});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: AppColors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 3,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ], borderRadius: BorderRadius.circular(10), color: AppColors.white),
          child: Row(
            children: [
              _getIconForTransaction(title),
              // CustomPngImage(
              //   height: 40,
              //   width: 50,
              //   imageName: icons,
              //   boxFit: BoxFit.cover,
              // ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title ?? "",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(height: 1.7, color: AppColors.black),
                  ),
                  SizedBox(
                    width: 180,
                    child: Text(
                      _getStringForTransaction(title),
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(height: 1.7, color: AppColors.grey),
                    ),
                  )
                ],
              ),
              const Spacer(),
              Radio<String?>(
                  activeColor: AppColors.black,
                  value: radioValue,
                  groupValue: groupValue,
                  onChanged: onchaged),
            ],
          )),
    );
  }

  String _getStringForTransaction(String? name) {
    switch (name) {
      case "Cash":
        return "Pay the amount as cash";
      case "Bank Draft":
        return "Pay the amount as Bank Draft";
      case "Wire Transfer":
        return "Pay the amount as Wire Transfer";
      case "Credit Card":
        return "Pay the amount with Credit Card";
      case "UPI":
        return "Pay the amount with UPI";
      case "Cheque":
        return "Pay the amount as  cheque";

      default:
        return "cash";
    }
  }

  Widget _getIconForTransaction(String? name) {
    switch (name) {
      case "Cash":
        return const CustomPngImage(
          imageName: AppImages.cashImage,
          height: 40,
          width: 50,
          boxFit: BoxFit.cover,
        );
      case "Bank Draft":
        return const CustomPngImage(
          imageName: AppImages.bankTransfer,
          height: 40,
          width: 50,
          // color: AppColors.rSecondaryColor,
        );
      case "Wire Transfer":
      case null:
        return const CustomPngImage(
          imageName: AppImages.transactionsImage,
          height: 40,
          width: 50,
          boxFit: BoxFit.cover,
        );
      case "Credit Card":
        return const CustomPngImage(
          imageName: AppImages.creditcardImage,
          height: 40,
          width: 50,
          boxFit: BoxFit.cover,
        );
      case "UPI":
        return const CustomPngImage(
          imageName: AppImages.upiImage,
          height: 40,
          width: 50,
          boxFit: BoxFit.cover,
        );
      case "Cheque":
        return const CustomPngImage(
          imageName: AppImages.cheqPayement,
          height: 40,
          width: 50,
          boxFit: BoxFit.cover,
        );

      default:
        return const Icon(Icons.attach_money,
            color: AppColors.primeryColor, size: 50.0); // Default icon
    }
  }
}
