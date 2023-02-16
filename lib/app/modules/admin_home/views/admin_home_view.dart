import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:task_app/app/widget/custom_button.dart';

import '../../../core/constants/images.dart';
import '../../../core/theme/colors.dart';
import '../../../widget/custom_appbar.dart';
import '../../../widget/custom_switch_widget.dart';
import '../controllers/admin_home_controller.dart';

class AdminHomeView extends GetView<AdminHomeController> {
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Container(
      decoration: BoxDecoration(
          gradient:
              isDarkMode ? AppColors.appBgDarkColor : AppColors.appBgColor3),
      child: Scaffold(
        backgroundColor: isDarkMode
            ? AppColors.darkBgColor.withOpacity(0.1)
            : AppColors.appBarBGColor,
        appBar: CustomAppBar(),
        body: Container(
          decoration: BoxDecoration(
            gradient: isDarkMode
                ? AppColors.cardBgDarkColor
                : AppColors.cardBgLightColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50.0),
                topRight: Radius.circular(50.0)),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16.0, bottom: 8),
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
                      "09:30 AM",
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
                          confirmPunch(context);
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
                      "--:-- PM",
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
              ListView.builder(
                  itemCount: 2,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      margin:
                          const EdgeInsets.only(left: 22, right: 22, top: 13),
                      height: 177,
                      width: MediaQuery.of(context).size.width - 2.0,
                      decoration: BoxDecoration(
                          color: isDarkMode
                              ? AppColors.textFieldBGColor
                              : AppColors.textWhiteColor,
                          borderRadius: BorderRadius.circular(15.0)),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 15.0, bottom: 15.0, left: 18.0, right: 25.0),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                fieldText(
                                    "Start Date", "1st Sep, 2022", context),
                                const Spacer(),
                                fieldText("Project Name", "Supplox", context),
                                const Spacer(),
                                priorityWidget("High")
                              ],
                            ),
                            Spacer(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                fieldText("Est. End Date", "31st Dec, 2022s",
                                    context),
                                Spacer(),
                                fieldText("Description", "Wire-Frame Design",
                                    context),
                                Spacer(),
                                workingPersonImageTile(
                                    "Working Persons",
                                    AppImages.profileFemalePNG,
                                    controller.workingPersonList)
                                //priorityWidget("Low")
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }

  Widget fieldText(String title, String value, BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w400,
              color: AppColors.titleTextColor),
        ),
        SizedBox(
          height: 3,
        ),
        Text(
          value,
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: isDarkMode
                  ? AppColors.textWhiteColor
                  : AppColors.textFieldTextColor),
        )
      ],
    );
  }

  Widget priorityWidget(String priority) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Priority",
          style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w400,
              color: AppColors.titleTextColor),
        ),
        SizedBox(
          height: 3,
        ),
        Container(
          height: 27,
          width: 51,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              color: priority == "High"
                  ? AppColors.redPriorityColor.withOpacity(0.10)
                  : priority == "Low"
                      ? AppColors.greenPriorityColor
                      : Colors.white),
          child: Center(
            child: Text(
              priority,
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: priority == "High"
                      ? AppColors.redPriorityColor
                      : priority == "Low"
                          ? AppColors.toggleGreenColor
                          : Colors.white),
            ),
          ),
        )
      ],
    );
  }

  Future confirmPunch(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0))),
            content: Container(
              height: 32.h,
             width: 0.2.w,
              // decoration: BoxDecoration(
              //   borderRadius: BorderRadius.circular(20.0)
              // ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: SvgPicture.asset(
                          isDarkMode?
                              AppImages.closeDarkIcon:
                          AppImages.closeLightIcon),
                    ),
                  ),
                  Text("Are you sure want to Punch out?",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    color: AppColors.titleTextColor
                  ),),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Punch In:  ",
                        style: TextStyle(
                            fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: AppColors.titleTextColor
                        )
                      ),
                      SizedBox(width: 15),
                      Text("09:30 AM",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color:isDarkMode?AppColors.textWhiteColor : AppColors.textFieldTextColor
                          )
                      ),
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
                              color: AppColors.titleTextColor
                          )
                      ),
                      SizedBox(width: 15),
                      Text("07:05 PM",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color:isDarkMode?AppColors.textWhiteColor :  AppColors.textFieldTextColor
                          )
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  CustomButton(
                    buttonText: "Yes",
                    btnBGColor: AppColors.appPrimaryColor,
                    onTap: () {},
                  )
                ],
              ),
            ),
          );
        });
  }

  Widget workingPersonImageTile(String title, String image, List imageList) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w400,
              color: AppColors.titleTextColor),
        ),
        SizedBox(
          height: 3,
        ),
        Stack(
          children: [
            Wrap(
                alignment: WrapAlignment.start,
                spacing: -4.0, // gap between adjacent chips
                runSpacing: 2.0, // gap between lines
                children: List.generate(
                    imageList.length > 5 ? 6 : imageList.length, (index) {
                  int totalCount = imageList.length - 5;
                  return Container(
                      height: 3.5.h,
                      width: 3.5.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100.0),
                          border: Border.all(
                              width: 1.0, color: AppColors.textWhiteColor)),
                          child:  index == 5?
                          CircleAvatar(
                              backgroundColor: AppColors.appPrimaryColor,
                            child: Text(
                              "$totalCount+",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: AppColors.textWhiteColor
                              ),
                            ),
                            )
                          : CircleAvatar(
                             backgroundImage: AssetImage(image),
                            //child: SvgPicture.asset(image),
                            )
                          //:SizedBox()

                  );
                }))
          ],
        )
      ],
    );
  }
}
