import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:madathil/model/model_class/api_response_model/leads_detail_response.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/view/screens/common_widgets/custom_appbarnew.dart';
import 'package:madathil/view/screens/leads/add_addres_screen.dart';
import 'package:madathil/view/screens/leads/components/address_item.dart';

class AddresContactScreen extends StatelessWidget {
  final LeadsDetailsData? data;
  const AddresContactScreen({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Addresses"),
      floatingActionButton: FloatingActionButton(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15))),
          backgroundColor: AppColors.primeryColor,
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AddAddressScreen(
                          isEdit: false,
                          data: data,
                        )));
          }),
      body: Column(
        children: [
          Expanded(
              child: AddressItem(
            data: data,
          ))
        ],
      ),
    );
  }
}
