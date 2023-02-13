import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordController extends GetxController {

  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  var isNewObsecure = true.obs;
  var isConfirmObsecure = true.obs;

  @override
  void onInit() {
    super.onInit();
  }

}
