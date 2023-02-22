import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_app/app/core/theme/colors.dart';
import 'package:task_app/app/modules/admin_home/controllers/admin_home_controller.dart';

class CustomSwitchWidget extends StatelessWidget {
  CustomSwitchWidget(
      {Key? key,
      this.controller,
      this.value = false,
      @required this.onChanged,
      this.title})
      : super(key: key);

  bool? value;
  ValueChanged<bool>? onChanged;
  String? title;
  AdminHomeController? controller;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Obx(() => SizedBox(
        height: 20,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            InkWell(
                splashColor: Colors.transparent,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.decelerate,
                  height: 20,
                  width: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60.0),
                    color: isDarkMode
                        ? controller!.isPunchOut.value
                            ? AppColors.toggleLightBGColor
                            : AppColors.toggleLightBGColor
                        : !controller!.isPunchOut.value
                            ? AppColors.toggleLightBGColor
                            : AppColors.toggleLightBGColor,
                  ),
                  child: AnimatedAlign(
                    duration: const Duration(milliseconds: 300),
                    alignment: controller!.isPunchOut.value
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    curve: Curves.decelerate,
                    child: Container(
                      width: 15,
                      height: 15,
                      margin: EdgeInsets.only(left: 3, right: 3.0),
                      decoration: BoxDecoration(
                        color: AppColors.toggleGreenColor,
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  controller!.isPunchOut.value =
                      !controller!.isPunchOut.value;
                  onChanged!(controller!.isPunchOut.value);
                }),
          ],
        ),
      ),
    );
  }
}
