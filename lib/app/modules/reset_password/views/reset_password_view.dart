import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../../../core/constants/images.dart';
import '../../../core/theme/colors.dart';
import '../../../routes/app_pages.dart';
import '../../../widget/custom_button.dart';
import '../../../widget/custom_textfield.dart';
import '../controllers/reset_password_controller.dart';

class ResetPasswordView extends GetView<ResetPasswordController> {
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Container(
      decoration: BoxDecoration(
          gradient: AppColors.appBgColor2
      ),
      child: Scaffold(
          backgroundColor: isDarkMode? AppColors.darkBgColor : Colors.transparent,
          body: Obx(() => SingleChildScrollView(
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
                          AppImages.newPasswordDarkLogo :
                          AppImages.newPasswordLogo,
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Create New Password",
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
                      child: Text("Your new password must be different \n from previously user password.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: AppColors.titleTextColor
                          )),
                    ),
                    SizedBox(height: 47),
                    CustomFormField(
                        controller: controller.newPasswordController,
                        textFieldLabel: "New Password",
                        keyboardType: TextInputType.visiblePassword,
                        isObscure: controller.isNewObsecure.value,
                        prefixIcon: Align(
                          widthFactor: 2.5,
                          heightFactor: 2.0,
                          child: SvgPicture.asset(
                              isDarkMode?
                              AppImages.passwordDarkLogo:
                              AppImages.passwordLightLogo),
                        ),
                        postIconBtn: InkWell(
                          onTap: () {
                            controller.isNewObsecure.value = !controller.isNewObsecure.value;
                          },
                          child: Align(
                            widthFactor: 1.0,
                            heightFactor: 1.5,
                            child: SvgPicture.asset(
                                isDarkMode ?
                                controller.isNewObsecure.value ?
                                AppImages.eyeCloseDarkLogo :
                                AppImages.eyeOpenDarkLogo :
                                !controller.isNewObsecure.value ?
                                AppImages.eyeCloseDarkLogo:
                                AppImages.eyeOpenDarkLogo
                            ),
                          ),
                        ),
                        inputAction: TextInputAction.next,
                        hint: "Enter New Password",
                        validator: "password"),
                    SizedBox(
                      height: 21,
                    ),
                    CustomFormField(
                        controller: controller.confirmPasswordController,
                        textFieldLabel: "Confirm Password",
                        keyboardType: TextInputType.visiblePassword,
                        isObscure: controller.isConfirmObsecure.value,
                        prefixIcon: Align(
                          widthFactor: 2.5,
                          heightFactor: 2.0,
                          child: SvgPicture.asset(
                              isDarkMode?
                              AppImages.passwordDarkLogo:
                              AppImages.passwordLightLogo),
                        ),
                        postIconBtn: InkWell(
                          onTap: () {
                            controller.isConfirmObsecure.value = !controller.isConfirmObsecure.value;
                          },
                          child: Align(
                            widthFactor: 1.0,
                            heightFactor: 1.5,
                            child: SvgPicture.asset(
                                isDarkMode ?
                                controller.isConfirmObsecure.value ?
                                AppImages.eyeCloseDarkLogo :
                                AppImages.eyeOpenDarkLogo :
                                !controller.isConfirmObsecure.value ?
                                AppImages.eyeCloseDarkLogo:
                                AppImages.eyeOpenDarkLogo
                            ),
                          ),
                        ),
                        inputAction: TextInputAction.next,
                        hint: "Confirm New Password",
                        validator: "password"),
                    SizedBox(
                      height: 22,
                    ),
                    CustomButton(onTap: () {
                      Get.toNamed(Routes.LOGIN);
                    },
                        buttonText: "Save",
                        btnBGColor: AppColors.appPrimaryColor),
                    SizedBox(
                      height: 21,
                    ),
                  ],
                ),
              ),
            ),
          )
      ),
    );
  }
}
