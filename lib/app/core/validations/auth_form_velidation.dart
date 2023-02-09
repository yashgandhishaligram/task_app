import 'form_field_validation.dart';

class AuthFormValidation {
  FormFieldValidation formFieldValidation = FormFieldValidation();

  String? formValidation(String value, String field) {
    switch (field) {

      case "email":
        return formFieldValidation.emailField(value);
      // break;

      case "password":
        return formFieldValidation.validatePassword(value);
      // break;

      case "phoneNum":
        return formFieldValidation.phoneNumField(value);
      // break;

    }
    return null;
  }
}
