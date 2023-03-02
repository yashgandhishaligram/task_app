import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constants/images.dart';
import '../../../core/theme/colors.dart';
import '../../../routes/app_pages.dart';
import '../../../widget/custom_title_appbar.dart';
import '../controllers/task_details_controller.dart';

class TaskDetailsView extends GetView<TaskDetailsController> {
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Container(
        decoration: BoxDecoration(
            gradient: isDarkMode ? AppColors.appBgDarkColor : AppColors.appBgColor2),
        child: Scaffold(
            //appBar: CustomTitleAppBar(title: "Task Details"),
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
                  bottom: AppBar(
                    automaticallyImplyLeading: false,
                    backgroundColor: isDarkMode
                        ? AppColors.darkBgColor.withOpacity(0.1)
                        : AppColors.appBarBGColor,
                    elevation: 0.0,
                    toolbarHeight: 50,
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
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 22, bottom: 4, left: 40, right: 40),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Supplox",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: isDarkMode
                                          ? AppColors.titleTextColor
                                          : AppColors.textTitleColor),
                                ),
                                const Spacer(),
                                Row(
                                  children: [
                                    Text(
                                      "Date:",
                                      style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.titleTextColor),
                                    ),
                                    SizedBox(
                                      width: 3,
                                    ),
                                    Text(
                                      "21st Sep, 2022",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: isDarkMode
                                              ? AppColors.textWhiteColor
                                              : AppColors.textFieldTextColor),
                                    )
                                  ],
                                ),
                              ],
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
                        ],
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: isDarkMode
                          ? AppColors.cardBgDarkColor
                          : AppColors.cardBgLightColor2,
                    ),
                    child:SingleChildScrollView(
                      child: Column(
                          children: [
                            employeeTaskDetailsView(context),
                            adminTaskDetailsView(context),
                            priorityTaskStatus(context),
                            projectTimeLineWidget(context),
                            assignedWorkWidget(context),
                            const SizedBox(height: 50,)
                          ],
                        ),
                    ),
                  ),
                )
              ],
            )));
  }

  Widget adminTaskDetailsView(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Container(
      height: 213,
      margin: const EdgeInsets.only(top: 13, left: 22, right: 22, bottom: 13),
      width: MediaQuery.of(context).size.width - 2.0,
      decoration: BoxDecoration(
          color: isDarkMode
              ? AppColors.textFieldBGColor
              : AppColors.textWhiteColor,
          borderRadius: BorderRadius.circular(15.0)),
      child: Padding(
        padding: const EdgeInsets.only(
            top: 15.0, bottom: 15.0, left: 18.0, right: 25.0),
        child: Column(
          children: [
            Row(
              children: [
                fieldText(
                    "Project Name", "Supplox Inventory Management", context),
                Spacer(),
                SvgPicture.asset(isDarkMode
                    ? AppImages.editDarkIconSVG
                    : AppImages.editLightIconSVG)
              ],
            ),
            Spacer(),
            Row(
              children: [
                fieldText("Project Admin", "Felipe Magaña", context),
                Spacer(),
                fieldText("Project Manager", "Casiel Checoni", context),
              ],
            ),
            Spacer(),
            Row(
              children: [
                fieldText(
                    "Project Details",
                    "Dashboard Design and development Dashboard Design and development",
                    context),
              ],
            ),
            SizedBox(
              height: 4,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ",
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w300,
                        color: AppColors.titleTextColor),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget employeeTaskDetailsView(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Container(
      height: 323,
      margin: const EdgeInsets.only(top: 13, left: 22, right: 22, bottom: 13),
      width: MediaQuery.of(context).size.width - 2.0,
      decoration: BoxDecoration(
          color: isDarkMode
              ? AppColors.textFieldBGColor
              : AppColors.textWhiteColor,
          borderRadius: BorderRadius.circular(15.0)),
      child: Padding(
        padding: const EdgeInsets.only(
            top: 15.0, bottom: 15.0, left: 18.0, right: 25.0),
        child: Column(
          children: [
            Row(
              children: [
                fieldText(
                    "Project Name", "Supplox Inventory Management", context),
              ],
            ),
            Spacer(),
            Row(
              children: [
                fieldText(
                    "Project Task", "Start Admin wire-frame design", context),
              ],
            ),
            Spacer(),
            Row(
              children: [
                fieldText("Project Admin", "Felipe Magaña", context),
                Spacer(),
                fieldText("Project Manager", "Casiel Checoni", context),
              ],
            ),
            Spacer(),
            Row(
              children: [
                fieldText("Project Details", "Dashboard Design and development",
                    context),
              ],
            ),
            SizedBox(
              height: 4,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ",
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w300,
                        color: AppColors.titleTextColor),
                  ),
                )
              ],
            ),
            Spacer(),
            Row(
              children: [
                priorityWidget("High"),
                Spacer(),
                attachmentWidget("Project.pdf", context)
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget priorityTaskStatus(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final darkThemeColors = [
      AppColors.priorityDarkCardColor1,
      AppColors.priorityDarkCardColor2,
      AppColors.priorityDarkCardColor3
    ];
    final lightThemeColors = [
      AppColors.priorityLightCardColor1,
      AppColors.priorityLightCardColor2,
      AppColors.priorityLightCardColor3
    ];
    return Container(
      //height: 213,
      margin: const EdgeInsets.only(top: 13, left: 22, right: 22, bottom: 13),
      width: MediaQuery.of(context).size.width - 2.0,
      decoration: BoxDecoration(
          color: isDarkMode
              ? AppColors.textFieldBGColor
              : AppColors.textWhiteColor,
          borderRadius: BorderRadius.circular(15.0)),
      child: Padding(
        padding: const EdgeInsets.only(
            top: 10.0, left: 18.0, right: 18.0, bottom: 13.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Priority Task Status",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: isDarkMode
                      ? AppColors.textWhiteColor
                      : AppColors.textTitleColor),
            ),
            ListView.builder(
                itemCount: 3,
                padding: EdgeInsets.only(top: 15.0),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 9.0),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: isDarkMode
                              ? darkThemeColors[index % darkThemeColors.length]
                              : lightThemeColors[
                                  index % lightThemeColors.length],
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Wireframe App Design",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.textTitleColor),
                                ),
                                Text(
                                  "12H, 30M",
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.titleTextColor),
                                )
                              ],
                            ),
                            Spacer(),
                            buildDropDown(index,context)
                          ],
                        ),
                      ),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }

  Widget buildDropDown(int index,context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Obx(() => Container(
        height: 20,
        width: (controller.reloadDropdown.value)?80:80,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: AppColors.textWhiteColor),
        child: DropdownButtonFormField(
          decoration: InputDecoration(
            prefix: Text(
                controller.selectedDropdown.value,
              //controller.selectedStatus == null ||   controller.selectedStatus == '' ? "completed" :controller.selectedStatus!,
              style: TextStyle(
                  color: AppColors.textRedColor,
                  fontSize: 10,
                  fontWeight: FontWeight.w500),
            ),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide.none),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide.none),
              suffixIconConstraints: BoxConstraints(minWidth: 0.1),
              suffixIcon: Icon(
                Icons.keyboard_arrow_down_outlined,
                size: 15,
                color: AppColors.titleTextColor,
              )),
          onChanged: (value) {
            controller.selectedDropdown.value = value!;
            controller.reloadDropdown.value = !controller.reloadDropdown.value;
          },
       //    hint: Text(
       //      controller.statusList.value[index]["status"].toString(),
       // /*     controller.selectedStatus == null ||
       //      controller.selectedStatus == '' ? "completed" : controller.selectedStatus!,*/
       //      style: TextStyle(
       //          color: AppColors.textRedColor,
       //          fontSize: 15,
       //          fontWeight: FontWeight.w500),
       //    ),
          value:controller.selectedDropdown.value,
          borderRadius: BorderRadius.circular(15),
          items: controller.statusList.map((items) {
            return DropdownMenuItem(
                value: items,
                child: Row(
                  children: [
                    Text(
                      items,
                      style: TextStyle(
                        color:isDarkMode?
                        controller.statusColors[items.length % controller.statusColors.length]:
                       controller.statusColors[items.length % controller.statusColors.length],
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      height: 16,
                      width: 16,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color:isDarkMode?AppColors.textWhiteColor: AppColors.checkBoxBorderColor,
                            width: 1,
                          )),
                      child:  controller.reloadDropdown.value ? Center(
                        child: Icon(
                          Icons.check_rounded,
                          size: 12,
                          color: AppColors.tabColor,
                        )
                      ):SizedBox()
                    ),
                  ],
                ));
          }).toList(),
          isExpanded: true,
          style: const TextStyle(fontSize: 18, color: Colors.white),
          dropdownColor: isDarkMode? AppColors.calCardBGColor : AppColors.textWhiteColor,
          iconEnabledColor: Colors.white, //Icon color
        ),
      ),
    );
  }

  Widget fieldText(String title, String value, BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            height: 3,
          ),
          Text(
            value,
            maxLines: 1,
            overflow: TextOverflow.visible,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: isDarkMode
                    ? AppColors.textWhiteColor
                    : AppColors.textFieldTextColor),
          )
        ],
      ),
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
          height: 5,
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

  Widget attachmentWidget(String filename, context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Attachment",
          style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w400,
              color: AppColors.titleTextColor),
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          children: [
            SvgPicture.asset(
              AppImages.pdfIconSVG,
              width: 14,
              height: 18,
            ),
            SizedBox(width: 8.5),
            Text(
              filename,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: isDarkMode
                      ? AppColors.textWhiteColor
                      : AppColors.textFieldTextColor),
            )
          ],
        )
      ],
    );
  }

  Widget projectTimeLineWidget(context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Container(
      margin: const EdgeInsets.only(top: 13, left: 22, right: 22, bottom: 13),
      width: MediaQuery.of(context).size.width - 2.0,
      decoration: BoxDecoration(
          color: isDarkMode
              ? AppColors.textFieldBGColor
              : AppColors.textWhiteColor,
          borderRadius: BorderRadius.circular(15.0)),
      child: Padding(
        padding: const EdgeInsets.only(
            top: 10.0, left: 18.0, right: 18.0, bottom: 13.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Project Timeline",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: isDarkMode
                      ? AppColors.textWhiteColor
                      : AppColors.textTitleColor),
            ),
            ListView.builder(
                itemCount: controller.teamList.length,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.only(top: 10.0,),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                         controller.teamList[index],
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: AppColors.titleTextColor
                          ),
                        ),
                        const SizedBox(height: 5),
                        Container(
                          height: 38,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: isDarkMode?
                                AppColors.darkBgColor:
                            AppColors.timelineBgColor,
                            borderRadius: BorderRadius.circular(21),
                          ),
                          child: Row(
                            children: [
                              Container(
                                height:double.maxFinite,
                                padding:const EdgeInsets.only(left:7,right:7),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(21),
                                  color: isDarkMode?
                                  controller.teamDarkBgColors[index % controller.teamDarkBgColors.length]:
                                  controller.teamLightBgColors[index % controller.teamLightBgColors.length]
                                ),
                                child: workingPersonImageTile(AppImages.profileFemalePNG,controller.workingPersonList),
                              ),
                              Spacer(),
                              Row(
                                children: [
                                  Text("2.5 months",
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w300,
                                    color: AppColors.titleTextColor
                                  ),),
                                  const SizedBox(width: 5),
                                  Container(
                                    height: 15,
                                    width: 15,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color:isDarkMode?
                                            AppColors.titleTextColor:
                                        AppColors.checkBoxBorderColor,
                                        width: 1
                                      ),
                                      borderRadius: BorderRadius.circular(5.0)
                                    ),
                                    child:  Center(
                                        child: Icon(
                                          Icons.keyboard_arrow_right_rounded,
                                    color: AppColors.titleTextColor,
                                    size: 12,)),
                                  ),
                                  const SizedBox(width: 15),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                })
          ],
        ),
      ),
    );

  }

  Widget workingPersonImageTile(String image, List imageList) {
    return Row(
      children: [
        Stack(
          children: [
            Wrap(
                alignment: WrapAlignment.start,
                spacing: -4.0, // gap between adjacent chips
                //runSpacing: 2.0, // gap between lines
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
                      child: index == 5
                          ? CircleAvatar(
                        backgroundColor: AppColors.appPrimaryColor,
                        child: Text(
                          "$totalCount+",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: AppColors.textWhiteColor),
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
        ),
      ],
    );
  }

  Widget employeeWorkingPersonImageTile(String image, List imageList) {
    return Row(
      children: [
        Stack(
          children: [
            Wrap(
                alignment: WrapAlignment.start,
                spacing: 10.0,
                children: List.generate(
                    imageList.length > 5 ? 6 : imageList.length, (index) {
                  int totalCount = imageList.length - 5;
                  return Stack(
                    children: [
                      InkWell(
                        onTap:() {
                          Get.toNamed(Routes.PROFILE);
                           },
                        child: Container(
                            height: 4.2.h,
                            width: 4.2.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100.0),
                                border: Border.all(
                                    width: 2.0, color: AppColors.teamBgColor1)),
                            child: index == 5
                                ? CircleAvatar(
                              backgroundColor:AppColors.appPrimaryColor,
                              child: Text(
                                "$totalCount+",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.textWhiteColor),
                              ),
                            )
                                : CircleAvatar(
                              backgroundImage: AssetImage(image),
                              //child: SvgPicture.asset(image),
                            )
                          //:SizedBox()
                        ),
                      ),
                      Positioned(
                        top: 0.0,
                        right : 0.0,
                        child: Container(
                          height: 9,
                          width: 9,
                          decoration: BoxDecoration(
                              color: index == 2 || index == 3?
                              AppColors.checkBoxItemColor2:AppColors.appPrimaryColor,
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(
                                  color: AppColors.textWhiteColor,
                                  width: 1.8
                              )
                          ),
                        ),
                      ),
                    ],
                  );
                }))
          ],
        ),
      ],
    );
  }

  Widget assignedWorkWidget(context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Container(
      margin: const EdgeInsets.only(top: 13, left: 22, right: 22, bottom: 13),
      width: MediaQuery.of(context).size.width - 2.0,
      decoration: BoxDecoration(
          color: isDarkMode
              ? AppColors.textFieldBGColor
              : AppColors.textWhiteColor,
          borderRadius: BorderRadius.circular(15.0)),
      child: Padding(
        padding: const EdgeInsets.only(
            top: 10.0, left: 18.0, right: 18.0, bottom: 13.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Assigned Work",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: isDarkMode
                      ? AppColors.textWhiteColor
                      : AppColors.textTitleColor),
            ),
            ListView.builder(
                itemCount: controller.assignedWorkList.length,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.only(top: 10.0,),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.assignedWorkList[index],
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: AppColors.titleTextColor
                          ),
                        ),
                        const SizedBox(height: 5),
                        Container(
                          height: 38,
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            children: [
                              employeeWorkingPersonImageTile(AppImages.profileFemalePNG,controller.workingPersonList),
                              Spacer(),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                })
          ],
        ),
      ),
    );

  }

}
