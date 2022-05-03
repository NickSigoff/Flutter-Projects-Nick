import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/models/weather_forecast.dart';
import 'package:weather_app/pages/main_page/widgets/current_parameters_widget/current_parameter_widget.dart';
import '../../../../utils/constants.dart';
import '../../../../utils/wind_direction.dart';

class GeneralCurrentParameters extends StatelessWidget {
  final List<String> iconsText = [
    'Sunrise:',
    'Sunset:',
    'Wind direction:',
    'Wind speed:',
    'Pressure:',
    'Humidity:',
  ];
  final List<String> icons = [
    'assets/images/common_weather_icons/sun.png',
    'assets/images/common_weather_icons/sunset.png',
    'assets/images/common_weather_icons/wind_direction.png',
    'assets/images/common_weather_icons/wind.png',
    'assets/images/common_weather_icons/pressure.png',
    'assets/images/common_weather_icons/humidity.png',
  ];

  final AsyncSnapshot<WeatherForecast> snapshot;

  GeneralCurrentParameters({Key? key, required this.snapshot})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var currentWeather = snapshot.data!.current!;
    var timeOffset = snapshot.data!.timezoneOffset! * 1000;
    List<String> values = [
      ' ${DateFormat('h:mm a').format(DateTime.fromMillisecondsSinceEpoch(currentWeather.sunrise! * 1000 + timeOffset))}',
      ' ${DateFormat('h:mm a').format(DateTime.fromMillisecondsSinceEpoch(currentWeather.sunset! * 1000 + timeOffset))}',
      ' ${WindDirection.chooseWindDirection(currentWeather.windDeg!)}',
      ' ${currentWeather.windSpeed} ${Constants.speedMetric}',
      ' ${currentWeather.pressure!} ${Constants.pressureMetric}',
      ' ${currentWeather.humidity}%',
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
      child: Wrap(
        alignment: WrapAlignment.center,
        children: [
          ...List<Widget>.generate(
              values.length,
              (index) => CurrentParameter(
                  text: iconsText[index],
                  icon: icons[index],
                  value: values[index]))
        ],
      ),
    );
  }
}
