import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:weather_app/models/weather_forecast.dart';
import 'package:weather_app/pages/main_page/widgets/daily_forecast_widget/day_weather_widget.dart';
import '../../../../utils/main_styles.dart';

class DailyForecast extends StatelessWidget {


  const DailyForecast({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dailyForecast = context.watch<WeatherForecast>().daily!;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Daily Forecast',
                  style: MainStyles.bottomTextTextStyle,
                ),
                Text(
                  'Min | Max',
                  style: MainStyles.bottomTextTextStyle,
                )
              ],
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
                ...List<Widget>.generate(
                  7,
                  (index) => DayWeather(
                    dailyWeather: dailyForecast[index],
                    index: index,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
