import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:task_app/app/core/theme/theme_enums.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "task_app",
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      defaultTransition: Transition.cupertino,
      getPages: AppPages.routes,
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeMode.system,
    ),
  );
}
