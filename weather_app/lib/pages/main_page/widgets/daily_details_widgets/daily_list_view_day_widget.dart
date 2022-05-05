import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../utils/main_colors.dart';

class DailyListViewDayWidget extends StatelessWidget {
  final int dailyTime;
  final Function onTap;
  final int pageIndex;
  final int selectedPage;

  const DailyListViewDayWidget({
    Key? key,
    required this.dailyTime,
    required this.onTap,
    required this.pageIndex,
    required this.selectedPage,
  }) : super(key: key);

  String getCurrentDate() {
    var date = DateTime.fromMillisecondsSinceEpoch(dailyTime * 1000);
    return DateFormat('EEEE\nd MM').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap(pageIndex);
      },
      child: Container(
        width: 100,
        height: 50,
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: selectedPage == pageIndex ? MainColors.currentDateWidgetColor : Colors.transparent,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Text(
          getCurrentDate(),
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: MainColors.selectedTextMainPage,
            fontSize: 12,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
