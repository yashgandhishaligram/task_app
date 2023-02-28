import 'package:get/get.dart';

import 'package:task_app/app/modules/admin_home/bindings/admin_home_binding.dart';
import 'package:task_app/app/modules/admin_home/views/admin_home_view.dart';
import 'package:task_app/app/modules/employee_home/bindings/employee_home_binding.dart';
import 'package:task_app/app/modules/employee_home/views/employee_home_view.dart';
import 'package:task_app/app/modules/home/bindings/home_binding.dart';
import 'package:task_app/app/modules/home/views/home_view.dart';
import 'package:task_app/app/modules/login/bindings/login_binding.dart';
import 'package:task_app/app/modules/login/views/login_view.dart';
import 'package:task_app/app/modules/profile/bindings/profile_binding.dart';
import 'package:task_app/app/modules/profile/views/profile_view.dart';
import 'package:task_app/app/modules/reset_password/bindings/reset_password_binding.dart';
import 'package:task_app/app/modules/reset_password/views/reset_password_view.dart';
import 'package:task_app/app/modules/splash/bindings/splash_binding.dart';
import 'package:task_app/app/modules/splash/views/splash_view.dart';
import 'package:task_app/app/modules/task_details/bindings/task_details_binding.dart';
import 'package:task_app/app/modules/task_details/views/task_details_view.dart';
import 'package:task_app/app/modules/verify_email/bindings/verify_email_binding.dart';
import 'package:task_app/app/modules/verify_email/views/verify_email_view.dart';
import 'package:task_app/app/modules/welcome/bindings/welcome_binding.dart';
import 'package:task_app/app/modules/welcome/views/welcome_view.dart';

import '../modules/forgot_password/bindings/forgot_password_binding.dart';
import '../modules/forgot_password/views/forgot_password_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

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
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN_HOME,
      page: () => AdminHomeView(),
      binding: AdminHomeBinding(),
    ),
    GetPage(
      name: _Paths.EMPLOYEE_HOME,
      page: () => EmployeeHomeView(),
      binding: EmployeeHomeBinding(),
    ),
    GetPage(
      name: _Paths.TASK_DETAILS,
      page: () => TaskDetailsView(),
      binding: TaskDetailsBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
  ];
}
