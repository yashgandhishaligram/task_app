import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var isObsecure = true.obs;
  var isRemember = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void changeRememberUser() {
    if (isRemember.value == false) {
      isRemember.value = true;
    } else if (isRemember.value == true) {
      isRemember.value = false;
    }
    update();
  }


  @override
  void onClose() {}
}
