import 'package:get/get.dart';

import '../../../core/theme/colors.dart';

class TaskDetailsController extends GetxController {
  var isSelected = false.obs;
  String? selectedStatus;
  var reloadDropdown = false.obs;
  List<String> selectedItemValue = <String>[];
  RxString selectedDropdown = "Completed".obs;
  var statusList = [ "Completed","Inprogress","Pending"];
  var statusColors = [
    AppColors.checkBoxItemColor1,
    AppColors.checkBoxItemColor2,
    AppColors.checkBoxItemColor3
  ].obs;
  var teamList = ["Designer","Developer","QA Tester"].obs;
  var assignedWorkList = ["Designer"].obs;
  var teamLightBgColors = [
    AppColors.teamBgColor1,
    AppColors.teamBgColor2,
    AppColors.teamBgColor3
  ];
  var teamDarkBgColors = [
    AppColors.teamBgColor1,
    AppColors.teamDarkBgColor2,
    AppColors.teamBgColor3
  ];
  List workingPersonList = ['Shopping','Service','Hotel','More', 'Custom','More', 'Custom'];
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}
