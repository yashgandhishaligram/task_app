import 'package:get/get.dart';

class FormFieldValidation {

  String? emailField(String value) {
    RegExp regex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (value.isEmpty) {
      return "Email can't be empty";
    } else {
      if (!regex.hasMatch(value)) {
        return 'Enter valid email';
      } else {
        return null;
      }
    }
  }

  String? validatePassword(String value) {
    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{0,}$');
    if (value.isEmpty) {
      return "Password can't be empty";
    } else {
      if (!regex.hasMatch(value)) {
        return 'Password must have A-Z, a-z, 0-9 and min. one special characters';
      } else if (value.length < 8) {
        return 'Min. 8 characters required';
      } else {
        return null;
      }
    }
  }

  String? phoneNumField(String value) {
    RegExp regex = RegExp(
        r'(^\+{0,2}([\-\. ])?(\(?\d{0,3}\))?([\-\. ])?\(?\d{0,3}\)?([\-\. ])?\d{3}([\-\. ])?\d{4})');
    if (value.isEmpty) {
      //^(\([0-9]{3}\)|[0-9]{3}-)[0-9]{3}-[0-9]{4}$
      return "Phone no. can't be Empty";
    } else if (value.length < 10 || !regex.hasMatch(value)) {
      return "Enter Valid Phone Number";
    } else {
      return null;
    }
  }

}
