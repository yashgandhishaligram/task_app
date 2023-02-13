import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../core/theme/colors.dart';

class TextFieldOTP extends StatelessWidget {
  TextFieldOTP(
      {Key? key,
        required TextEditingController controller,
        required this.first,
        required this.last})
      : _controller = controller,
        super(key: key);

  final TextEditingController _controller;
  bool first, last;
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return SizedBox(
      height: 63,
      width: 45,
      child: AspectRatio(
        aspectRatio: 0.9,
        child: TextField(
          cursorColor: AppColors.textColor,
          controller: _controller,
          autofocus: true,
          onChanged: (value) {
            if (value.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            }
            if (value.isEmpty && first == false) {
              FocusScope.of(context).previousFocus();
            }
          },
          showCursor: false,
          readOnly: false,
          textAlign: TextAlign.center,
          style:  TextStyle(color: isDarkMode ? AppColors.textWhiteColor : AppColors.textFieldTextColor),
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly
          ],
          maxLength: 1,
          decoration: InputDecoration(
              filled: true,
              fillColor: isDarkMode ? AppColors.textFieldBGColor : AppColors.textWhiteColor,
            counter: const Offstage(),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide(
                color: isDarkMode ? AppColors.textFieldBGColor : AppColors.textWhiteColor,
              ),
            ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: BorderSide(
                  color: AppColors.appPrimaryColor,
                  width: 1,
                ),
              ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: BorderSide(
                  color: isDarkMode ? AppColors.titleTextColor : AppColors.appPrimaryColor,
                  width: 1,
                )),
          ),
        ),
      ),
    );
  }
}
