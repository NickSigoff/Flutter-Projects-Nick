import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../models/weather_forecast.dart';
import '../../../utils/constants.dart';
import '../../../utils/main_colors.dart';
import '../../../utils/main_styles.dart';

class DayWeather extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;
  final int index;

  const DayWeather({required this.index, required this.snapshot, Key? key})
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
    var dailyWeather = snapshot.data!.daily![index];

    Image weatherImage = Image.network(
        dailyWeather.getDailyIconUrl() + Constants.imagesExtension);

    Text minTemp = Text(
        '${dailyWeather.temp!.min!.toStringAsFixed(0)}${Constants.degreeMetric}',
        style: MainStyles.smallInscriptionsLight);

    Text maxTemp = Text(
        '${dailyWeather.temp!.max!.toStringAsFixed(0)}${Constants.degreeMetric}',
        style: MainStyles.smallInscriptionsLight);

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
          Expanded(flex: 1, child: weatherImage),
          const Spacer(flex: 1),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                minTemp,
                const SizedBox(width: 16),
                maxTemp,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
