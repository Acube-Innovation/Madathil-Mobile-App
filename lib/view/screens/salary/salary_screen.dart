import 'package:flutter/material.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/utils/custom_loader.dart';
import 'package:madathil/utils/no_data_found.dart';
import 'package:madathil/view/screens/common_widgets/custom_appbarnew.dart';
import 'package:madathil/view/screens/salary/components/salary_list.dart';
import 'package:madathil/viewmodel/salary_viewmodel.dart';
import 'package:provider/provider.dart';

class SalaryScreen extends StatefulWidget {
  const SalaryScreen({super.key});

  @override
  State<SalaryScreen> createState() => _SalaryScreenState();
}

class _SalaryScreenState extends State<SalaryScreen> {
  bool _isInitialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isInitialized) {
      // Fetch data here after the widget tree is built
      Provider.of<SalaryViewmodel>(context, listen: false)
          .fetchMonthlySalaryList();
      _isInitialized = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Salary"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Consumer<SalaryViewmodel>(builder: (context, svm, _) {
          return RefreshIndicator(
            color: AppColors.primeryColor,
            onRefresh: () async {
              svm.clearSalaryList();
              svm.fetchMonthlySalaryList();
            },
            child: (svm.monthlySalaryListResponse?.message?.summary ?? [])
                    .isNotEmpty
                ? ListView.builder(
                    shrinkWrap: true,
                    itemCount:
                        (svm.monthlySalaryListResponse?.message?.summary ?? [])
                                .length +
                            1,
                    itemBuilder: (context, index) {
                      if (index ==
                          (svm.monthlySalaryListResponse?.message?.summary ??
                                  [])
                              .length) {
                        // if (svm.isLoadingSalaryListPagination) {
                        //   return const CustomLoader();
                        // } else {
                        //   if (!svm.reachedLastPageSalaryList) {
                        //     if (!svm.isLoadingSalaryListPagination) {
                        //       svm.fetchMonthlySalaryList();
                        //     }
                        //     return const CustomLoader();
                        //   }
                        // }
                      } else {
                        return SalaryListItem(
                            data: svm.monthlySalaryListResponse?.message
                                ?.summary![index]);
                      }
                      return null;
                    },
                  )
                : svm.isloading == true
                    ? const CustomLoader()
                    : NoDataFOund(
                        onRefresh: () {
                          svm.fetchMonthlySalaryList();
                        },
                      ),
          );
        }),
      ),
    );
  }
}
