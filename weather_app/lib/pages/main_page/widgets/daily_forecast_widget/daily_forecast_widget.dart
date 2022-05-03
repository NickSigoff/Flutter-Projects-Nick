import 'package:flutter/material.dart';

import 'package:weather_app/models/weather_forecast.dart';
import 'package:weather_app/pages/main_page/widgets/daily_forecast_widget/day_weather_widget.dart';
import '../../../../utils/main_styles.dart';

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
                ...List<Widget>.generate(
                    7, (index) => DayWeather(snapshot: snapshot, index: index))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
