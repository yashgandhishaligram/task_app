import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../core/constants/images.dart';
import '../core/theme/colors.dart';
import '../modules/admin_home/controllers/admin_home_controller.dart';
import 'custom_button.dart';
import 'custom_switch_widget.dart';
import 'package:sizer/sizer.dart';

class  CustomPunchWidget extends StatelessWidget implements PreferredSizeWidget {
  CustomPunchWidget({Key? key,required this.controller}) : super(key: key);
  AdminHomeController controller;
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor:
      isDarkMode ? AppColors.darkBgColor.withOpacity(0.1) : AppColors.appBarBGColor,
      elevation: 0.0,
      toolbarHeight: 50,
      titleSpacing: 0.0,
      title: Container(
        decoration: BoxDecoration(
          gradient: isDarkMode
              ? AppColors.cardBgDarkColor
              : AppColors.cardBgLightColor2,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50.0),
              topRight: Radius.circular(50.0)),
        ),
        child: Obx(() => Column(
          children: [
            Padding(
              padding:const EdgeInsets.only(top: 22.0,bottom: 7),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Punch In:",
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: AppColors.titleTextColor),
                  ),
                  const SizedBox(width: 3),
                  Text(
                    controller.punchInTime.value,
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: isDarkMode
                            ? AppColors.textWhiteColor
                            : AppColors.textFieldTextColor),
                  ),
                  const SizedBox(width: 12),
                  CustomSwitchWidget(
                    controller: controller,
                    title: "Contacts information updates",
                    onChanged: (bool value) {
                      if (value) {
                        confirmPunch(context,controller.punchInTime.value,controller.currentTime.value);
                      }else if (!value){
                        controller.punchInTime.value = controller.currentTime.value;
                        controller.saveInPunchTime(controller.punchInTime.value);
                      }
                    },
                  ),
                  const SizedBox(width: 12),
                  Text(
                    "Punch Out:",
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: AppColors.titleTextColor),
                  ),
                  const SizedBox(width: 3),
                  Text(
                    controller.punchOutTime.value,
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: isDarkMode
                            ? AppColors.textWhiteColor
                            : AppColors.textFieldTextColor),
                  ),
                  const SizedBox(width: 13),
                  InkWell(
                    onTap: () {},
                    child: SvgPicture.asset(
                      isDarkMode
                          ? AppImages.noteDarkIcon
                          : AppImages.noteLightIcon,
                      height: 20,
                      width: 20,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 22.0, right: 22.0),
              child: Divider(
                color: isDarkMode
                    ? AppColors.dividerDarkColor
                    : AppColors.dividerLightColor,
                thickness: 0.5,
              ),
            ),

          ],
        ),
        ),
      ),
    );
  }


  confirmPunch(context, String punchIn, String punchOut) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final currentTime = DateFormat("hh:mm a").format(DateTime.now());
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0))),
            content: SizedBox(
              height: 32.h,
              width: 0.2.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () {
                        controller.isPunchOut.value = false;
                        Get.back();
                      },
                      child: SvgPicture.asset(isDarkMode
                          ? AppImages.closeDarkIcon
                          : AppImages.closeLightIcon),
                    ),
                  ),
                  Text(
                    "Are you sure want to Punch out?",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                        color: AppColors.titleTextColor),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Punch In:  ",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: AppColors.titleTextColor)),
                      SizedBox(width: 15),
                      Text(punchIn,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: isDarkMode
                                  ? AppColors.textWhiteColor
                                  : AppColors.textFieldTextColor)),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Punch Out:",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: AppColors.titleTextColor)),
                      SizedBox(width: 15),
                      Text(currentTime,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: isDarkMode
                                  ? AppColors.textWhiteColor
                                  : AppColors.textFieldTextColor)),
                    ],
                  ),
                  SizedBox(height: 20),
                  CustomButton(
                    buttonText: "Yes",
                    btnBGColor: AppColors.appPrimaryColor,
                    onTap: () {
                      controller.isPunchOut.value = true;
                      controller.punchOutTime.value = currentTime;
                      controller
                          .saveOutPunchTime(controller.punchOutTime.value);
                      Get.back();
                    },
                  )
                ],
              ),
            ),
          );
        });
  }


  @override
  Size get preferredSize => const Size.fromHeight(50);
}