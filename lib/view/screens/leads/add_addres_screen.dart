import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:madathil/model/model_class/api_response_model/address_list_response.dart';
import 'package:madathil/model/model_class/api_response_model/leads_detail_response.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/utils/color/util_functions.dart';
import 'package:madathil/view/screens/common_widgets/custom_appbarnew.dart';
import 'package:madathil/view/screens/common_widgets/custom_buttons.dart';
import 'package:madathil/view/screens/common_widgets/custom_text_field.dart';
import 'package:madathil/viewmodel/leads_viewmodel.dart';
import 'package:provider/provider.dart';

class AddAddressScreen extends StatefulWidget {
  final bool? isEdit;
  final LeadsDetailsData? data;
  final AddressDetails? details;

  const AddAddressScreen({super.key, this.isEdit, this.data, this.details});

  @override
  _AddAddressScreenState createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  final TextEditingController addrline1 = TextEditingController();
  final TextEditingController addrline2 = TextEditingController();
  final TextEditingController cityctrls = TextEditingController();
  final TextEditingController stateCtrls = TextEditingController();
  final TextEditingController cntryCtrls = TextEditingController();
  final TextEditingController pinCtrls = TextEditingController();
  final GlobalKey<FormState> formKey1 = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    if (widget.isEdit == true) {
     log("lead id${widget.data?.name}");
      addrline1.text = widget.details?.addressLine1 ?? '';
      addrline2.text = widget.details?.addressLine2 ?? '';
      cityctrls.text = widget.details?.city ?? '';
      stateCtrls.text = widget.details?.state ?? '';
      cntryCtrls.text = widget.details?.country ?? '';
      pinCtrls.text = widget.details?.pincode ?? '';
    } else {
      log("lead id${widget.data?.name}");
      cntryCtrls.text = "India";
      stateCtrls.text = "Kerala";
    }
  }

  @override
  void dispose() {
    addrline1.dispose();
    addrline2.dispose();
    cityctrls.dispose();
    stateCtrls.dispose();
    cntryCtrls.dispose();
    pinCtrls.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          CustomAppBar(title: widget.isEdit! ? "Edit Address" : "Add Address"),
      body: SingleChildScrollView(
        child: Form(
          key: formKey1,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildLabel(context, "Address Line 1"),
                const SizedBox(height: 5),
                CustomTextField(
                  maxLines: 4,
                  maxLength: 100,
                  controller: addrline1,
                  hint: 'Enter address line 1',
                  validator: UtilFunctions.validateAddress,
                ),
                const SizedBox(height: 10),
                _buildLabel(context, "Address Line 2"),
                const SizedBox(height: 5),
                CustomTextField(
                  maxLines: 4,
                  maxLength: 100,
                  controller: addrline2,
                  hint: 'Enter address line 2',
                  validator: UtilFunctions.validateAddress,
                ),
                const SizedBox(height: 10),
                _buildLabel(context, "City"),
                const SizedBox(height: 5),
                CustomTextField(
                  controller: cityctrls,
                  hint: 'Enter city',
                  validator: UtilFunctions.validateCity,
                ),
                const SizedBox(height: 10),
                _buildLabel(context, "State"),
                const SizedBox(height: 5),
                CustomTextField(
                  controller: stateCtrls,
                  hint: 'Enter state',
                  validator: UtilFunctions.validateState,
                ),
                const SizedBox(height: 10),
                _buildLabel(context, "Country"),
                const SizedBox(height: 5),
                CustomTextField(
                  readOnly: true,
                  keyboardType: TextInputType.none,
                  controller: cntryCtrls,
                  hint: 'Enter country',
                  validator: UtilFunctions.validateCountry,
                ),
                const SizedBox(height: 10),
                _buildLabel(context, "PIN Code"),
                const SizedBox(height: 5),
                CustomTextField(
                  controller: pinCtrls,
                  keyboardType: TextInputType.number,
                  hint: 'Enter pin',
                  validator: UtilFunctions.validatepincodePR,
                ),
                const SizedBox(height: 25),
                Consumer<LeadsViewmodel>(
                  builder: (ctx, lvm, _) {
                    return CustomButton(
                      height: 43,
                      text: "Submit",
                      onPressed: () async {
                        if (formKey1.currentState!.validate()) {
                          if (widget.isEdit == true) {
                            UtilFunctions.loaderPopup(context);
                            await lvm
                                .addAdress(
                                    id: widget.details?.name,
                                    addrline1: addrline1.text,
                                    addrline2: addrline2.text,
                                    city: cityctrls.text,
                                    state: stateCtrls.text,
                                    country: cntryCtrls.text,
                                    pin: pinCtrls.text,
                                    isEdit: true)
                                .then((value) {
                              Navigator.pop(context); // Close loader
                              if (value) {
                                toast("Address updated successfully!", context);
                                Navigator.pop(context);
                                log("lead id${widget.data?.name}");
                                Provider.of<LeadsViewmodel>(context,
                                        listen: false)
                                    .getAddressList(leadId: widget.data?.name);
                              } else {
                                toast(lvm.errormsg ?? "Failed!", context,
                                    isError: true);
                              }
                            });
                          } else {
                            UtilFunctions.loaderPopup(context);
                            log("lead id${widget.data?.name}");

                            await lvm
                                .addAdress(
                                    leadId: widget.data?.name,
                                    addrline1: addrline1.text,
                                    addrline2: addrline2.text,
                                    city: cityctrls.text,
                                    state: stateCtrls.text,
                                    country: cntryCtrls.text,
                                    pin: pinCtrls.text,
                                    isEdit: false)
                                .then((value) {
                              Navigator.pop(context); // Close loader
                              if (value) {
                                toast("Address added successfully!", context);
                                Navigator.pop(context);
                                Provider.of<LeadsViewmodel>(context,
                                        listen: false)
                                    .getAddressList(leadId: widget.data?.name);
                              } else {
                                toast(lvm.errormsg ?? "Failed!", context,
                                    isError: true);
                              }
                            });
                          }
                        } else {
                          toast("Required fields are missing!", context,
                              isError: true);
                        }
                      },
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(BuildContext context, String text) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodySmall!.copyWith(
            height: 1.7,
            color: AppColors.grey,
          ),
    );
  }
}
