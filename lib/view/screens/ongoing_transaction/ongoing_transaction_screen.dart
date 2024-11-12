import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:madathil/app_images.dart';
import 'package:madathil/model/model_class/api_response_model/create_payment_response.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/utils/custom_loader.dart';
import 'package:madathil/utils/no_data_found.dart';
import 'package:madathil/utils/util_functions.dart';
import 'package:madathil/view/screens/common_widgets/custom_appbarnew.dart';
import 'package:madathil/view/screens/common_widgets/custom_buttons.dart';
import 'package:madathil/view/screens/homepage/homepage.dart';
import 'package:madathil/view/screens/ongoing_transaction/widgets/refersh_button.dart';
import 'package:madathil/view/screens/payment_mode/payment_succes.dart';
import 'package:madathil/viewmodel/product_viewmodel.dart';
import 'package:provider/provider.dart';

class OngoingTransactionScreen extends StatefulWidget {
  final PaymentMessage? paymentMessage;
  const OngoingTransactionScreen({super.key, this.paymentMessage});

  @override
  State<OngoingTransactionScreen> createState() =>
      _OngoingTransactionScreenState();
}

class _OngoingTransactionScreenState extends State<OngoingTransactionScreen> {
  @override
  void initState() {
    // TODO: implement initState

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Provider.of<ProductViewmodel>(context, listen: false).clearOngoing();

      Provider.of<ProductViewmodel>(context, listen: false)
          .getOngoingTransaction(
              paymentId: widget.paymentMessage?.salesInvoice ?? '');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      child: Scaffold(
        appBar: const CustomAppBar(
          title: "Ongoing Transaction",
        ),
        body: Consumer<ProductViewmodel>(builder: (ctx, pvm, _) {
          if (pvm.isLoading) {
            return const CustomLoader();
          } else if (pvm.transactionData!.isEmpty ||
              pvm.transactionData == null) {
            return NoDataFOund(
              onRefresh: () {
                Provider.of<ProductViewmodel>(context, listen: false)
                    .clearOngoing();

                Provider.of<ProductViewmodel>(context, listen: false)
                    .getOngoingTransaction(
                        paymentId: widget.paymentMessage?.salesInvoice ?? '');
              },
            );
          }
          return RefreshIndicator(
            color: AppColors.primeryColor,
            onRefresh: () async {
              Provider.of<ProductViewmodel>(context, listen: false)
                  .clearOngoing();

              Provider.of<ProductViewmodel>(context, listen: false)
                  .getOngoingTransaction(
                      paymentId: widget.paymentMessage?.salesInvoice ?? '');
            },
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Text("Total Amount",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: AppColors.grey, fontSize: 16)),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                        "₹ ${pvm.transactionData?.first.amount?.toStringAsFixed(2) ?? '0.00'}",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: AppColors.black,
                            fontSize: 35,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.grey.withOpacity(0.5),
                          ),
                          borderRadius: BorderRadius.circular(30)),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _getPaymentIcon(pvm.transactionData?.first.status),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                                _getStringForTransaction(
                                    pvm.transactionData?.first.status),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                        color: AppColors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal))
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 20),
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 7,
                                offset: const Offset(
                                    0, 3), // changes position of shadow
                              ),
                            ],
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.white),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Row(
                                children: [
                                  Text("Time & Date",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                            color: AppColors.grey,
                                          )),
                                  const Spacer(),
                                  Text(
                                      DateFormat('h:mm a, dd MMM yyyy')
                                          .format(DateTime.now()),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                            color: AppColors.black,
                                          )),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Row(
                                children: [
                                  Text("Customer Name",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                            color: AppColors.grey,
                                          )),
                                  const Spacer(),
                                  Text(
                                      pvm.transactionData?.first.customerName ??
                                          '',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                            color: AppColors.black,
                                          )),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Row(
                                children: [
                                  Text("Customer Number",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                            color: AppColors.grey,
                                          )),
                                  const Spacer(),
                                  Text(
                                      pvm.transactionData?.first
                                              .customerContact ??
                                          '',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                            color: AppColors.black,
                                          )),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Row(
                                children: [
                                  Text("Customer email Id",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                            color: AppColors.grey,
                                          )),
                                  const Spacer(),
                                  Text(
                                      pvm.transactionData?.first
                                              .customerEmail ??
                                          '',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                            color: AppColors.black,
                                          )),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Row(
                                children: [
                                  Text(
                                    "Link",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          color: AppColors.grey,
                                        ),
                                  ),
                                  const Spacer(),
                                  GestureDetector(
                                    onTap: () {
                                      if (pvm.transactionData?.first.shortUrl !=
                                          null) {
                                        Clipboard.setData(
                                          ClipboardData(
                                              text: pvm.transactionData?.first
                                                      .shortUrl ??
                                                  ''),
                                        );
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                              content: Text(
                                                  'Link copied to clipboard')),
                                        );
                                      }
                                    },
                                    child: Row(
                                      children: [
                                        Text(
                                          pvm.transactionData?.first.shortUrl ??
                                              '',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                                color: AppColors.blue,
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                        ),
                                        const SizedBox(width: 5),
                                        const Icon(
                                          Icons.copy,
                                          color: AppColors.grey,
                                          size: 18,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    pvm.transactionData?.first.status != 'paid'
                        ? Text(
                            '*The payment link is sent to the customer once the payment is completed. Please press the refresh button to update the payment status.',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    color: AppColors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal),
                            textAlign: TextAlign.justify,
                          )
                        : const SizedBox(),
                    const Spacer(),
                    pvm.transactionData?.first.status == 'paid' ||
                            pvm.transactionData?.first.status ==
                                'partially_paid'
                        ? CustomButton(
                            text: 'Next',
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const PaymentSuccess(),
                                  ));
                            },
                          )
                        : RefreshButton(
                            text: "Refresh",
                            onPressed: () {
                              Provider.of<ProductViewmodel>(context,
                                      listen: false)
                                  .clearOngoing();

                              Provider.of<ProductViewmodel>(context,
                                      listen: false)
                                  .getOngoingTransaction(
                                      paymentId:
                                          widget.paymentMessage?.salesInvoice ??
                                              '')
                                  .then((value) {
                                if (value) {
                                  if (pvm.transactionData?.first.status ==
                                      'cancelled') {
                                    toast("Sorry, your payment failed", context,
                                        isError: true);

                                    pvm.clearamount();

                                    showPaymentFailedDialog(context);
                                  } else if (pvm
                                          .transactionData?.first.status ==
                                      'expired') {
                                    toast("Sorry, your payment has expired",
                                        context,
                                        isError: true);

                                    pvm.clearamount();
                                    showPaymentExpiredDialog(context);
                                  }
                                } else {
                                  toast(pvm.errormsg, context, isError: true);
                                }
                              });
                            },
                          )
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

