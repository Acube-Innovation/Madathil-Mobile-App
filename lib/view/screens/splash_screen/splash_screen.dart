import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:madathil/constants.dart';
import 'package:madathil/model/services/local_db/hive_constants.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/view/screens/common_widgets/custom_images.dart';
import 'package:madathil/view/screens/homepage/homepage.dart';
import 'package:madathil/view/screens/login/login_screen.dart';
import 'package:madathil/viewmodel/common_viewmodel.dart';
import 'package:provider/provider.dart';

import 'package:shimmer/shimmer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 6), () {
      if (hiveInstance!.getData(DataBoxKey.cookie) != null &&
          roleProfile != null) {
        log(username.toString());

        String? mail = hiveInstance?.getData(DataBoxKey.kUserEmail);
        log("$mail");
        Provider.of<CommonDataViewmodel>(context, listen: false)
            .getHomeDetails(mail: mail)
            .then((value) {
          if (value) {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const HomePage()));
          } else {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                  builder: (context) =>
                      const LoginScreen()), // Navigate to LoginScreen
            );
          }
        });
      } else {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
              builder: (context) =>
                  const LoginScreen()), // Navigate to LoginScreen
        );
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomPngImage(
                imageName: 'assets/images/logo.png',
                height: 163,
                width: 163,
                boxFit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Shimmer.fromColors(
          baseColor: AppColors.primeryColor,
          highlightColor: AppColors.secondaryColor.withOpacity(0.2),
          period: const Duration(seconds: 3),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(4, (index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Container(
                  width: 35,
                  height: 8,
                  color: const Color(0xff466E20),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
