import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_forecast.dart';
import 'package:weather_app/utils/main_styles.dart';

import 'main_hour_weather_widget.dart';

class MainHourlyForecast extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;

  const MainHourlyForecast({Key? key, required this.snapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var hourlyWeather = snapshot.data!.hourly!;
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
                  MainHourWeatherWidget(
                      dateTime: DateTime.fromMillisecondsSinceEpoch(
                          hourlyWeather[index].dt! * 1000 +
                              snapshot.data!.timezoneOffset! * 1000),
                      temperature: hourlyWeather[index].temp!,
                      icon: hourlyWeather[index].getHourlyIconUrl()),
              itemCount: hourlyWeather.length,
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
