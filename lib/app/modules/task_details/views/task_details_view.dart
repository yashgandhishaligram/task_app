import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../../../core/constants/images.dart';
import '../../../core/theme/colors.dart';
import '../../../widget/custom_title_appbar.dart';
import '../controllers/task_details_controller.dart';

class TaskDetailsView extends GetView<TaskDetailsController> {
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Container(
        decoration: BoxDecoration(
            gradient:
                isDarkMode ? AppColors.appBgDarkColor : AppColors.appBgColor2),
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
                    backgroundColor:
                    isDarkMode ? AppColors.darkBgColor.withOpacity(0.1) : AppColors.appBarBGColor,
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
                            padding:const EdgeInsets.only(top:22,bottom:4,left: 40,right: 40),
                            child: Row(
                             crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("Supplox",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: isDarkMode?AppColors.titleTextColor: AppColors.textTitleColor),
                                ),
                                const Spacer(),
                                Row(
                                  children: [
                                    Text("Date:",
                                      style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.titleTextColor
                                      ),
                                    ),
                                    SizedBox(width: 3,),
                                    Text("21st Sep, 2022",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: isDarkMode? AppColors.textWhiteColor : AppColors.textFieldTextColor
                                      ),
                                    )
                                  ],
                                ),
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
                ),
                SliverToBoxAdapter(
                  child: Container(
                      decoration: BoxDecoration(
                        gradient: isDarkMode
                            ? AppColors.cardBgDarkColor
                            : AppColors.cardBgLightColor2,
                      ),
                    child: Column(
                      children: [
                        employeeTaskDetailsView(context),
                        //adminTaskDetailsView(context),
                        priorityTaskStatus(context)

                      ],
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
        margin: const EdgeInsets.only(top:13,left: 22, right: 22, bottom: 13),
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
                  fieldText("Project Name", "Supplox Inventory Management", context),
                  Spacer(),
                  SvgPicture.asset(
                      isDarkMode?
                          AppImages.editDarkIconSVG:
                      AppImages.editLightIconSVG)
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
                  fieldText("Project Details", "Dashboard Design and development Dashboard Design and development", context),
                ],
              ),
              SizedBox(
                height: 4,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ",
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w300,
                          color: AppColors.titleTextColor
                      ),
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
      margin: const EdgeInsets.only(top:13,left: 22, right: 22, bottom: 13),
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
                fieldText("Project Name", "Supplox Inventory Management", context),
              ],
            ),
            Spacer(),
            Row(
              children: [
                fieldText("Project Task", "Start Admin wire-frame design", context),
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
                fieldText("Project Details", "Dashboard Design and development", context),
              ],
            ),
            SizedBox(
              height: 4,
            ),
            Row(
              children: [
                Expanded(
                  child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ",
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w300,
                        color: AppColors.titleTextColor
                    ),
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

  Widget priorityTaskStatus(BuildContext context){
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
      margin: const EdgeInsets.only(top:13,left: 22, right: 22, bottom: 13),
      width: MediaQuery.of(context).size.width - 2.0,
      decoration: BoxDecoration(
          color: isDarkMode
              ? AppColors.textFieldBGColor
              : AppColors.textWhiteColor,
          borderRadius: BorderRadius.circular(15.0)),
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0,left: 18.0,right: 18.0,bottom: 13.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Priority Task Status",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color:isDarkMode?AppColors.textWhiteColor: AppColors.textTitleColor
            ),
            ),
        ListView.builder(
              itemCount: 3,
              shrinkWrap: true,
              itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.only(bottom: 9.0),
              child: Container(
                    height: 50,
                decoration: BoxDecoration(
                    color: isDarkMode
                        ? darkThemeColors[index % darkThemeColors.length]
                        : lightThemeColors[index % lightThemeColors.length],
                    borderRadius: BorderRadius.circular(10.0)),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Wireframe App Design",
                            style: TextStyle(
                            fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: AppColors.textTitleColor
                          ),),
                          Text("12H, 30M",
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                color: AppColors.titleTextColor
                            ),)
                        ],
                      ),
                      Spacer(),
                      buildDropDown()
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

  Widget buildDropDown() {
    String dropdownValue = 'Completed';
    var statusList = ["Completed","Inprogress","Pending"];
    return  Container(
      height: 20,
      width: 74,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
            color: AppColors.textWhiteColor
      ),
      child: DropdownButtonFormField(
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder( //<-- SEE HERE
           borderRadius: BorderRadius.circular(15.0),
               borderSide: BorderSide.none
          ),
          focusedBorder: OutlineInputBorder( //<-- SEE HERE
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide.none
          ),
          suffixIcon: Icon(Icons.keyboard_arrow_down_outlined,
            size: 15,
            color: AppColors.titleTextColor,)
        ),
        hint:  Text(
          "Completed",
          style: TextStyle(
              color: AppColors.textWhiteColor,
              fontSize: 9,
              fontWeight: FontWeight.w500),
        ),
        value: dropdownValue,
        borderRadius: BorderRadius.circular(15),
        items: statusList.map((String items) {
          return DropdownMenuItem(
            value: items,
            child: Container(
              width: 142,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: AppColors.textWhiteColor
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(items,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.toggleGreenColor
                      ),),
                    ],
                  ),
                ],
              ),
            )
          );
        }).toList(),
        onChanged: (value) {
          dropdownValue = value!;
        },
        isExpanded: true,
        style: const TextStyle(fontSize: 18, color: Colors.white),
        dropdownColor: AppColors.textWhiteColor,
        iconEnabledColor: Colors.white, //Icon color
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
                fontWeight: FontWeight.w400,),
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


}
