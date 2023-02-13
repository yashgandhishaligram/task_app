import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:task_app/app/core/theme/colors.dart';

import '../../../core/constants/images.dart';
import '../../../routes/app_pages.dart';
import '../../../widget/custom_button.dart';
import '../../../widget/custom_textfield.dart';
import '../controllers/forgot_password_controller.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
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
                        child: SvgPicture.asset(
                          isDarkMode?
                           AppImages.forgetPasswordDarkLogo :
                          AppImages.forgetPasswordLogo,
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Forgot Password?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: isDarkMode? AppColors.textWhiteColor : AppColors.textTitleColor
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Please enter your company’s email to receive a verification code.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.titleTextColor
                      )),
                    ),
                    SizedBox(height: 47),
                    CustomFormField(
                        controller: controller.emailController,
                        textFieldLabel: "Email ID",
                        keyboardType: TextInputType.emailAddress,
                        prefixIcon: Align(
                          widthFactor: 2.5,
                          heightFactor: 2.0,
                          child: SvgPicture.asset(
                              isDarkMode?
                              AppImages.emailDarkLogo:
                              AppImages.emailLightLogo),
                        ),
                        inputAction: TextInputAction.next,
                        hint: "Enter Your Email",
                        validator: "email"),
                    const SizedBox(height: 20),
                    CustomButton(onTap: () {
                      Get.toNamed(Routes.VERIFY_EMAIL,arguments: controller.emailController.text);},
                      buttonText: "Continue",
                      btnBGColor: AppColors.appPrimaryColor),

                    Padding(
                      padding: const EdgeInsets.only(top: 180.0,bottom: 40),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Text("Back To Login",
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
