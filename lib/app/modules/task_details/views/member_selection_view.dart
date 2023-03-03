
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:task_app/app/core/constants/images.dart';
import '../../../core/theme/colors.dart';
import '../controllers/member_selection_controller.dart';

class MemberSelectionView extends GetView<MemberSelectionController> {
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Container(
        decoration: BoxDecoration(
            gradient:
            isDarkMode ? AppColors.appBgDarkColor : AppColors.appBgColor2),
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
                    "Members List",
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
                  bottom: AppBar(
                    automaticallyImplyLeading: false,
                    backgroundColor: isDarkMode
                        ? AppColors.darkBgColor.withOpacity(0.1)
                        : AppColors.appBarBGColor,
                    elevation: 0.0,
                    toolbarHeight: 100,
                    titleSpacing: 0.0,
                    title: Container(
                      //height: 50,
                      decoration: BoxDecoration(
                        gradient: isDarkMode
                            ? AppColors.cardBgDarkColor
                            : AppColors.cardBgLightColor2,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50.0),
                            topRight: Radius.circular(50.0)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 22, bottom: 4, left: 40, right: 40),
                            child: Text(
                              "Designers",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: isDarkMode
                                      ? AppColors.titleTextColor
                                      : AppColors.textTitleColor),
                            ),
                          ),
                          Padding(
                            padding:
                            const EdgeInsets.only(left: 22.0, right: 22.0),
                            child: Divider(
                              color: isDarkMode
                                  ? AppColors.dividerDarkColor
                                  : AppColors.dividerLightColor,
                              thickness: 0.5,
                            ),
                          ),
                          Padding(
                            padding:  const EdgeInsets.only(left: 20.0, right: 20.0),
                            child: customSearchBar(context),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      gradient: isDarkMode
                          ? AppColors.cardBgDarkColor
                          : AppColors.cardBgLightColor2,
                    ),
                    child:  SingleChildScrollView(
                      padding:  const EdgeInsets.only(left: 20.0, right: 20.0),
                      child: Column(
                        children: [
                          const SizedBox(height: 10),
                          ListView.builder(
                              itemCount: controller.memberList.length,
                              padding: const EdgeInsets.only(bottom: 10,top: 10),
                              shrinkWrap: true,
                              itemBuilder: (context,index) {
                                return  memberCardView(context,controller.memberList[index]);
                              })
                        ],
                      ),
                    ),
                    ),
                  ),
              ],
            )));

  }


  Widget customSearchBar(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            // showSearch(
            //     context: context,
            //     delegate: SearchWidget(
            //     context: context,
            //     streamController: memberListController.streamController,
            // ));
          },
          child: Container(
            height: 36,
            padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14.0),
                color: isDarkMode ?
                AppColors.toggleDarkBGColor:
                AppColors.appBarBGColor),
            child: Row(
              children: [
                SvgPicture.asset(
                  isDarkMode?
                  AppImages.searchDarkIconSVG:
                  AppImages.searchLightIconSVG,),
                const SizedBox(width: 11,),
                Text("Search" ,
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.titleTextColor
                  ),
                ),
              ],
            ),

          ),
        ),

      ],
    );
  }


  Widget memberCardView(BuildContext context,Map member){
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Obx(() => InkWell(
        onTap: () {
          controller.isMemberSelected.value = !controller.isMemberSelected.value;
        },
        child: Container(
          height: 62,
          margin: EdgeInsets.only(bottom: 8),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              // gradient : isDarkMode?
              //           AppColors.membersCardDarkBgColors:
              //           AppColors.membersCardLightBgColors,
              color:
              isDarkMode?
              controller.isMemberSelected.value?
              AppColors.teamBgColor2:
              AppColors.toggleDarkBGColor:
              !controller.isMemberSelected.value?
              AppColors.textWhiteColor:
              AppColors.teamBgColor1

          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0,left: 16.0,bottom: 8.0,right: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 4.2.h,
                  width: 4.2.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.0),
                      border: Border.all(
                          width: 2.0, color: AppColors.teamBgColor1)),
                  child: CircleAvatar(
                      backgroundColor:AppColors.appPrimaryColor,
                      child:  CircleAvatar(
                        backgroundImage: AssetImage(AppImages.profileFemalePNG),
                      )
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(member["name"],
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color:
                          isDarkMode?
                          AppColors.textWhiteColor:
                          AppColors.textFieldTextColor
                      ),),
                    const SizedBox(height: 1),
                    Text(member["position"],
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: AppColors.titleTextColor
                      ),)
                  ],
                ),
                const Spacer(),
                Container(
                  height: 18,
                  width: 18,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          width: 1,
                          color: isDarkMode?
                          AppColors.titleTextColor:
                          AppColors.checkBoxBorderColor
                      ),
                      color: isDarkMode?
                      AppColors.toggleDarkBGColor:
                      AppColors.textWhiteColor
                  ),
                  child: controller.isMemberSelected.value?
                  Icon(
                      Icons.check_rounded,
                      color: isDarkMode?
                      AppColors.titleTextColor:
                      AppColors.timelineBgColor,
                      size: 12):
                  Icon(
                      Icons.add,
                      color: isDarkMode?
                      AppColors.titleTextColor:
                      AppColors.timelineBgColor,
                      size: 12)
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

}
