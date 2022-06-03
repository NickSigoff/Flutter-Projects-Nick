import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../data/data_provider.dart';
import '../../../utils/main_colors.dart';

class CurrentDateWidget extends StatelessWidget {
  const CurrentDateWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int currentTime = context.watch<DataProvider>().getForecast.current!.dt!;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: FittedBox(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: MainColors.currentDateWidgetColor,
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Text(
            getCurrentDate(currentTime),
            style: const TextStyle(
              color: MainColors.dateTextColor,
              fontSize: 12,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }

  String getCurrentDate(int currentTime) {
    var date = DateTime.fromMillisecondsSinceEpoch(currentTime * 1000);
    return DateFormat('EEEE d MMM yyyy | hh:mm aaa').format(date);
  }
}
