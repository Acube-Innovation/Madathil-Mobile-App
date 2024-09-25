import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:madathil/app_images.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/view/screens/common_widgets/custom_appbarnew.dart';
import 'package:madathil/view/screens/common_widgets/custom_buttons.dart';
import 'package:madathil/view/screens/common_widgets/custom_images.dart';
import 'package:madathil/view/screens/payment_mode/payment_succes.dart';
import 'package:madathil/view/screens/payment_mode/widget/option_card.dart';
import 'package:madathil/viewmodel/common_viewmodel.dart';
import 'package:provider/provider.dart';

class PaymentModeScreen extends StatelessWidget {
  const PaymentModeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final commonVm = Provider.of<CommonDataViewmodel>(context, listen: false);
    return Scaffold(
      appBar: CustomAppBar(
        title: "Payment Mode",
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
      body: Consumer<CommonDataViewmodel>(builder: (context, cdv, _) {
        return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                OptionCard(
                  title: "Cash",
                  subTitle: "Pay the amount as cash",
                  icons: AppImages.cashImage,
                  onPressed: () {
                    commonVm.selectPayment('payment1');
                  },
                  onchaged: (val) {
                    commonVm.selectPayment(val!);
                  },
                  groupValue: cdv.selectedpayment,
                  radioValue: 'payment1',
                ),
                const SizedBox(
                  height: 20,
                ),
                OptionCard(
                  title: "Credit card",
                  subTitle: "52************74",
                  icons: AppImages.creditcardImage,
                  onPressed: () {
                    commonVm.selectPayment('payment2');
                  },
                  onchaged: (val) {
                    commonVm.selectPayment(val!);
                  },
                  groupValue: cdv.selectedpayment,
                  radioValue: 'payment2',
                ),
                const SizedBox(
                  height: 20,
                ),
                OptionCard(
                  title: "Debit card",
                  subTitle: "52************74",
                  icons: AppImages.debitcardImage,
                  onPressed: () {
                    commonVm.selectPayment('payment3');
                  },
                  onchaged: (val) {
                    commonVm.selectPayment(val!);
                  },
                  groupValue: cdv.selectedpayment,
                  radioValue: 'payment3',
                ),
                const SizedBox(
                  height: 20,
                ),
                OptionCard(
                  title: "UPI",
                  subTitle: "abc@gmail.hdfc.co",
                  icons: AppImages.upiImage,
                  onPressed: () {
                    commonVm.selectPayment('payment4');
                  },
                  onchaged: (val) {
                    commonVm.selectPayment(val!);
                  },
                  groupValue: cdv.selectedpayment,
                  radioValue: 'payment4',
                ),
                const Spacer(),
                CustomButton(
                  text: "Pay  \$10000",
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PaymentSuccess(),
                        ));
                  },
                )
              ],
            ));
      }),
    );
  }
}
