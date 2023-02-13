import 'package:get/get.dart';

import 'package:task_app/app/modules/home/bindings/home_binding.dart';
import 'package:task_app/app/modules/home/views/home_view.dart';
import 'package:task_app/app/modules/login/bindings/login_binding.dart';
import 'package:task_app/app/modules/login/views/login_view.dart';
import 'package:task_app/app/modules/reset_password/bindings/reset_password_binding.dart';
import 'package:task_app/app/modules/reset_password/views/reset_password_view.dart';
import 'package:task_app/app/modules/verify_email/bindings/verify_email_binding.dart';
import 'package:task_app/app/modules/verify_email/views/verify_email_view.dart';
import 'package:task_app/app/modules/welcome/bindings/welcome_binding.dart';
import 'package:task_app/app/modules/welcome/views/welcome_view.dart';

import '../modules/forgot_password/bindings/forgot_password_binding.dart';
import '../modules/forgot_password/views/forgot_password_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.WELCOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.WELCOME,
      page: () => WelcomeView(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.FORGET_PASSWORD,
      page: () => ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: _Paths.VERIFY_EMAIL,
      page: () => VerifyEmailView(),
      binding: VerifyEmailBinding(),
    ),
    GetPage(
      name: _Paths.RESET_PASSWORD,
      page: () => ResetPasswordView(),
      binding: ResetPasswordBinding(),
    ),
  ];
}
