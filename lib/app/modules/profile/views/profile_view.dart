import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:task_app/app/core/constants/images.dart';

import '../../../core/theme/colors.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return  Container(
        decoration: BoxDecoration(
            gradient: isDarkMode ? AppColors.appBgDarkColor : AppColors.appBgColor2),
        child: Scaffold(
            backgroundColor: isDarkMode
                ? AppColors.darkBgColor.withOpacity(0.1)
                : AppColors.appBarBGColor,
            body: CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  pinned: true,
                  floating: false,
                  backgroundColor: isDarkMode
                      ? AppColors.appDarkBgColor
                      : AppColors.appBarBGColor,
                  elevation: 0.0,
                  centerTitle: true,
                  title: Text(
                    "Task Details",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: isDarkMode
                            ? AppColors.textWhiteColor
                            : AppColors.textTitleColor),
                  ),
                  leading: IconButton(
                      icon: Icon(Icons.arrow_back_ios_new_sharp),
                      onPressed: () {
                        Get.back();
                      },
                      color: isDarkMode
                          ? AppColors.titleTextColor
                          : AppColors.iconLightBGColor),
                  // bottom: AppBar(
                  //   automaticallyImplyLeading: false,
                  //   backgroundColor: isDarkMode
                  //       ? AppColors.darkBgColor.withOpacity(0.1)
                  //       : AppColors.appBarBGColor,
                  //   elevation: 0.0,
                  //   toolbarHeight: 50,
                  //   titleSpacing: 0.0,
                  //   title: Container(
                  //     //height: 50,
                  //     decoration: BoxDecoration(
                  //       gradient: isDarkMode
                  //           ? AppColors.cardBgDarkColor
                  //           : AppColors.cardBgLightColor2,
                  //       borderRadius: BorderRadius.only(
                  //           topLeft: Radius.circular(50.0),
                  //           topRight: Radius.circular(50.0)),
                  //     ),
                  //     child: Column(
                  //       children: [
                  //         Padding(
                  //           padding: const EdgeInsets.only(
                  //               top: 22, bottom: 4, left: 40, right: 40),
                  //           child: Row(
                  //             crossAxisAlignment: CrossAxisAlignment.center,
                  //             children: [
                  //               Text(
                  //                 "Supplox",
                  //                 style: TextStyle(
                  //                     fontSize: 18,
                  //                     fontWeight: FontWeight.w600,
                  //                     color: isDarkMode
                  //                         ? AppColors.titleTextColor
                  //                         : AppColors.textTitleColor),
                  //               ),
                  //               const Spacer(),
                  //               Row(
                  //                 children: [
                  //                   Text(
                  //                     "Date:",
                  //                     style: TextStyle(
                  //                         fontSize: 11,
                  //                         fontWeight: FontWeight.w400,
                  //                         color: AppColors.titleTextColor),
                  //                   ),
                  //                   SizedBox(
                  //                     width: 3,
                  //                   ),
                  //                   Text(
                  //                     "21st Sep, 2022",
                  //                     style: TextStyle(
                  //                         fontSize: 12,
                  //                         fontWeight: FontWeight.w400,
                  //                         color: isDarkMode
                  //                             ? AppColors.textWhiteColor
                  //                             : AppColors.textFieldTextColor),
                  //                   )
                  //                 ],
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //         Padding(
                  //           padding:
                  //           const EdgeInsets.only(left: 22.0, right: 22.0),
                  //           child: Divider(
                  //             color: isDarkMode
                  //                 ? AppColors.dividerDarkColor
                  //                 : AppColors.dividerLightColor,
                  //             thickness: 0.5,
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: isDarkMode
                          ? AppColors.cardBgDarkColor
                          : AppColors.cardBgLightColor2,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50.0),
                          topRight: Radius.circular(50.0)),
                    ),
                    child:SingleChildScrollView(
                      child: Column(
                        children: [
                          profileView(),
                          const SizedBox(height: 50,)
                        ],
                      ),
                    ),
                  ),
                )
              ],
            )));
  }

  Widget profileView() {
    return Column(
      children: [
          SizedBox(
            height: 130,
            width: 130,
            child: CircleAvatar(
              backgroundColor:AppColors.imageBorderColor,
                child: CircleAvatar(
                  backgroundImage: AssetImage(AppImages.profileFemalePNG),
                  radius: 60,
                ),
            ),
          ),
        Text("Casiel Checoni",
        style: TextStyle(
          fontSize:24,
          fontWeight: FontWeight.w400,
          color: AppColors.textFieldTextColor
        ),)
      ],
    );
  }
}
