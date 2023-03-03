import 'package:get/get.dart';

import '../controllers/member_selection_controller.dart';

class MemberSelectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MemberSelectionController>(
      () => MemberSelectionController(),
    );
  }
}
