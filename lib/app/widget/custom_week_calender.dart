import 'package:flutter/material.dart';

import '../core/theme/colors.dart';

class CustomWeekCalender extends StatefulWidget {
  @override
  _CustomWeekCalenderState createState() => _CustomWeekCalenderState();
}

class _CustomWeekCalenderState extends State<CustomWeekCalender> {
  DateTime selectedDate = DateTime.now(); // TO tracking date
  int currentDateSelectedIndex = 0; //For Horizontal Date
  ScrollController scrollController = ScrollController();
  List<String> listOfMonths = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];
  List<String> listOfDays = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //To show Calendar Widget
        SizedBox(
            height: 60,
            child: ListView.separated(
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(width: 11);
              },
              itemCount: 365,
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      currentDateSelectedIndex = index;
                      selectedDate = DateTime.now().add(Duration(days: index));
                    });
                  },
                  child: Container(
                    height: 55,
                    width: 45,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: isDarkMode
                          ? AppColors.calCardBGColor
                          : AppColors.textWhiteColor,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                          color: isDarkMode
                              ? currentDateSelectedIndex == index
                                  ? AppColors.appPrimaryColor
                                  : AppColors.calCardBGColor
                              : currentDateSelectedIndex != index
                                  ? AppColors.textWhiteColor
                                  : AppColors.appPrimaryColor,
                          width: 2.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          listOfDays[DateTime.now().add(Duration(days: index)).weekday - 1].toString(),
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: isDarkMode
                                ? currentDateSelectedIndex == index
                                    ? AppColors.tabColor
                                    : AppColors.titleTextColor
                                : currentDateSelectedIndex != index
                                    ? AppColors.tabColor
                                    : AppColors.titleTextColor,
                          ),
                        ),
                        Text(
                          DateTime.now()
                              .add(Duration(days: index))
                              .day
                              .toString(),
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: currentDateSelectedIndex == index
                                ? AppColors.appPrimaryColor
                                : AppColors.titleTextColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            )),
        SizedBox(height: 10),
        //to show Current time
        Text(
          // selectedDate.day.toString() +
          //     '-' +
              '${listOfMonths[selectedDate.month - 1]} ${selectedDate.year}',
          style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppColors.tabColor),
        ),
        //SizedBox(height: 10),
      ],
    );
  }
}
