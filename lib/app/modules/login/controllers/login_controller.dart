import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var isObsecure = true.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {}
}
