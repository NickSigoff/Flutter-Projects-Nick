import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/pages/main_page/widgets/more_info_day_weather_widget/more_info_forecast_widget.dart';
import 'package:weather_app/utils/constants.dart';
import 'package:weather_app/utils/main_colors.dart';
import 'package:weather_app/utils/main_styles.dart';

import '../../../../data/data_provider.dart';

class MoreInfoDayWeatherWidget extends StatelessWidget {
  final Function onTap;
  final int index;

  //final Daily dailyWeather;

  const MoreInfoDayWeatherWidget({
    Key? key,
    required this.onTap,
    required this.index,
  }) : super(key: key);

  String getDate(int time) {
    var date = DateTime.fromMillisecondsSinceEpoch(time * 1000);
    return DateFormat('EEEE, d MMM, yyyy').format(date);
  }

  @override
  Widget build(BuildContext context) {
    final dailyWeather = context.watch<DataProvider>().getForecast.daily![index];
    Image weatherImage = Image.network(
        dailyWeather.getDailyIconUrl() + Constants.imagesExtension);

    Text minTemp = Text(
        '${dailyWeather.temp!.min!.toStringAsFixed(0)}${Constants.degreeMetric}',
        style: MainStyles.smallInscriptionsLight);

    Text maxTemp = Text(
        '${dailyWeather.temp!.max!.toStringAsFixed(0)}${Constants.degreeMetric}',
        style: MainStyles.smallInscriptionsLight);

    Text date = Text(
      getDate(dailyWeather.dt!),
      style: MainStyles.smallInscriptionsLight,
      overflow: TextOverflow.ellipsis,
    );

    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Column(
        children: [
          Container(
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
                      : date,
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
          ),
          MoreInfoWeatherWidget(index: index),
        ],
      ),
    );
  }
}
