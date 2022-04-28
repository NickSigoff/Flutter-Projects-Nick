import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../utils/main_colors.dart';
import '../../../utils/main_styles.dart';

class DailyForecast extends StatelessWidget {
  const DailyForecast({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Text(
              'Daily Forecast',
              style: MainStyles.bottomTextTextStyle,
            ),
          ),
          Container(
            //height: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              gradient: const LinearGradient(
                colors: [Color(0xff2f313a), Color(0xff232329)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              children: [
                ...List<Widget>.generate(
                    7, (index) => DayCommonInfo(index: index))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DayCommonInfo extends StatelessWidget {
  final int index;
  DateTime startDate = DateTime.now();

  DayCommonInfo({required this.index, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime nextDate =
        DateTime.utc(startDate.year, startDate.month, startDate.day + index);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          const Expanded(
            flex: 1,
            child: Icon(
              Icons.keyboard_arrow_down,
              color: MainColors.backgroundDark,
            ),
          ),
          Expanded(
            flex: 4,
            child: index == 0
                ? Text(
                    'Today',
                    style: MainStyles.smallInscriptionsLight,
                  )
                : Text(
                    DateFormat('EEEE, d MMM, yyyy').format(nextDate),
                    style: MainStyles.smallInscriptionsLight,
                    overflow: TextOverflow.ellipsis,
                  ),
          ),
          const Expanded(
            flex: 1,
            child: Icon(
              Icons.cloud,
              color: Colors.white,
            ),
          ),
          const Spacer(
            flex: 1,
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Text(
                  '86\u2103',
                  style: MainStyles.smallInscriptionsLight,
                ),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  '67\u2103',
                  style: MainStyles.smallInscriptionsLight,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
