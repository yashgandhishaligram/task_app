import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constants/images.dart';
import '../../../core/theme/colors.dart';
import '../../../routes/app_pages.dart';
import '../../../widget/custom_button.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
        backgroundColor: isDarkMode? AppColors.darkBgColor : AppColors.textWhiteColor,
        body: SingleChildScrollView(
          // physics: const NeverScrollableScrollPhysics(),
          padding:  EdgeInsets.only(top: 8.0.h),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding:  EdgeInsets.only(left: 4.0.h),
                  child: SizedBox(
                      height: 9.h,
                      width: 28.h,
                      child:
                      Image.asset(
                        isDarkMode?
                        AppImages.appLogoDarkPNG:
                        AppImages.appLogoLightPNG,
                      )
                  ),
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  height: 300,
                  width: 284,
                  child: Image.asset(AppImages.centerLogo),
                ),
              ),
              SizedBox(
                height: 8.h,
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
                  Column(
                    children: [
                      Padding(
                        padding:  EdgeInsets.only(left: 29.0,right:19),
                        child: Text(
                          "Convenient and productive task management!",
                          style: TextStyle(
                              fontSize: 26.sp,
                              color: isDarkMode? AppColors.textWhiteColor : AppColors.textColor,
                              fontWeight: FontWeight.w600
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      CustomButton(
                        onTap: () {
                          // Get.offAndToNamed(Routes.HOME);
                          Get.toNamed(Routes.LOGIN);
                        },
                        buttonText: "Get Started",
                        btnBGColor: AppColors.appPrimaryColor,
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        )
    );
  }
}
