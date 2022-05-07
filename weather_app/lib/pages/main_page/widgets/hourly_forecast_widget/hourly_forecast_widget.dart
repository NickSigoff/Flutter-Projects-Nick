import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_forecast.dart';
import 'package:weather_app/utils/main_styles.dart';

import 'hour_weather_widget.dart';

class HourlyForecast extends StatelessWidget {
  const HourlyForecast({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hourlyForecast = context.watch<WeatherForecast>().hourly!;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Text(
              'Hourly Forecast',
              style: MainStyles.bottomTextTextStyle,
            ),
          ),
          SizedBox(
            height: 100,
            width: MediaQuery.of(context).size.width,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) =>
                  HourWeatherWidget(
                      dateTime: DateTime.fromMillisecondsSinceEpoch(
                          hourlyForecast[index].dt! * 1000),
                      temperature: hourlyForecast[index].temp!,
                      icon: hourlyForecast[index].getHourlyIconUrl()),
              itemCount: hourlyForecast.length,
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(
                width: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
