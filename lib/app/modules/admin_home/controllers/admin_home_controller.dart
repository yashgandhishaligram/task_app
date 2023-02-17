import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:task_app/app/core/storage/box_storage.dart';

class AdminHomeController extends GetxController {
  GetStorageHelper boxStorage = GetStorageHelper();
  var isChecked = false.obs;
  List workingPersonList = ['Shopping','Service','Hotel','More', 'Custom','More', 'Custom'];
  var currentTime =  DateFormat("hh:mm a").format(DateTime.now()).obs;
  var punchInTime = "09:30 AM".obs;
  var punchOutTime = "".obs;

  @override
  void onInit() {
    super.onInit();
    getPunchDetails();
  }

  void getPunchDetails()  {
    punchInTime.value =  boxStorage.getPunchInTime().toString();
    punchOutTime.value =  boxStorage.getPunchOutTime().toString();
    print( "intime" +  punchInTime.value);
    print( "outtime" +   punchOutTime.value);
  }

  void saveInPunchTime(String punchIntime) {
    boxStorage.setPunchInTime(punchIntime);
    print("intime :" + boxStorage.getPunchInTime().toString());
  }

  void saveOutPunchTime(String punchOutTime) {
    boxStorage.setPunchOutTime(punchOutTime);
    print("outtime :" + boxStorage.getPunchOutTime().toString());
  }


}
