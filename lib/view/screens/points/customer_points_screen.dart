import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/utils/color/util_functions.dart';
import 'package:madathil/view/screens/common_widgets/custom_appbarnew.dart';
import 'package:madathil/view/screens/common_widgets/custom_images.dart';
import 'package:madathil/view/screens/points/widgets/points_card.dart';
import 'package:madathil/view/screens/points/widgets/receent_activity_item.dart';

class CustomerPointsScreen extends StatefulWidget {
  const CustomerPointsScreen({super.key});

  @override
  State<CustomerPointsScreen> createState() => _CustomerPointsScreenState();
}

class _CustomerPointsScreenState extends State<CustomerPointsScreen> {
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
          title: "Points",
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
                  height: 5,
                ),
              ),
            )
          ],
        ),
        body:  Padding(
          padding: EdgeInsets.all(20.0),
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
        
              PointsCard(points: "1204 pts"),
              SizedBox(height: 30,),
              Text("Recent Activity", style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    height: 0,
                    color: AppColors.primeryColor,
                    fontSize: 16, 
                    fontWeight: FontWeight.w600)),
        
                    SizedBox(height: 20,),
        
                    const Expanded( child: const ReceentActivityItem())
        
        
        
        
            
            ],
          ),
        ));
  }
}
