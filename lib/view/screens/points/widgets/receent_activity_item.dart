import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/utils/custom_loader.dart';
import 'package:madathil/utils/no_data_found.dart';
import 'package:madathil/view/screens/common_widgets/custom_images.dart';
import 'package:madathil/view/screens/points/points_details_screen.dart';
import 'package:madathil/viewmodel/common_viewmodel.dart';
import 'package:provider/provider.dart';

class ReceentActivityItem extends StatefulWidget {
  const ReceentActivityItem({super.key});

  @override
  State<ReceentActivityItem> createState() => _ReceentActivityItemState();
}

class _ReceentActivityItemState extends State<ReceentActivityItem> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<CommonDataViewmodel>(context, listen: false).clearPointList();
      Provider.of<CommonDataViewmodel>(context, listen: false).getPointsList();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CommonDataViewmodel>(builder: (ctx, cdv, _) {
      if ((cdv.closingStatements ?? []).isEmpty) {
        if (cdv.isloading!) {
          return const Center(
            child: CustomLoader(),
          );
        }
        return Center(
          child: NoDataFOund(
            onRefresh: () {
              Provider.of<CommonDataViewmodel>(context, listen: false)
                  .clearPointList();
              Provider.of<CommonDataViewmodel>(context, listen: false)
                  .getPointsList();
            },
          ),
        );
      }
      return RefreshIndicator(
        color: AppColors.primeryColor,
        onRefresh: () async {
          Provider.of<CommonDataViewmodel>(context, listen: false)
              .clearPointList();
          Provider.of<CommonDataViewmodel>(context, listen: false)
              .getPointsList();
        },
        child: ListView.separated(
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 10,
              );
            },
            itemCount: cdv.closingStatements!.length,
            itemBuilder: (context, index) {
              var item = cdv.closingStatements![index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PointsDetailsScreen(
                                  pointsMessage: item,
                                )));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: AppColors.grey300,
                            blurRadius: 5.0,
                            offset: Offset(0, 3),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const CustomPngImage(
                                imageName: "assets/images/points_star.png",
                                boxFit: BoxFit.fitWidth,
                                width: 60,
                                height: 60,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      "You Earned \n${item.holderPoints?.toDouble().round()} points",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge!
                                          .copyWith(
                                              height: 0,
                                              color: AppColors.black,
                                              fontSize:
                                                  15, // Responsive font size
                                              fontWeight: FontWeight.bold),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 5,),
                                  Text(item.item ?? 'N/A',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge!
                                          .copyWith(
                                              height: 0,
                                              color: AppColors.black,
                                              fontSize:
                                                  12, // Responsive font size
                                              fontWeight: FontWeight.normal))
                                ],
                              )
                            ],
                          ),
                          Text(
                              item.closingDate != null
                                  ? DateFormat('dd MMM yyyy').format(
                                      DateTime.parse(
                                          item.closingDate.toString()))
                                  : '',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                      height: 0,
                                      color: AppColors.grey,
                                      fontSize: 10, // Responsive font size
                                      fontWeight: FontWeight.normal))
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
      );
    });
  }
}
