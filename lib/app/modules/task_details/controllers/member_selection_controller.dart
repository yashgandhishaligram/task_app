import 'package:get/get.dart';

class MemberSelectionController extends GetxController {

  List memberList = [
    {
      "name" : "Casiel Checoni",
      "position" : "Sr. UI/UX Designer & Visualizer"
    },
    {
      "name" : "Alexey Klimov",
      "position" : "Sr. UI/UX Designer"
    },
    {
      "name" : "Marcin Maciega",
      "position" : "Graphics Designer"
    },
  ];
  var isMemberSelected = false.obs;

}
