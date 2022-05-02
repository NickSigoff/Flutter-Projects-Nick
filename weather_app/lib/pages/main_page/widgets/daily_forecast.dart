import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/models/weather_forecast.dart';

import '../../../utils/constants.dart';
import '../../../utils/main_colors.dart';
import '../../../utils/main_styles.dart';

class DailyForecast extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;

  const DailyForecast({Key? key, required this.snapshot}) : super(key: key);

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
                ...List<Widget>.generate(7,
                    (index) => DayCommonInfo(snapshot: snapshot, index: index))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DayCommonInfo extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;
  final int index;

  const DayCommonInfo({required this.index, required this.snapshot, Key? key})
      : super(key: key);

  String getDate(int index) {
    var date = DateTime.fromMillisecondsSinceEpoch(
        snapshot.data!.daily![index].dt! * 1000 +
            snapshot.data!.timezoneOffset! * 1000);
    return DateFormat('EEEE, d MMM, yyyy').format(date);
  }

  @override
  Widget build(BuildContext context) {
    String date = getDate(index);

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
                    date,
                    style: MainStyles.smallInscriptionsLight,
                    overflow: TextOverflow.ellipsis,
                  ),
          ),
           Expanded(
            flex: 1,
            child: Image.network(snapshot.data!.daily![index].getDailyIconUrl() + Constants.imagesExtension)
          ),
          const Spacer(
            flex: 1,
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Text(
                  '${snapshot.data!.daily![index].temp!.min!.toStringAsFixed(0)}\u2103',
                  style: MainStyles.smallInscriptionsLight,
                ),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  '${snapshot.data!.daily![index].temp!.max!.toStringAsFixed(0)}\u2103',
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
