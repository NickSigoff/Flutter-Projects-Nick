import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/pages/main_page/widgets/current_parameter_widget.dart';

import '../../../../data/data_provider.dart';
import '../../../../utils/constants.dart';

class MoreInfoWeatherWidget extends StatelessWidget {
  final List<String> iconsText = [
    'Sunrise:',
    'Sunset:',
    'Pressure:',
    'Humidity:',
    'Day temperature:',
    'Night temperature:',
    'Max temperature:',
    'Min temperature:',
  ];
  final List<String> icons = [
    'assets/images/common_weather_icons/sun.png',
    'assets/images/common_weather_icons/sunset.png',
    'assets/images/common_weather_icons/pressure.png',
    'assets/images/common_weather_icons/humidity.png',
    'assets/images/common_weather_icons/day_temp.png',
    'assets/images/common_weather_icons/night_temp.png',
    'assets/images/common_weather_icons/max_temp.png',
    'assets/images/common_weather_icons/min_temp.png',
  ];

  final int index;

  MoreInfoWeatherWidget({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final dailyWeather = context.watch<DataProvider>().getForecast.daily![index];
    List<String> values = [
      ' ${DateFormat('h:mm a').format(DateTime.fromMillisecondsSinceEpoch(dailyWeather.sunrise! * 1000))}',
      ' ${DateFormat('h:mm a').format(DateTime.fromMillisecondsSinceEpoch(dailyWeather.sunset! * 1000))}',
      ' ${dailyWeather.pressure!} ${Constants.pressureMetric}',
      ' ${dailyWeather.humidity}%',
      ' ${dailyWeather.temp!.day!.toStringAsFixed(0)}${Constants.degreeMetric}',
      ' ${dailyWeather.temp!.night!.toStringAsFixed(0)}${Constants.degreeMetric}',
      ' ${dailyWeather.temp!.max!.toStringAsFixed(0)}${Constants.degreeMetric}',
      ' ${dailyWeather.temp!.min!.toStringAsFixed(0)}${Constants.degreeMetric}',
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...List<Widget>.generate(
              values.length,
              (index) => CurrentParameter(
                  width: width,
                  text: iconsText[index],
                  icon: icons[index],
                  value: values[index]))
        ],
      ),
    );
  }
}
