import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_forecast.dart';
import 'package:weather_app/utils/constants.dart';
import 'package:weather_app/utils/wind_direction.dart';

import 'information_row_widget.dart';

class DailyInfoWidget extends StatelessWidget {
  final Daily dailyWeather;

  const DailyInfoWidget({Key? key, required this.dailyWeather})
      : super(key: key);

  get chooseWindDirection => null;

  @override
  Widget build(BuildContext context) {
    List<String> icons = [
      'assets/images/common_weather_icons/temp_quarter.png',
      'assets/images/common_weather_icons/temp_quarter.png',
      'assets/images/common_weather_icons/temp_quarter.png',
      'assets/images/common_weather_icons/temp_quarter.png',
      'assets/images/common_weather_icons/night_temp.png',
      'assets/images/common_weather_icons/wind.png',
      'assets/images/common_weather_icons/wind_direction.png',
      'assets/images/common_weather_icons/pressure.png',
      'assets/images/common_weather_icons/humidity.png',
      'assets/images/common_weather_icons/sun.png',
      'assets/images/common_weather_icons/cloud.png',
    ];
    List<String> parameters = [
      'Min',
      'Max',
      'Day temp',
      'Night temp',
      'Feels like',
      'Wind speed',
      'Wind direction',
      'Pressure',
      'Humidity',
      'UV index',
      'Clouds',
    ];
    List<String> values = [
      '${dailyWeather.temp!.min}${Constants.degreeMetric}',
      '${dailyWeather.temp!.max}${Constants.degreeMetric}',
      '${dailyWeather.temp!.day}${Constants.degreeMetric}',
      '${dailyWeather.temp!.night}${Constants.degreeMetric}',
      '${dailyWeather.feelsLike!.day}${Constants.degreeMetric}',
      '${dailyWeather.windSpeed}',
      (WindDirection.chooseWindDirection(dailyWeather.windDeg!)),
      '${dailyWeather.pressure}',
      '${dailyWeather.humidity}%',
      '${dailyWeather.uvi}%',
      '${dailyWeather.clouds}%',
    ];


    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.yellow,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Image.network(
                  dailyWeather.getDailyIconUrl() + Constants.imagesExtension),
              Text('${dailyWeather.temp!.day}'),
            ],
          ),
          Text('${dailyWeather.weather![0].main}'),
          Text('${dailyWeather.weather![0].description}'),
          ...List.generate(
            icons.length,
                (index) => InformationRow(
              icon: icons[index],
              text: parameters[index],
              value: values[index],
            ),
          ),
        ],
      ),
    );
  }
}