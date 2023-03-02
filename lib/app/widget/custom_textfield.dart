
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_app/app/core/theme/colors.dart';

import '../core/validations/auth_form_velidation.dart';
import 'package:sizer/sizer.dart';

class CustomFormField extends StatelessWidget {
  CustomFormField({
    Key? key,
    required TextEditingController controller,
    required TextInputType keyboardType,
    required TextInputAction inputAction,
    required String hint,
    required String validator,
    this.maxLimits,
    this.getxController,
    this.onTap,
    this.onFieldSubmitted,
    this.onSaved,
    this.postIconBtn,
    this.prefixIcon,
    this.filteringRegex = ".*",
    this.isEnabled,
    this.isObscure = false,
    this.height,
    this.isOtp = false,
    this.isPassword = false,
    this.isCapitalized = false,
    this.maxLines = 1,
    this.isLabelEnabled = true,
    this.textFieldLabel,
    this.textFieldLabelSize,
    this.inputformet,
  })  : _keyboardType = keyboardType,
        _inputAction = inputAction,
        _hint = hint,
        _validator = validator,
        _controller = controller,
        super(key: key);
  final Widget? postIconBtn;
  final Widget? prefixIcon;
  final bool? isEnabled;
  final List<TextInputFormatter>? inputformet;
  final TextInputType _keyboardType;
  final TextInputAction _inputAction;
  final String _hint;
  final String? textFieldLabel;
  final double? textFieldLabelSize;
  bool isObscure;
  final double? height;
  final bool isCapitalized;
  final int maxLines;
  final int? maxLimits;
  final bool isLabelEnabled;
  final String _validator;
  final String? filteringRegex;
  final bool isOtp;
  final bool isPassword;
  final TextEditingController _controller;
  final ValueChanged<String>? getxController;
  final GestureTapCallback? onTap;
  final ValueChanged<String>? onFieldSubmitted;
  final FormFieldSetter<String>? onSaved;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:  EdgeInsets.only(left: 10.0),
          child: Text(
            textFieldLabel!,
            style: TextStyle(
                fontSize: textFieldLabelSize == ""? 14.sp : textFieldLabelSize,
                fontWeight: FontWeight.w500,
                color: AppColors.titleTextColor
            ),
          ),
        ),
        SizedBox(height: 6),
        TextFormField(
          controller: _controller,
          inputFormatters: inputformet,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          style:  TextStyle(color: isDarkMode ? AppColors.textWhiteColor : AppColors.textFieldTextColor),
          maxLines: maxLines,
          enabled: isEnabled,
          keyboardType: _keyboardType,
          obscureText: isObscure,
          textCapitalization:
          isCapitalized ? TextCapitalization.words : TextCapitalization.none,
          textInputAction: _inputAction,
          onChanged: getxController,
          onTap: onTap,
          onFieldSubmitted: onFieldSubmitted,
          onSaved: onSaved,
          validator: (value) =>
              AuthFormValidation().formValidation(value!, _validator),
          decoration: InputDecoration(
              labelStyle: TextStyle(color: AppColors.textFieldTextColor),
              suffixIcon: postIconBtn,
              prefixIcon: prefixIcon,
              hintText: _hint,
              filled: true, //<-- SEE HERE
              fillColor: isDarkMode ? AppColors.textFieldBGColor : AppColors.textWhiteColor,
              hintStyle:  TextStyle(
                color: Colors.grey.withOpacity(0.5),
              ),
              errorStyle: TextStyle(color: AppColors.appPrimaryColor, height: height),
              // helperStyle: const TextStyle(
              //   color: Color(0xFF2BACE2),
              // ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide(
                    color: AppColors.appPrimaryColor,
                    width: 1,
                  )),
              contentPadding:  EdgeInsets.fromLTRB(18.0, 22.0, 0.0, 22.0),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide:  BorderSide(
                  color: AppColors.appPrimaryColor,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: BorderSide(
                  color: isDarkMode ? AppColors.textFieldBGColor : AppColors.textWhiteColor,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide:  BorderSide(
                  color: AppColors.appPrimaryColor,
                  width: 1,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: BorderSide(
                  color: AppColors.appPrimaryColor,
                  width: 1,
                ),
              )),
        ),
      ],
    );
  }
}