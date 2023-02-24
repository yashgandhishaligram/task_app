import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_app/app/core/constants/images.dart';

import '../core/theme/colors.dart';

class CustomTitleAppBar extends StatelessWidget  implements PreferredSizeWidget {
  CustomTitleAppBar({Key? key,required this.title}) : super(key: key);
  String? title;
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return SliverAppBar(
      backgroundColor: isDarkMode ? AppColors.darkBgColor.withOpacity(0.1) : AppColors.appBarBGColor,
      title: Text(title!,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: isDarkMode? AppColors.textWhiteColor: AppColors.textTitleColor),
      ),
      leading: Icon(Icons.arrow_back_ios_new_sharp,color: isDarkMode?AppColors.titleTextColor : AppColors.iconLightBGColor),
      centerTitle: true,
      elevation: 0.0,

    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(50);
}
