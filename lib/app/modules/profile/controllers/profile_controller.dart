import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  //TODO: Implement ProfileController
  TextEditingController emailController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController experienceController = TextEditingController();
  var reloadDropdown = false.obs;
  var genderList = ["Male", "Female"];
  var selectedDate = "".obs;
  RxString selectedGender = "Male".obs;
  RxString selected ="Male".obs;

}
