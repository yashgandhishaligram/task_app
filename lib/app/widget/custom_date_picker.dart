import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../core/theme/colors.dart';
import '../modules/profile/controllers/profile_controller.dart';

class CustomDatePicker extends StatelessWidget {
   CustomDatePicker({Key? key, this.controller}) : super(key: key);
  ProfileController? controller;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
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
              controller!.selectedDate.value = date;
              Get.back();
            },
            view: DateRangePickerView.month,
          )),
    );
  }
}
