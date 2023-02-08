import 'package:get/get.dart';

import 'package:task_app/app/modules/home/bindings/home_binding.dart';
import 'package:task_app/app/modules/home/views/home_view.dart';
import 'package:task_app/app/modules/welcome/bindings/welcome_binding.dart';
import 'package:task_app/app/modules/welcome/views/welcome_view.dart';

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
  ];
}
