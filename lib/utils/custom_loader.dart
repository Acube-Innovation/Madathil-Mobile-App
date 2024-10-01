import 'package:flutter/cupertino.dart';
import 'package:madathil/utils/color/app_colors.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        height: 130,
        width: 130,
        child: CupertinoActivityIndicator(
          color: AppColors.primeryColor,
          radius: 10,
        ),
        // child: Lottie.asset('assets/json/loader.json'),
      ),
    );
  }
}
