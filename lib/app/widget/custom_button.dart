import 'package:flutter/material.dart';
import 'package:task_app/app/core/theme/colors.dart';
class CustomButton extends StatelessWidget {
  const CustomButton({Key? key,
    required this.onTap,
    required this.buttonText,
    this.btnBGColor,
    this.contentPadding

  }) : super(key: key);

  final String? buttonText;
  final GestureTapCallback? onTap;
  final Color? btnBGColor;
  final EdgeInsetsGeometry? contentPadding;
  @override
  Widget build(BuildContext context) {
    return customElevatedButton(context);
  }

   Widget customButton(BuildContext context) {
      return Container(
        height: 55,
        width: MediaQuery.of(context).size.width / 1.2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppColors.appPrimaryColor,
        ),
        child: Center(
          child: Text(
            buttonText!,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.textWhiteColor
            ),
          ),
        ),

      );
    }

   Widget customElevatedButton(BuildContext context) {
    return SizedBox(
      height: 55,
      width: MediaQuery.of(context).size.width / 1.1,
      child: ElevatedButton(
            onPressed: onTap,
            style: ElevatedButton.styleFrom(
              elevation: 4.0,
              primary: AppColors.appPrimaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: Text(
              buttonText!,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textWhiteColor
              ),
            )),
    );
    }
}