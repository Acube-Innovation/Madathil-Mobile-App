import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:madathil/view/screens/common_widgets/custom_appbarnew.dart';
import 'package:madathil/view/screens/leads/components/other_leads.dart';

class LeadDetails extends StatelessWidget {
  const LeadDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: CustomAppBar(title: "Lead List"),
      body: OtherLeads(),
    );
  }
}