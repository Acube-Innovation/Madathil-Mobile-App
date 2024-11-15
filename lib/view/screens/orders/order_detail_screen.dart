import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:madathil/app_images.dart';
import 'package:madathil/model/model_class/api_response_model/get_order_response.dart';
import 'package:madathil/model/services/api_service/api_urls.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/utils/color/util_functions.dart';
import 'package:madathil/view/screens/common_widgets/custom_appbarnew.dart';
import 'package:madathil/view/screens/common_widgets/custom_buttons.dart';
import 'package:madathil/view/screens/common_widgets/custom_images.dart';
import 'package:madathil/view/screens/common_widgets/custom_text_field.dart';
import 'package:madathil/view/screens/orders/widgets/invoice_widgets.dart';
import 'package:madathil/view/screens/payment_mode/payment_mode.dart';
import 'package:madathil/viewmodel/order_viewmodel.dart';
import 'package:madathil/viewmodel/product_viewmodel.dart';
import 'package:path_provider/path_provider.dart';

import 'package:provider/provider.dart';
import 'package:open_file/open_file.dart';
import 'package:fluttertoast/fluttertoast.dart';

class OrderDetailScreen extends StatefulWidget {
  final OrderList? item;
  const OrderDetailScreen({super.key, this.item});

  @override
  State<OrderDetailScreen> createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<OrderDetailScreen> {
  @override
  void didChangeDependencies() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Provider.of<OrderViewmodel>(context, listen: false)
          .getOrderDetail(widget.item?.name);
    });

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final orderVM = Provider.of<OrderViewmodel>(context, listen: false);
    final productVm = Provider.of<ProductViewmodel>(context, listen: false);
    return Scaffold(
      appBar: const CustomAppBar(title: "Order Details"),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Consumer<OrderViewmodel>(builder: (context, ovm, _) {
          var address = ovm.orderDetail?.customerAddress;
          return ovm.isLoading
              ? const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CupertinoActivityIndicator(color: AppColors.primeryColor),
                      SizedBox(height: 10),
                      Text("Loading..!")
                    ],
                  ),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: ovm.item.length > 1 ? 300 : 150,
                      child: ListView.separated(
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              height: 10,
                            );
                          },
                          itemCount: ovm.item.length,
                          itemBuilder: (context, index) {
                            var pro = orderVM.item[index];
                            return Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      color: AppColors.bgColor,
                                      border:
                                          Border.all(color: AppColors.black),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: (pro.image != null) &&
                                          (pro.image!.isNotEmpty)
                                      ? Image.network(
                                          height: 127,
                                          width: 134,
                                          "${ApiUrls.kProdBaseURL}${pro.image}",
                                          fit: BoxFit.contain,
                                        )
                                      : const CustomPngImage(
                                          height: 127,
                                          width: 134,
                                          boxFit: BoxFit.contain,
                                          imageName: AppImages.placeHolder,
                                        ),
                                ),
                                const SizedBox(
                                  width: 30,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 120,
                                      child: Text(
                                        pro.itemName ?? "",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(
                                                color: AppColors.primeryColor),
                                      ),
                                    ),
                                    Text(
                                      pro.brand ?? "Madathil",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                            color: AppColors.black,
                                          ),
                                    ),
                                    Text(
                                      "${pro.qty?.toInt()}  ${pro.uom}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(
                                              color: AppColors.black,
                                              height: 1.7),
                                    ),
                                    Text(
                                      "\₹ ${pro.amount?.toInt()}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                            color: AppColors.black,
                                          ),
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                  ],
                                )
                              ],
                            );
                          }),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Divider(),
                    ),
                    Text(
                      "Customer",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: AppColors.grey,
                          ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.person,
                          color: AppColors.primeryColor,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          ovm.orderDetail?.customerName ?? "",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(color: AppColors.black, height: 1.7),
                        ),
                        const Spacer(),
                        // Container(
                        //   padding: const EdgeInsets.all(5),
                        //   decoration: BoxDecoration(
                        //       shape: BoxShape.circle,
                        //       color: AppColors.reefGold.withOpacity(0.1)),
                        //   child: const Icon(
                        //     Icons.arrow_forward_ios,
                        //     color: AppColors.reefGold,
                        //     size: 15,
                        //   ),
                        // ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Delivery Location",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: AppColors.grey,
                          ),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: AppColors.primeryColor,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: ovm.orderDetail?.customerAddress != null
                              ? SizedBox(
                                  width: 150,
                                  child: Text(
                                    "${address?.addressLine1}, ${address?.addressLine2}, ${address?.city},${address?.state},${address?.country},${address?.pincode}",
                                    // "VHC house, ABC Street  Kerala, India",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(
                                            color: AppColors.black,
                                            height: 1.7),
                                    maxLines: 4,
                                  ),
                                )
                              : const Text("N/A"),
                        ),
                        const Spacer(),
                        // Container(
                        //   padding: const EdgeInsets.all(5),
                        //   decoration: BoxDecoration(
                        //       shape: BoxShape.circle,
                        //       color: AppColors.reefGold.withOpacity(0.1)),
                        //   child: const Icon(
                        //     Icons.arrow_forward_ios,
                        //     color: AppColors.reefGold,
                        //     size: 15,
                        //   ),
                        // ),
                      ],
                    ),

                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Divider(),
                    ),
                    Text(
                      "Order Info",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: AppColors.black, height: 1.7),
                    ),
                    Row(
                      children: [
                        Text(
                          "Shipment Status",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: AppColors.grey, height: 1.7),
                        ),
                        const Spacer(),
                        Text(
                          ovm.orderDetail?.status ?? "",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: AppColors.black, height: 1.7),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        _getStatusIcon(ovm.orderDetail?.status)
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          "Delivery Date",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: AppColors.grey, height: 1.7),
                        ),
                        const Spacer(),
                        Text(

                           ovm.orderDetail?.deliveryDate != null
                                      ? DateFormat('dd MMM yyyy').format(
                                          DateTime.parse(
                                              ovm.orderDetail!.deliveryDate.toString()))
                                      : '',
                        //  ovm.orderDetail?.deliveryDate ?? 'N/A',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: AppColors.black, height: 1.7),
                        ),
                        // const SizedBox(
                        //   width: 28,
                        // ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Divider(),
                    ),
                    ovm.orderDetail?.invoice != null
                        ? InvoiceCard(invoice: ovm.orderDetail?.invoice)
                        : const SizedBox(),

                    const SizedBox(
                      height: 40,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ovm.orderDetail?.invoice != null
                            ? Expanded(
                                child: CustomButton(
                                  color: AppColors.reefGold,
                                  onPressed: () {
                                    UtilFunctions.loaderPopup(context);
                                    orderVM
                                        .getInvoice(
                                            ovm.orderDetail?.invoice?.name)
                                        .then((value) {
                                      Navigator.pop(context);
                                      if (value) {
                                        log("${orderVM.file?.path.toLowerCase()}");
                                        // downloadInvoice(context, orderVM.file);
                                        // _downloadAndOpenPDF(context,
                                        //     "${ApiUrls.kProdBaseURL}${orderVM.file?.path}");
                                        OpenFile.open(orderVM.file?.path);
                                      } else {
                                        toast(orderVM.errorMessage, context);
                                      }
                                    });
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        " Download Invoice",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(color: AppColors.white,fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            : const SizedBox(),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: CustomButton(
                            color: AppColors.primeryColor,
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext ctx) => Dialog(
                                      shape: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            const SizedBox(height: 10),
                                            Text('payment',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge!
                                                    .copyWith(
                                                        height: 1.7,
                                                        color: AppColors
                                                            .primeryColor)),
                                            const SizedBox(height: 20),
                                            Column(
                                              children: [
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                CustomTextField(
                                                  keyboardType:
                                                      TextInputType.number,
                                                  hint: "Enter amount",
                                                  controller: productVm
                                                      .amountController,
                                                  validator: UtilFunctions
                                                      .requiredField,
                                                ),
                                                const SizedBox(
                                                  height: 30,
                                                ),
                                                CustomButton(
                                                  text: "Submit",
                                                  onPressed: () {
                                                    if (productVm
                                                        .amountController
                                                        .text
                                                        .isNotEmpty) {
                                                      Navigator.of(context)
                                                          .pop();

                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                const PaymentModeScreen(
                                                              isfromCheckOut:
                                                                  false,
                                                            ),
                                                          ));
                                                    } else {
                                                      Fluttertoast.showToast(
                                                          gravity: ToastGravity
                                                              .CENTER_RIGHT,
                                                          backgroundColor:
                                                              AppColors.red,
                                                          textColor:
                                                              AppColors.white,
                                                          msg:
                                                              "Please enter Amount",
                                                          toastLength: Toast
                                                              .LENGTH_LONG);
                                                      // toast(
                                                      //     "Please Enter amount",
                                                      //     context);
                                                    }
                                                  },
                                                )
                                              ],
                                            ),
                                            const SizedBox(height: 10),
                                          ],
                                        ),
                                      )));
                            },
                            text: "Pay Dues" ,
                          ),
                        ),
                      ],
                    )
                    // : const SizedBox()
                  ],
                );
        }),
      )),
    );
  }

  // Future<void> downloadInvoice(BuildContext context, File? file) async {
  //   if (file != null && await file.exists()) {
  //     try {
  //       // Use the printing package to show download/share options
  //       await Printing.sharePdf(
  //         bytes: await file.readAsBytes(),
  //         filename: file.path.split('/').last,
  //       );
  //     } catch (e) {
  //       log(e.toString());
  //       // Handle any errors during the download
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(content: Text('Error downloading the PDF: $e')),
  //       );
  //     }
  //   } else {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(content: Text('PDF file not available')),
  //     );
  //   }
  // }

  // Future<void> _downloadAndOpenPDF(BuildContext context, String? url) async {
  //   try {
  //     final file = await downloadPDF(url ?? "", "sample.pdf");
  //     Navigator.pop(context);
  //     // Get.back(closeOverlays: true);
  //     // Get.to(PrivacyScreen(file: file.path));
  //   } catch (e) {
  //     Navigator.pop(context);
  //     print("Error opening PDF: $e");
  //   }
  // }

  // Future<File> downloadPDF(String url, String fileName) async {
  //   try {
  //     // Get the app's directory to save the downloaded file
  //     final directory = await getApplicationDocumentsDirectory();
  //     final filePath = '${directory.path}/$fileName';
  //     final file = File(filePath);

  //     // Download the PDF using Dio
  //     final dio = Dio();
  //     await dio.download(url, file.path);

  //     return file;
  //   } catch (e) {
  //     throw Exception("Error downloading PDF: $e");
  //   }
  // }

  Widget _getStatusIcon(String? name) {
    switch (name) {
      case "Draft":
        return const CustomPngImage(
          height: 25,
          width: 25,
          imageName: AppImages.statusShipping,
          boxFit: BoxFit.contain,
        );
      case "On Hold":
        return const CustomPngImage(
          height: 25,
          width: 25,
          imageName: AppImages.holdOrder,
          boxFit: BoxFit.contain,
        );
      case "To Deliver and Bill":
        return const CustomPngImage(
          height: 25,
          width: 25,
          imageName: AppImages.shippingIcon,
          boxFit: BoxFit.contain,
        );
      case "To Bill":
        return const CustomPngImage(
          height: 25,
          width: 25,
          imageName: AppImages.toBillOrder,
          boxFit: BoxFit.contain,
        );

      case "To Deliver":
        return const CustomPngImage(
          height: 25,
          width: 25,
          imageName: AppImages.shippingIcon,
          boxFit: BoxFit.contain,
        );
      case "Completed":
        return const Icon(
          Icons.task_alt,
          color: AppColors.malachit,
        );
      case "Cancelled":
        return const Icon(
          Icons.remove_shopping_cart,
          color: AppColors.red,
        );
      case "Closed":
        return const Icon(
          Icons.remove_circle,
          color: AppColors.red,
        );

      default:
        return const Icon(
          Icons.local_shipping,
          color: AppColors.amber,
        );
    }
  }
}
