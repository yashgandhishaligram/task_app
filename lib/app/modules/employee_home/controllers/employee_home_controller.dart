import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../core/storage/box_storage.dart';

class EmployeeHomeController extends GetxController  with GetTickerProviderStateMixin{
  GetStorageHelper boxStorage = GetStorageHelper();
  var isPunchOut = false.obs;
  List workingPersonList = ['Shopping','Service','Hotel','More', 'Custom','More', 'Custom'];
  var currentTime =  DateFormat("hh:mm a").format(DateTime.now()).obs;
  late TabController tabController;
  List<Tab> tabList= <Tab>[
    Tab(text: "Daily Task",),
    Tab(text: "Projects",),
  ];
  var punchInTime = "09:30 AM".obs;
  var punchOutTime = "".obs;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: tabList.length, vsync: this);
    getPunchDetails();

  }

  void getPunchDetails()  {
    if(boxStorage.getPunchInTime() == null &&
        boxStorage.getPunchOutTime() == null &&
        boxStorage.getIsPunchOut() == null){
      punchInTime.value  = "09:30 AM";
      punchOutTime.value = "--:-- PM";
      isPunchOut.value = false;
    }else{
      punchInTime.value =  boxStorage.getPunchInTime().toString();
      punchOutTime.value =  boxStorage.getPunchOutTime().toString();
      isPunchOut.value = boxStorage.getIsPunchOut() as bool;
    }
  }

  void saveInPunchTime(String punchIntime) {
    boxStorage.setPunchInTime(punchIntime);
    boxStorage.isPunchOut(false);
  }

  void saveOutPunchTime(String punchOutTime) {
    boxStorage.setPunchOutTime(punchOutTime);
    boxStorage.isPunchOut(true);
  }

}
