import 'package:flutter/material.dart';
import 'package:task_app/app/core/theme/colors.dart';

class CustomCheckBox extends StatelessWidget {
  CustomCheckBox({Key? key, required this.onChanged, required this.value})
      : super(key: key);
  Function() onChanged;
  bool value;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
      onTap: onChanged,
      child: Container(
        width: 20,
        height: 18,
        decoration: BoxDecoration(
          color:
          isDarkMode?
          value == true ?
              AppColors.appPrimaryColor:
          AppColors.textFieldBGColor :
          !value?
          AppColors.textWhiteColor  :
            AppColors.appPrimaryColor,
            border: Border.all(
              width: 2.0,
                color: value == true ? AppColors.appPrimaryColor : AppColors.appPrimaryColor),
            borderRadius: BorderRadius.circular(5)),
        child: value == true
            ? Center(
              child: Icon(
                Icons.check_rounded,
                color: isDarkMode ? AppColors.textFieldBGColor:AppColors.textWhiteColor,
                size: 15
              ),
            )
            : null,
      ),
    );
  }
}