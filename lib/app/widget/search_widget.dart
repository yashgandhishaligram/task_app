

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:task_app/app/modules/task_details/controllers/member_selection_controller.dart';

import '../core/constants/images.dart';
import '../core/theme/colors.dart';
import '../modules/task_details/controllers/task_details_controller.dart';

class SearchWidget extends SearchDelegate<String> {
  MemberSelectionController taskDetailsController = Get.put(MemberSelectionController());
  BuildContext context;
  StreamController? streamController;

  SearchWidget(
      {required this.context,
        this.streamController});

  @override
  String get searchFieldLabel => 'Search';

  @override
  List<Widget>? buildActions(BuildContext context) {

    throw UnimplementedError();
  }

  @override
  Widget? buildLeading(BuildContext context) {

    throw UnimplementedError();
  }

  @override
  Widget buildResults(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    query = query.replaceFirst(RegExp(r"^\s+"), "");
   // query.isEmpty ? null : taskDetailsController.recentsearch.add(query);
    List<String> matchQuery = [];
    for (var member in taskDetailsController.memberList) {
      if (member["name"].toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(member);
      }
    }
    return StreamBuilder(
        stream: streamController!.stream,
        builder: (context, snapshot) {
          return GetBuilder<TaskDetailsController>(
              builder: (controller) {
            return
              // controller.isFirstLoadRunningg.value
              //   ? Center(
              //   child: CircularProgressIndicator(
              //     color: AppColors.themebules,
              //   ))
              //   :
              query.isNotEmpty
                // ? controller.topproductList.isEmpty &&
                // controller.BuyerGuideList.isEmpty &&
                // controller.productList.isEmpty
                ? ListView.builder(
                  itemCount: matchQuery.length,
                  shrinkWrap: true,
                  itemBuilder: (context,index) {
                    return  memberCardView(context, matchQuery[index]);
                  }):
                  Container();
          });
        });
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    throw UnimplementedError();
  }

  Widget memberCardView(BuildContext context, member){
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Container(
      height: 62,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          // gradient : isDarkMode?
          //           AppColors.membersCardDarkBgColors:
          //           AppColors.membersCardLightBgColors,
          color: isDarkMode?
          AppColors.textFieldBGColor:
          AppColors.textWhiteColor

      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0,left: 16.0,bottom: 8.0,right: 16.0),
        child: Row(
          //crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 4.2.h,
              width: 4.2.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.0),
                  border: Border.all(
                      width: 2.0, color: AppColors.teamBgColor1)),
              child: CircleAvatar(
                  backgroundColor:AppColors.appPrimaryColor,
                  child:  CircleAvatar(
                    backgroundImage: AssetImage(AppImages.profileFemalePNG),
                    //child: SvgPicture.asset(image),
                  )
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(member["name"],
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color:
                      isDarkMode?
                      AppColors.textWhiteColor:
                      AppColors.textFieldTextColor
                  ),),
                const SizedBox(height: 1),
                Text(member["position"],
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: AppColors.titleTextColor
                  ),)
              ],
            ),
            const Spacer(),
            Container(
              height: 18,
              width: 18,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      width: 1,
                      color: AppColors.checkBoxBorderColor
                  ),
                  color: AppColors.textWhiteColor
              ),
              child:  Icon(
                  Icons.check_rounded,
                  color: isDarkMode?
                  AppColors.titleTextColor:
                  AppColors.timelineBgColor,
                  size: 12),
            )
          ],
        ),
      ),
    );
  }

}