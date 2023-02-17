import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sizer/sizer.dart';
import 'package:task_app/app/core/theme/theme_enums.dart';

import 'app/routes/app_pages.dart';

void main() async{
  await GetStorage.init();
  runApp(Sizer(builder: (context, orientation, deviceType) {
    return GetMaterialApp(
      title: "task_app",
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      defaultTransition: Transition.cupertino,
      getPages: AppPages.routes,
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeMode.system,
    );
  }));
}
