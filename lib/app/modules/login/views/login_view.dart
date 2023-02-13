import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:task_app/app/core/constants/images.dart';
import 'package:task_app/app/core/theme/colors.dart';
import 'package:task_app/app/widget/custom_button.dart';

import '../../../routes/app_pages.dart';
import '../../../widget/custom_checkbox.dart';
import '../../../widget/custom_textfield.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Obx(()=>
        Container(
        decoration: BoxDecoration(
          gradient: AppColors.appBgColor
        ),
        child: Scaffold(
           backgroundColor: isDarkMode? AppColors.darkBgColor : Colors.transparent,
          body: SingleChildScrollView(
            padding: const EdgeInsets.only(top:100),
         child: Column(
           children: [
             Padding(
               padding: const EdgeInsets.only(left: 22.0,right: 22.0),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                      Center(
                        child: Container(
                            height: 198,
                            width: 154,
                            child:
                            Image.asset(
                                isDarkMode ?
                                    AppImages.appVerticalDarkLogo:
                                AppImages.appVerticalLightLogo)
                     ),
                      ),
                   SizedBox(height: 50),
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
                   SizedBox(height: 16),
                   CustomFormField(
                       controller: controller.passwordController,
                       textFieldLabel: "Password",
                       keyboardType: TextInputType.visiblePassword,
                       isObscure: controller.isObsecure.value,
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
                           controller.isObsecure.value = !controller.isObsecure.value;
                         },
                         child: Align(
                           widthFactor: 1.0,
                           heightFactor: 1.5,
                           child: SvgPicture.asset(
                             isDarkMode ?
                                 controller.isObsecure.value ?
                                 AppImages.eyeCloseDarkLogo :
                                 AppImages.eyeOpenDarkLogo :
                             !controller.isObsecure.value ?
                             AppImages.eyeCloseDarkLogo:
                             AppImages.eyeOpenDarkLogo
                           ),
                         ),
                       ),
                       inputAction: TextInputAction.next,
                       hint: "Enter Your Password",
                       validator: "password"),
                   SizedBox(
                     height: 17,
                   ),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Padding(
                         padding: const EdgeInsets.only(left: 6.0),
                         child: Row(
                           children: [
                             CustomCheckBox(
                                 onChanged: () {
                                   controller.changeRememberUser();
                                   print(controller.isRemember.value);
                                 },
                                 value: controller.isRemember.value),
                             SizedBox(width: 9),
                             Text(
                               "Remember me",
                               style: TextStyle(fontSize: 12,
                               fontWeight: FontWeight.w400,
                               color: isDarkMode ? AppColors.titleTextColor : AppColors.textFieldTextColor),
                             ),
                           ],
                         ),
                       ),
                       TextButton(onPressed: () {}, child: Text("Forgot Password?",
                       style: TextStyle(
                         fontSize: 12,
                         color: AppColors.textRedColor
                       ),))
                     ],
                   ),
                 ],
               ),
             ),
             const SizedBox(height: 8),
             Stack(
               children: [
                 Align(
                   alignment: Alignment.bottomLeft,
                   child: Container(
                     height: isDarkMode ? 190 : 180,
                     width: isDarkMode?  285 : 260,
                     child: Image.asset(
                       isDarkMode? AppImages.bottomLogo2Dark:
                       AppImages.bottomLightLogo2,
                     ),
                   ),
                 ),
                 Padding(
                   padding: EdgeInsets.fromLTRB(22.0,isDarkMode ? 80.0 : 51.0,22.0,30.0),
                   child: CustomButton(onTap: () {
                      Get.toNamed(Routes.FORGET_PASSWORD);
                   },
                     buttonText: "Login",
                     btnBGColor: AppColors.appPrimaryColor,),
                 )
               ],
             )
           ],
         ),

          )
        ),
      ),
    );
  }
}
