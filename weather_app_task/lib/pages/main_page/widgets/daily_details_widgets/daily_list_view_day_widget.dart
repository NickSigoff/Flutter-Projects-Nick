import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';


import '../../../../data/data_provider.dart';
import '../../../../utils/main_colors.dart';

class DailyListViewDayWidget extends StatelessWidget {
  final Function onTap;
  final int pageIndex;
  final int selectedPage;

  const DailyListViewDayWidget({
    Key? key,
    required this.onTap,
    required this.pageIndex,
    required this.selectedPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dailyTime =
        context.watch<DataProvider>().getForecast.daily![pageIndex].dt!;
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
          color: selectedPage == pageIndex
              ? MainColors.currentDateWidgetColor
              : Colors.transparent,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Text(
          getCurrentDate(dailyTime),
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

  String getCurrentDate(int dailyTime) {
    var date = DateTime.fromMillisecondsSinceEpoch(dailyTime * 1000);
    return DateFormat('EEEE\nd MM').format(date);
  }
}
