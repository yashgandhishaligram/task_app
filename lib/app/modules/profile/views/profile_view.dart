import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:task_app/app/core/constants/images.dart';

import '../../../core/theme/colors.dart';
import '../../../routes/app_pages.dart';
import '../../../widget/custom_button.dart';
import '../../../widget/custom_textfield.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
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
                    "Profile",
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
                      height: 50,
                      decoration: BoxDecoration(
                        gradient: isDarkMode
                            ? AppColors.cardBgDarkColor
                            : AppColors.cardBgLightColor2,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50.0),
                            topRight: Radius.circular(50.0)),
                      ),
                      child: Container(),
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
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.only(left: 22, right: 22),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: isDarkMode
                              ? AppColors.cardBgDarkColor
                              : AppColors.cardBgLightColor2,
                        ),
                        child: Column(
                          children: [
                            profileView(context),
                            const SizedBox(
                              height: 36,
                            ),
                            CustomFormField(
                                controller: controller.emailController,
                                textFieldLabel: "Email ID",
                                textFieldLabelSize: 12.0,
                                keyboardType: TextInputType.emailAddress,
                                prefixIcon: Align(
                                  widthFactor: 2.5,
                                  heightFactor: 2.0,
                                  child: SvgPicture.asset(isDarkMode
                                      ? AppImages.contactDarkIconSVG
                                      : AppImages.contactLightIconSVG),
                                ),
                                inputAction: TextInputAction.next,
                                hint: "Enter Your Email",
                                validator: "email"),
                            const SizedBox(height: 16),
                            CustomFormField(
                                controller: controller.locationController,
                                textFieldLabel: "Location",
                                textFieldLabelSize: 12.0,
                                keyboardType: TextInputType.text,
                                prefixIcon: Align(
                                  widthFactor: 2.5,
                                  heightFactor: 2.0,
                                  child: SvgPicture.asset(isDarkMode
                                      ? AppImages.locationDarkIconSVG
                                      : AppImages.locationLightIconSVG),
                                ),
                                inputAction: TextInputAction.next,
                                hint: "Enter Your Location",
                                validator: ""),
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: CustomFormField(
                                      controller: controller.phoneController,
                                      textFieldLabel: "Phone",
                                      textFieldLabelSize: 12.0,
                                      keyboardType: TextInputType.number,
                                      inputformet: [
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                      prefixIcon: Align(
                                        widthFactor: 2.5,
                                        heightFactor: 2.0,
                                        child: SvgPicture.asset(isDarkMode
                                            ? AppImages.callDarkIconSVG
                                            : AppImages.callLightIconSVG),
                                      ),
                                      inputAction: TextInputAction.next,
                                      hint: "Enter Your Mobile No.",
                                      validator: "phoneNum"),
                                ),
                                const SizedBox(width: 11),
                                Expanded(
                                  child: CustomFormField(
                                      controller:
                                          controller.experienceController,
                                      textFieldLabel: "Experience",
                                      textFieldLabelSize: 12.0,
                                      keyboardType: TextInputType.number,
                                      inputformet: [
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                      prefixIcon: Align(
                                        widthFactor: 2.5,
                                        heightFactor: 2.0,
                                        child: SvgPicture.asset(
                                          isDarkMode
                                              ? AppImages.bagDarkIconSVG
                                              : AppImages.bagLightIconSVG,
                                          height: 16,
                                          width: 17,
                                        ),
                                      ),
                                      inputAction: TextInputAction.next,
                                      hint: "Enter Your Experience",
                                      validator: ""),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Obx(
                              () => Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                      child: GestureDetector(
                                    onTap: () {
                                      showDatePickerDialog(context);
                                    },
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8.0),
                                          child: Text(
                                            "Birthdate",
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color:
                                                    AppColors.titleTextColor),
                                          ),
                                        ),
                                        SizedBox(height: 6),
                                        Container(
                                          height: 63,
                                          width: double.maxFinite,
                                          decoration: BoxDecoration(
                                              color: isDarkMode
                                                  ? AppColors.textFieldBGColor
                                                  : AppColors.textWhiteColor,
                                              borderRadius:
                                                  BorderRadius.circular(15.0)),
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                18.0, 22.0, 0.0, 22.0),
                                            child: Row(
                                              children: [
                                                SvgPicture.asset(isDarkMode
                                                    ? AppImages
                                                        .birthdayDarkIconSVG
                                                    : AppImages
                                                        .birthdayLightIconSVG),
                                                const SizedBox(
                                                  width: 12,
                                                ),
                                                controller.selectedDate.value ==
                                                        ""
                                                    ? Expanded(
                                                        child: Text(
                                                          "Enter Your Birthdate",
                                                          style: TextStyle(
                                                            fontSize: 16,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.5),
                                                          ),
                                                        ),
                                                      )
                                                    : Text(
                                                        controller
                                                            .selectedDate.value,
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: isDarkMode
                                                                ? AppColors
                                                                    .textWhiteColor
                                                                : AppColors
                                                                    .textFieldTextColor),
                                                      ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                                  SizedBox(width: 11),
                                  Expanded(
                                      child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 12.0),
                                        child: Text(
                                          "Gender",
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.titleTextColor),
                                        ),
                                      ),
                                      SizedBox(height: 6),
                                      Container(
                                        height: 63,
                                        width: double.maxFinite,
                                        decoration: BoxDecoration(
                                            color: isDarkMode
                                                ? AppColors.textFieldBGColor
                                                : AppColors.textWhiteColor,
                                            borderRadius:
                                                BorderRadius.circular(15.0)),
                                        child: Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              18.0, 22.0, 0.0, 22.0),
                                          child: Row(
                                            children: [
                                              SvgPicture.asset(
                                                isDarkMode
                                                    ? AppImages
                                                        .genderDarkIconSVG
                                                    : AppImages
                                                        .genderLightIconSVG,
                                              ),
                                              const SizedBox(width: 12),
                                              Expanded(
                                                  child: Obx(() =>
                                                      buildGenderDropDown(
                                                          context)))
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  )),
                                ],
                              ),
                            ),
                            const SizedBox(height: 16),
                            CustomButton(
                                onTap: () {},
                                buttonText: "Update",
                                btnBGColor: AppColors.appPrimaryColor),
                            const SizedBox(
                              height: 50,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )));
  }

  Widget profileView(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 130,
          width: 130,
          child: CircleAvatar(
            backgroundColor: AppColors.imageBorderColor,
            child: CircleAvatar(
              backgroundImage: AssetImage(AppImages.profileFemalePNG),
              radius: 60,
            ),
          ),
        ),
        SizedBox(
          height: 7,
        ),
        Text(
          "Casiel Checoni",
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w400,
              color: isDarkMode
                  ? AppColors.textWhiteColor
                  : AppColors.textFieldTextColor),
        ),
        SizedBox(
          height: 2,
        ),
        Text(
          "(Sr. UI/UX Designer)",
          style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w400,
              color: AppColors.appPrimaryColor),
        ),
        SizedBox(
          height: 6,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              isDarkMode ? AppImages.bagDarkIconSVG : AppImages.bagLightIconSVG,
              height: 10,
              width: 10,
            ),
            SizedBox(
              width: 3,
            ),
            Text(
              "1250 Projects Done",
              style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: AppColors.titleTextColor),
            )
          ],
        )
      ],
    );
  }

  showDatePickerDialog(context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding: const EdgeInsets.all(10.0),
            backgroundColor: isDarkMode
                ? AppColors.calenderBgColor
                : AppColors.textWhiteColor,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0))),
            content: SizedBox(
                height: 40.h,
                width: 0.2.w,
                child: SfDateRangePicker(
                  selectionMode: DateRangePickerSelectionMode.single,
                  selectionColor: AppColors.appPrimaryColor,
                  toggleDaySelection: true,
                  navigationDirection:
                      DateRangePickerNavigationDirection.vertical,
                  showNavigationArrow: true,
                  viewSpacing: 6,
                  enablePastDates: true,
                  todayHighlightColor: AppColors.appPrimaryColor,
                  monthCellStyle: DateRangePickerMonthCellStyle(
                      textStyle: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textTitleColor),
                      todayTextStyle: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textTitleColor)),
                  selectionTextStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textTitleColor),
                  headerStyle: DateRangePickerHeaderStyle(
                      textStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textTitleColor)),
                  onSelectionChanged:
                      (DateRangePickerSelectionChangedArgs args) {
                    final DateTime selectedDate = args.value;
                    String date = DateFormat('d MMM, yyyy').format(selectedDate);
                    controller.selectedDate.value = date;
                    Get.back();
                  },
                  view: DateRangePickerView.month,
                )),
          );
        });
  }

  Widget buildGenderDropDown(context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return DropdownButtonFormField(
      dropdownColor:
          isDarkMode ? AppColors.textFieldBGColor : AppColors.textWhiteColor,
      decoration: InputDecoration(
        prefix: Text(
          controller.selectedGender.value,
          //controller.selectedStatus == null ||   controller.selectedStatus == '' ? "completed" :controller.selectedStatus!,
          style: TextStyle(
              color: isDarkMode
                  ? AppColors.textWhiteColor
                  : AppColors.textFieldTextColor,
              fontSize: 16,
              fontWeight: FontWeight.w400),
        ),
        filled: true, //<-- SEE HERE
        fillColor:
            isDarkMode ? AppColors.textFieldBGColor : AppColors.textWhiteColor,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide.none),
      ),
      onChanged: (newValue) {
        controller.selectedGender.value = newValue!;
        //controller.setSelected(newValue!);
      },
      value: controller.selectedGender.value,
      borderRadius: BorderRadius.circular(15),
      items: controller.genderList.map((selectedType) {
        return DropdownMenuItem(
          value: selectedType,
          child: Text(
            selectedType,
            style: TextStyle(
                color: isDarkMode
                    ? AppColors.textWhiteColor
                    : AppColors.textFieldTextColor,
                fontSize: 16,
                fontWeight: FontWeight.w400),
          ),
        );
      }).toList(),
      style: const TextStyle(fontSize: 18, color: Colors.white),
    );
  }
}
