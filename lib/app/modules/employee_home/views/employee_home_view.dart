import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../core/constants/images.dart';
import '../../../core/theme/colors.dart';
import '../../../routes/app_pages.dart';
import '../../../widget/custom_week_calender.dart';
import '../../../widget/custom_punch_widget.dart';
import '../../admin_home/controllers/admin_home_controller.dart';
import '../controllers/employee_home_controller.dart';

class EmployeeHomeView extends GetView<EmployeeHomeController> {
  var adminController = Get.put(AdminHomeController());
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
          floatingActionButton: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(
                color: AppColors.appPrimaryColor.withOpacity(0.6),
                width: 2,
                style: BorderStyle.solid,
              ),
            ),
            child: FloatingActionButton(
              backgroundColor: AppColors.appPrimaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100)),
              child: SvgPicture.asset(AppImages.plusIcon),
              onPressed: () {},
            ),
          ),
          body: DefaultTabController(
            length: 2,
            child: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                    automaticallyImplyLeading: false,
                    pinned: true,
                    floating: false,
                    backgroundColor: isDarkMode
                        ? AppColors.appDarkBgColor
                        : AppColors.appBarBGColor,
                    elevation: 0.0,
                    leading: Container(
                      height: 32,
                      width: 32,
                      margin: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100.0),
                          color: isDarkMode
                              ? Colors.transparent
                              : AppColors.textTitleColor.withOpacity(0.5),
                          border: Border.all(
                              color: AppColors.textTitleColor, width: 2.0)),
                      child: Center(
                        child: Stack(
                          children: [
                            Image.asset(
                              isDarkMode
                                  ? AppImages.profilePic2
                                  : AppImages.profilePic2,
                            ),
                            Positioned(
                              top: 0.0,
                              right: 0.0,
                              child: Container(
                                height: 8,
                                width: 8,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100.0),
                                    color: AppColors.appPrimaryColor,
                                    border: Border.all(
                                        color: isDarkMode
                                            ? AppColors.iconBorderColor
                                            : AppColors.textWhiteColor,
                                        width: 2.0)),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    centerTitle: true,
                    title: Image.asset(
                        isDarkMode
                            ? AppImages.appLogoDarkPNG
                            : AppImages.appLogoLightPNG,
                        height: 30,
                        width: 100),
                    actions: [
                      SvgPicture.asset(isDarkMode
                          ? AppImages.filterDarkIcon
                          : AppImages.filterLightIcon),
                      const SizedBox(width: 15),
                      Center(
                        child: Stack(
                          children: [
                            SvgPicture.asset(isDarkMode
                                ? AppImages.notificationDarkIcon
                                : AppImages.notificationLightIcon),
                            Positioned(
                              top: 0.0,
                              right: 0.0,
                              child: Container(
                                height: 10,
                                width: 10,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(70.0),
                                    color: AppColors.textRedColor2,
                                    border: Border.all(
                                        color: AppColors.textWhiteColor,
                                        width: 2.0)),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(width: 12),
                    ],
                    bottom: CustomPunchWidget(controller: adminController),
                  ),
                  SliverPersistentHeader(
                    delegate: _SliverAppBarDelegate(
                      Expanded(
                        child: Container(
                          height: 20.h,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            gradient: isDarkMode
                                ? AppColors.cardBgDarkColor
                                : AppColors.cardBgLightColor2,
                          ),
                          child: CustomWeekCalender(),
                        ),
                      ),
                      TabBar(
                        controller: controller.tabController,
                        tabs: controller.tabList,
                        unselectedLabelColor: isDarkMode
                            ? AppColors.titleTextColor
                            : AppColors.tabColor,
                        labelColor: isDarkMode
                            ? AppColors.textWhiteColor
                            : AppColors.textTitleColor,
                        indicatorColor: Colors.transparent,
                        labelStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    pinned: true,
                  ),
                ];
              },
              body: TabBarView(
                controller: controller.tabController,
                children: [
                  tabView(context),
                  tabView(context),
                ],
              ),
            ),
          ),
        ));
  }

  Widget tabView(context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Container(
      decoration: BoxDecoration(
        gradient: isDarkMode
            ? AppColors.cardBgDarkColor
            : AppColors.cardBgLightColor2,
      ),
      child: ListView.builder(
          itemCount: 10,
          shrinkWrap: true,
          padding: EdgeInsets.only(top: 0.0),
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.TASK_DETAILS);
                },
                child: cardView(context));
          }),
    );
  }

  Widget cardView(context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Container(
      margin: const EdgeInsets.only(left: 22, right: 22, bottom: 13),
      height: 237,
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
                  fieldText("Date", "21st Dec, 2022", context),
                  Spacer(),
                  fieldText("Time", "11:17 AM", context),
                ],
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  fieldText(
                      "Project Name", "Supplox  Inventory Management", context),
                ],
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  fieldText("Project Task", "Start Admin wire-frame design ",
                      context),
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
          )),
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
                color: AppColors.titleTextColor),
          ),
          SizedBox(
            height: 3,
          ),
          Text(
            value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
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
          height: 3,
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

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this.widget, this._tabBar);
  final Widget widget;
  final TabBar _tabBar;

  @override
  double get minExtent => 160.5;
  @override
  double get maxExtent => 160.5;

  @override
  Widget build(context, double shrinkOffset, bool overlapsContent) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Column(
      children: [
        widget,
        Container(
          color:
              isDarkMode ? AppColors.appDarkBgColor : AppColors.appBarBGColor,
          height: 3,
        ),
        Container(
          decoration: BoxDecoration(
            color: isDarkMode ? AppColors.darkBgColor : AppColors.appBarBGColor,
            gradient: isDarkMode
                ? AppColors.cardBgDarkColor
                : AppColors.cardBgLightColor2,
          ), // ADD THE COLOR YOU WANT AS BACKGROUND.
          child: _tabBar,
        ),
      ],
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return true;
  }
}
