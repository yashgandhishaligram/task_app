import 'dart:ffi';

import 'package:get_storage/get_storage.dart';

class GetStorageHelper {
  static final GetStorageHelper _singleton = GetStorageHelper._internal();

  static const String token = "TOKEN";
  static const String credential = "CREDENTIALS";
  static const String userLoggedIn = "USER_LOGGED_IN";
  static const String email = "yash@shaligram.com";
  static const String password = "Yg@12345";
  static const String punchInTime = "PUNCHINTIME";
  static const String punchOutTime = "PUNCHOUTTIME";
  static const String isPunchOUT = "ISPUNCHOUT";
  GetStorage box = GetStorage();

  GetStorageHelper._internal();

  factory GetStorageHelper() {
    return _singleton;
  }

  Future<void> setPunchInTime(String value) async {
    await box.write(punchInTime, value);
  }

  String? getPunchInTime() {
    final punchTime = box.read(punchInTime);
    return punchTime;
  }

  Future<void> setPunchOutTime(String value) async {
    await box.write(punchOutTime, value);
  }

  String? getPunchOutTime() {
    final credentials = box.read(punchOutTime);
    return credentials;
  }

  Future<void> isPunchOut(bool value) async {
    await box.write(isPunchOUT, value);
  }

  bool? getIsPunchOut() {
    var isPunchOut = box.read(isPunchOUT);
    return isPunchOut;
  }

  List? getUserCredentials() {
    final credentials = box.read(credential);
    return credentials;
  }

  Future<void> setUsedLoggedIn(bool? value) async {
    if (value != null) {
      await box.write(userLoggedIn, value);
    } else {
      await box.write(userLoggedIn, false);
    }
  }

  bool? getUsedLoggedIn() {
    var userLogIn = box.read(userLoggedIn);
    if (userLogIn != null) {
      return box.read(userLoggedIn);
    } else {
      return false;
    }
  }
}
