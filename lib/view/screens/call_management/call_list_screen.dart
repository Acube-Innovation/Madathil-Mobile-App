import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/utils/color/util_functions.dart';
import 'package:madathil/view/screens/call_management/add_call_details_screen.dart';
import 'package:madathil/view/screens/call_management/widgets/call_item_widget.dart';
import 'package:madathil/view/screens/common_widgets/custom_appbarnew.dart';
import 'package:madathil/view/screens/common_widgets/custom_images.dart';
import 'package:madathil/viewmodel/common_viewmodel.dart';
import 'package:provider/provider.dart';

class CallListScreen extends StatefulWidget {
  const CallListScreen({super.key});

  @override
  State<CallListScreen> createState() => _CallListScreenState();
}

class _CallListScreenState extends State<CallListScreen> {
  String? _selectedDate;

  // Function to handle date selection
  void _handleDateSelected(DateTime date) {
    setState(() {
      _selectedDate =
          DateFormat('dd MMM yyyy').format(date); // Format the selected date
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Call List",
        actions: [
          Padding(
            padding: const EdgeInsets.all(13.0),
            child: InkWell(
              onTap: () {
                UtilFunctions.selectDate(context, _handleDateSelected);
              },
              child: const CustomPngImage(
                imageName: "assets/images/calendar.png",
                boxFit: BoxFit.contain,
                height: 10,
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<CommonDataViewmodel>(context, listen: false)
              .clearReminder();
          Provider.of<CommonDataViewmodel>(context, listen: false)
              .disposeControllers();

          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const AddCallDetailsScreen()));
        },
        backgroundColor: AppColors.primeryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            SizedBox(
              height: 46,
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(left: 30),
                  suffixIcon: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.primeryColor,
                      ),
                      child: const Icon(
                        Icons.search,
                        color: Colors.white,
                      )),
                  enabled: true,
                  disabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    borderSide: BorderSide(color: AppColors.black),
                  ),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    borderSide: BorderSide(color: AppColors.grey, width: 1),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    borderSide: BorderSide(color: AppColors.grey, width: 1),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    borderSide:
                        BorderSide(color: AppColors.primeryColor, width: 1),
                  ),
                  errorBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    borderSide: BorderSide(color: AppColors.red),
                  ),
                  hintText: "Search",
                  counterText: "",
                  hintStyle: const TextStyle(
                    // fontFamily: "SF Pro Display",
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    height: 1.275,
                    color: AppColors.grey,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            const Expanded(child: CallItemWidget())
          ],
        ),
      ),
    );
  }
}
