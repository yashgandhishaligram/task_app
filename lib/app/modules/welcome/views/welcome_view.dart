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
      backgroundColor: isDarkMode? AppColors.textWhiteColor : AppColors.darkBgColor,
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.only(top: 80.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 24.0),
                child: Container(
                    height: 77,
                    width: 250,
                    child: isDarkMode?
                    Image.asset(
                        AppImages.appLogoLightPNG,
                    ):
                    Image.asset(
                        AppImages.appLogoDarkPNG,
                    )
                ),
              ),
            ),
            // Spacer(),
            SizedBox(
              height: 50,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                height: 300,
                width: 284,
                child: Image.asset(AppImages.centerLogo),
              ),
            ),
            // Spacer(),
            SizedBox(
              height: 35,
            ),
            Stack(
              children: [
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    height: 248,
                    width: 291,
                    child: Image.asset(
                      isDarkMode? AppImages.bottomLogoLight:
                      AppImages.bottomLogoDark,
                    ),
                  ),
                ),
                Column(
                  children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 29.0,right:19),
                        child: Text(
                          "Convenient and productive task management!",
                          style: TextStyle(
                            fontSize: 32,
                            color: isDarkMode? AppColors.textColor : AppColors.textWhiteColor,
                            fontWeight: FontWeight.w600
                          ),
                        ),
                      ),
                    SizedBox(
                      height: 24,
                    ),
                    CustomButton(
                      onTap: () {
                          // Get.offAndToNamed(Routes.HOME);
                        Get.toNamed(Routes.HOME);
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