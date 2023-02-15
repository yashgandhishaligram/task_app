import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../core/constants/images.dart';
import '../core/theme/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return AppBar(
      backgroundColor:
          isDarkMode ? AppColors.darkBgColor.withOpacity(0.1) : AppColors.appBarBGColor,
      automaticallyImplyLeading: false,
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
            border: Border.all(color: AppColors.textTitleColor, width: 2.0)),
        child: Center(
          child: Stack(
            children: [
              Image.asset(
                isDarkMode ? AppImages.profilePic2 : AppImages.profilePic2,
              ),
              Positioned(
                top: 0.0,
                right: 0.0,
                child: Container(
                  height: 12,
                  width: 12,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.0),
                      color: AppColors.appPrimaryColor,
                      border: Border.all(
                          color: isDarkMode? AppColors.iconBorderColor : AppColors.textWhiteColor, width: 2.0)),
                ),
              )
            ],
          ),
        ),
      ),
      title: Image.asset(
          isDarkMode ? AppImages.appLogoDarkPNG : AppImages.appLogoLightPNG,
          height: 30,
          width: 100),
      centerTitle: true,
      actions: [
        SvgPicture.asset(
            isDarkMode ? AppImages.filterDarkIcon : AppImages.filterLightIcon),
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
                          color: AppColors.textWhiteColor, width: 2.0)),
                ),
              )
            ],
          ),
        ),
        SizedBox(width: 12),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
