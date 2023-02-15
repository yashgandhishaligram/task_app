import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:task_app/app/core/constants/images.dart';
import 'package:task_app/app/core/theme/colors.dart';
import 'package:task_app/app/routes/app_pages.dart';

import '../../../widget/custom_button.dart';
import '../controllers/welcome_controller.dart';

class WelcomeView extends GetView<WelcomeController> {
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDarkMode? AppColors.darkBgColor : AppColors.textWhiteColor,
      body: SingleChildScrollView(
       // physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.only(top: 80.0),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                  height: 50,
                  width: 160,
                  child:
                  Image.asset(
                    isDarkMode?
                    AppImages.appLogoDarkPNG:
                    AppImages.appLogoLightPNG,
                  )
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                height: 130,
                width: 130,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.0),
                  border: Border.all(color: AppColors.imageBorderColor,width: 6.0)
                ),
                child: Stack(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(AppImages.profilePic),
                      radius: 100,
                    ),
                    Positioned(
                      bottom: 0.0,
                      right: 0.0,
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100.0),
                            border: Border.all(color: AppColors.textWhiteColor,width: 3.0),
                            color: AppColors.appPrimaryColor
                        ),
                        child: Center(child: SvgPicture.asset(AppImages.userEditIcon))
                      ),
                    )
                  ],
                )
              ),
              SizedBox(
                height: 24,
              ),
              Text(
                "Welcome",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w300,
                  color: AppColors.textHighlightColor
                ),
              ),
              SizedBox(
                height: 34,
              ),
              Text(
                "Felipe Magaña",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: isDarkMode? AppColors.textWhiteColor : AppColors.textTitleColor
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "(" +  "Project Head" + ")",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.appPrimaryColor
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Have a nice day !",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: isDarkMode? AppColors.textWhiteColor : AppColors.wishTextColor
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: SizedBox(
                      height: 248,
                      width: 291,
                      child: Image.asset(
                        isDarkMode? AppImages.bottomLogoDark:
                        AppImages.bottomLogoLight,
                      ),
                    ),
                  ),
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.ADMIN_HOME);
                        },
                        child: Container(
                            height: 48,
                            width: 48,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(70.0),
                              color: AppColors.appPrimaryColor,
                              border: Border.all(color: AppColors.imageBorderColor.withOpacity(0.8), width: 2.0)
                          ),
                          child: Center(
                              child: SvgPicture.asset(
                                AppImages.arrowRightIcon,
                              )),
                        ),
                      ),
                    ],
                  ),
                )
                ],
              )
            ],
          ),
        ),
      )
    );
  }
}
