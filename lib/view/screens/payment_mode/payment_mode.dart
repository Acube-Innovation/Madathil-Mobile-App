import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:madathil/app_images.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/utils/color/util_functions.dart';
import 'package:madathil/view/screens/common_widgets/custom_appbarnew.dart';
import 'package:madathil/view/screens/common_widgets/custom_buttons.dart';
import 'package:madathil/view/screens/common_widgets/custom_images.dart';
import 'package:madathil/view/screens/homepage/homepage.dart';
import 'package:madathil/view/screens/ongoing_transaction/ongoing_transaction_screen.dart';
import 'package:madathil/view/screens/payment_mode/payment_succes.dart';
import 'package:madathil/view/screens/payment_mode/widget/option_card.dart';
import 'package:madathil/viewmodel/common_viewmodel.dart';
import 'package:madathil/viewmodel/customer_viewmodel.dart';
import 'package:madathil/viewmodel/order_viewmodel.dart';
import 'package:madathil/viewmodel/product_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PaymentModeScreen extends StatefulWidget {
  final bool? isfromCheckOut;
  const PaymentModeScreen({super.key, this.isfromCheckOut});

  @override
  State<PaymentModeScreen> createState() => _PaymentModeScreenState();
}

class _PaymentModeScreenState extends State<PaymentModeScreen> {
  late Razorpay _razorpay;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _razorpay = Razorpay();
      _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
      _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
      _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);

      Provider.of<ProductViewmodel>(context, listen: false).getPaymentMethod();
    });
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    log("${response.paymentId}");
    final productVm = Provider.of<ProductViewmodel>(context, listen: false);
    final orderVm = Provider.of<OrderViewmodel>(context, listen: false);
    UtilFunctions.loaderPopup(context);
    if (widget.isfromCheckOut == true) {
      productVm
          .createPayment(
              orderId: productVm.checkOutData?.name,
              payment: productVm.selectedpayment,
              txnId: response.paymentId,
              amount: int.tryParse(productVm.amountController.text))
          .then((value) {
        Navigator.of(context).pop();
        if (value) {
          productVm.clearamount();
          // toast(isError: true, "SUCCESS: ${response.paymentId}", context);
          Fluttertoast.showToast(
              backgroundColor: AppColors.green,
              msg: "SUCCESS: ${response.paymentId}",
              toastLength: Toast.LENGTH_SHORT);

          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const HomePage()));
        } else {
          // toast(productVm.errormsg, context);
          Fluttertoast.showToast(
              backgroundColor: AppColors.red,
              msg: productVm.errormsg ?? "",
              toastLength: Toast.LENGTH_SHORT);
        }
      });
    } else {
      productVm
          .createPayment(
              orderId: orderVm.orderDetail?.name,
              payment: productVm.selectedpayment,
              txnId: response.paymentId,
              amount: int.tryParse(productVm.amountController.text))
          .then((value) {
        Navigator.of(context).pop();
        if (value) {
          productVm.clearamount();
          // toast("SUCCESS: ${response.paymentId}", context, isError: );
          Fluttertoast.showToast(
              backgroundColor: AppColors.green,
              msg: "SUCCESS: ${response.paymentId}",
              toastLength: Toast.LENGTH_SHORT);

          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const HomePage()));
        } else {
          Fluttertoast.showToast(
              backgroundColor: AppColors.red,
              msg: productVm.errormsg ?? "",
              toastLength: Toast.LENGTH_SHORT);
          // toast(isError: false, productVm.errormsg, context);
        }
      });
    }

    // Fluttertoast.showToast(
    //     msg: "SUCCESS: ${response.paymentId}", toastLength: Toast.LENGTH_SHORT);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    log("ERROR: ${response.code} - ${response.message}");

    toast("ERROR: ${response.code} - ${response.message}", context);
    // Fluttertoast.showToast(
    //     msg: "ERROR: ${response.code} - ${response.message}",
    //     toastLength: Toast.LENGTH_SHORT);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: "EXTERNAL WALLET: ${response.walletName}",
        toastLength: Toast.LENGTH_SHORT);
  }

  void openCheckout(int? amount) {
    // log(amount.toString());
    var options = {
      'key': 'rzp_test_QAa2lK7X0WxfMN',
      'amount': amount! * 100, // amount in the smallest currency unit
      'name': 'Madathil.',
      'description': 'add money',
      'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
      'external': {
        // 'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final commonVm = Provider.of<CommonDataViewmodel>(context, listen: false);
    final productVm = Provider.of<ProductViewmodel>(context, listen: false);
    final orderVm = Provider.of<OrderViewmodel>(context, listen: false);
    final cvm = Provider.of<CustomerViewmodel>(context, listen: false);
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
      body: Consumer<ProductViewmodel>(builder: (context, cdv, _) {
        return cdv.isLoading
            ? const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CupertinoActivityIndicator(
                      color: AppColors.primeryColor,
                    ),
                    SizedBox(height: 10),
                    Text("Loading..!")
                  ],
                ),
              )
            : ListView.separated(
                padding: const EdgeInsets.only(
                    top: 30, bottom: 100, right: 20, left: 20),
                scrollDirection: Axis.vertical,
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 20,
                  );
                },
                itemCount: 2,
                itemBuilder: (context, index) {
                  var item = cdv.paymentMethod?[index];
                  List<String> pay = ["Generate Payment Link", "Cash"];
                  return OptionCard(
                    title: pay[index],
                    subTitle: "Pay the amount as cash",
                    onPressed: () {
                      productVm.selectPayment(pay[index] ?? "");
                    },
                    onchaged: (val) {
                      productVm.selectPayment(val!);
                    },
                    groupValue: cdv.selectedpayment,
                    radioValue: pay[index],
                  );
                },
              );
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Consumer<ProductViewmodel>(builder: (ctx, pvm, _) {
          return CustomButton(
            text: pvm.selectedpayment == "Cash"
                ? "Pay  ₹${pvm.amountController.text ?? "1000"}"
                : "Generate Link - ₹${pvm.amountController.text ?? "1000"}",
            onPressed: () {

              cvm.clearaddress();

              

              if(productVm.selectedpayment.isNotEmpty){

                log("payment mode ${productVm.selectedpayment}");
              if ((productVm.selectedpayment != "Cash") &&
                  (productVm.selectedpayment != "Cheque")) {
                // openCheckout(
                //     int.tryParse(productVm.amountController.text)?.toInt());

                productVm
                    .createPayment(
                        orderId: productVm.checkOutData?.name,
                        payment: "Razorpay",
                        txnId: DateTime.now().toString(),
                        amount: int.tryParse(productVm.amountController.text))
                    .then((value) {
                  if (value) {

                    
                    productVm
                        .generatePaymentLink(
                      customer: cvm.customerDetails?.first.name ?? '',
                      contctNo: int.tryParse(
                          cvm.customerDetails?.first.mobileNo ?? ''),
                      email: cvm.customerDetails?.first.emailId,
                      amount: int.tryParse(productVm.amountController.text),
                      invoice: productVm.paymentMessage?.salesInvoice ?? '',
                    )
                        .then((value) {
                       
                      if (value) {

                         toast("The payment link is sented to the customer", context);

                          Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  OngoingTransactionScreen(paymentMessage: productVm.paymentMessage,),
                          
                        ));


                      } else {
                        toast(productVm.errormsg ?? 'Sorry, Unable to generate link!', context, isError: true);
                      }
                    });
                  
                  }else{

                    toast(productVm.errormsg, context, isError: true);
                  }
                });
              } else {
                if (widget.isfromCheckOut == true) {
                  productVm
                      .createPayment(
                          orderId: productVm.checkOutData?.name,
                          payment: productVm.selectedpayment,
                          txnId: DateTime.now().toString(),
                          amount: int.tryParse(productVm.amountController.text))
                      .then((value) {
                    if (value) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PaymentSuccess(),
                          ));
                    }
                  });
                } else {
                  productVm
                      .createPayment(
                          orderId: orderVm.orderDetail?.name,
                          payment: productVm.selectedpayment,
                          txnId: DateTime.now().toString(),
                          amount: int.tryParse(productVm.amountController.text))
                      .then((value) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PaymentSuccess(),
                        ));
                  });
                }
              }
              } else{

                toast("Please select a payment mode", context, isError: true);
              }
            },
          );
        }),
      ),
    );
  }
}
