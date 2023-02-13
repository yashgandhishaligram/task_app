import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../../../core/constants/images.dart';
import '../../../core/theme/colors.dart';
import '../../../routes/app_pages.dart';
import '../../../widget/custom_button.dart';
import '../../../widget/custom_textfield.dart';
import '../../../widget/text_field_otp.dart';
import '../controllers/verify_email_controller.dart';

class VerifyEmailView extends GetView<VerifyEmailController> {
  var email = Get.arguments;
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Container(
      decoration: BoxDecoration(
          gradient: AppColors.appBgColor2
      ),
      child: Scaffold(
          backgroundColor: isDarkMode? AppColors.darkBgColor : Colors.transparent,
          body: SingleChildScrollView(
            padding: const EdgeInsets.only(top: 100,left: 22,right: 22),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: 144,
                      width: 144,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(70.0),
                        color: isDarkMode? Colors.transparent : AppColors.iconBgColor,
                      ),
                      child:
                      SvgPicture.asset(
                        isDarkMode?
                            AppImages.verifyEmailDarkLogo :
                        AppImages.verifyEmailLogo,
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Verify Your Email",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: isDarkMode? AppColors.textWhiteColor : AppColors.textTitleColor
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Text("Please enter the 6 digit code send to",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: AppColors.titleTextColor
                            )),
                        Text(email == ""? "shaligraminfotech@gmail.com" : email,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: AppColors.titleTextColor
                            )),
                      ],
                    ),
                  ),
                  SizedBox(height: 47),
                  FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextFieldOTP(
                            first: true,
                            last: false,
                            controller: controller.firstValue),
                        const SizedBox(
                          width: 15,
                        ),
                        TextFieldOTP(
                            first: false,
                            last: false,
                            controller: controller.secondValue),
                        const SizedBox(
                          width: 15,
                        ),
                        TextFieldOTP(
                            first: false,
                            last: false,
                            controller: controller.thirdValue),
                        const SizedBox(
                          width: 15,
                        ),
                        TextFieldOTP(
                            first: false,
                            last: false,
                            controller: controller.forthValue),
                        const SizedBox(
                          width: 15,
                        ),
                        TextFieldOTP(
                            first: false,
                            last: false,
                            controller: controller.fifthValue),
                        const SizedBox(
                          width: 15,
                        ),
                        TextFieldOTP(
                            first: false,
                            last: true,
                            controller: controller.sixthValue),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  CustomButton(onTap: () {
                    Get.toNamed(Routes.RESET_PASSWORD);
                    },
                      buttonText: "Verify",
                      btnBGColor: AppColors.appPrimaryColor),
                  Padding(
                    padding: const EdgeInsets.only(top: 180.0,bottom: 40),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: GestureDetector(
                          onTap: () {},
                          child: Text("Resend Code",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: isDarkMode ? AppColors.textWhiteColor :AppColors.textTitleColor
                            ),)),
                    ),
                  )

                ],
              ),
            ),
          )
      ),
    );
  }
}
