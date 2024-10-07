import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:madathil/app_images.dart';
import 'package:madathil/constants.dart';
import 'package:madathil/model/services/api_service/api_urls.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/view/screens/common_widgets/custom_appbarnew.dart';
import 'package:madathil/view/screens/common_widgets/custom_images.dart';
import 'package:madathil/view/screens/profile/widgets/detail_card.dart';
import 'package:madathil/viewmodel/common_viewmodel.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<CommonDataViewmodel>(context, listen: false)
          .clearprofileDate();

      Provider.of<CommonDataViewmodel>(context, listen: false)
          .getProfileDetails();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.secondaryColor,
          ),
        ),
        title: "Profile Details",
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Consumer<CommonDataViewmodel>(builder: (ctx, cdv, _) {
            return cdv.isloading!
                ? const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.secondaryColor,
                    ),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          height: 80,
                          width: 80,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.secondaryColor,
                          ),
                          child: Center(
                            child: CircleAvatar(
                              radius: 60,
                              backgroundImage: cdv.profileData?.image != null &&
                                      cdv.profileData!.image!.isNotEmpty
                                  ? NetworkImage(
                                      "${ApiUrls.kProdBaseURL}${cdv.profileData?.image}")
                                  : const AssetImage(AppImages.maleEmployee),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Text(
                          cdv.profileData?.fullName ?? 'N/A',
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    height: 1.7,
                                    color: AppColors.black,
                                  ),
                        ),
                      ),
                      Center(
                        child: Text(
                          username ?? '',
                          style:
                              Theme.of(context).textTheme.labelMedium!.copyWith(
                                    height: 1.7,
                                    color: AppColors.grey,
                                  ),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          "Contact Details",
                          style:
                              Theme.of(context).textTheme.labelMedium!.copyWith(
                                    height: 1.7,
                                    color: AppColors.grey,
                                  ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      ProfileCards(
                        data: "Phone Number",
                        value: cdv.profileData?.mobileNo ?? 'N/A',
                        data2: "Address",
                        value2: cdv.profileData?.address ?? 'N/A',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          "Identifiers",
                          style:
                              Theme.of(context).textTheme.labelMedium!.copyWith(
                                    height: 1.7,
                                    color: AppColors.grey,
                                  ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      ProfileCards(
                        data: "PAN Number",
                        value: cdv.profileData?.pan ?? 'N/A',
                        data2: "Aadhar Number",
                        value2: cdv.profileData?.aadharNumber ?? 'N/A',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          "Personal Details",
                          style:
                              Theme.of(context).textTheme.labelMedium!.copyWith(
                                    height: 1.7,
                                    color: AppColors.grey,
                                  ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      ProfileCards(
                        data: "Date of Birth",
                        value: cdv.profileData?.dateOfBirth != null
                            ? DateFormat('dd MMM yyyy').format(DateTime.parse(
                                cdv.profileData?.dateOfBirth?.toString() ?? ''))
                            : '',
                        data2: "Consumer Number",
                        value2: "N/A",
                      )
                    ],
                  );
          }),
        ),
      ),
    );
  }
}