Widget _getPaymentIcon(String? name) {
  switch (name) {
    case "paid":
      return Image.asset(
        AppImages.success,
        height: 15,
      );

    case "created":
      return Image.asset(
        AppImages.pendingPayment,
        height: 15,
      );

    case "partially_paid":
      return Image.asset(
        AppImages.partiallyPaid,
        height: 15,
      );

    case "expired":
      return Image.asset(
        AppImages.paymentExpired,
        height: 15,
      );

    case "cancelled":
      return Image.asset(
        AppImages.paymentCancelled,
        height: 15,
      );

    default:
      return const Icon(Icons.close_rounded,
          color: AppColors.red, size: 50.0); // Default icon
  }
}

String _getStringForTransaction(String? name) {
  switch (name) {
    case "paid":
      return "Successful";
    case "created":
      return "Pending";
    case "partially_paid":
      return "Partially Paid";
    case "expired":
      return "Expired";
    case "cancelled":
      return "Failed";

    default:
      return "Cancelled";
  }
}

void showPaymentFailedDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: const EdgeInsets.all(24),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.error_outlined,
                  color: AppColors.red,
                  size: 30,
                ),
                const SizedBox(width: 10),
                Text("Payment Failed",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: AppColors.red,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              "Unfortunately, your payment could not be processed. Please try again or contact support for assistance.",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: AppColors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.normal),
            ),
            const SizedBox(height: 24),
            CustomButton(
              text: 'OK',
              onPressed: () {
                Provider.of<ProductViewmodel>(context, listen: false)
                    .clearOngoing();
                Provider.of<ProductViewmodel>(context, listen: false)
                    .clearamount();
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const HomePage()));
              },
            )
          ],
        ),
      );
    },
  );
}

void showPaymentExpiredDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: const EdgeInsets.all(24),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.error_outline,
                  color: AppColors.amber,
                  size: 30,
                ),
                const SizedBox(width: 10),
                Text(
                  "Payment Expired",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: AppColors.amber,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              "The payment link has expired. Please try making the payment again or contact support if you need further assistance.",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: AppColors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.normal),
            ),
            const SizedBox(height: 24),
            CustomButton(
              text: 'OK',
              onPressed: () {
                Provider.of<ProductViewmodel>(context, listen: false)
                    .clearOngoing();
                Provider.of<ProductViewmodel>(context, listen: false)
                    .clearamount();
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const HomePage()));
              },
            )
          ],
        ),
      );
    },
  );
}
