import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/pages/main_page/widgets/current_parameter_widget.dart';
import '../../../data/data_provider.dart';
import '../../../utils/constants.dart';
import '../../../utils/wind_direction.dart';

class GeneralCurrentParameters extends StatelessWidget {
  final List<String> _iconsText = const [
    'Sunrise:',
    'Sunset:',
    'Wind direction:',
    'Wind speed:',
    'Pressure:',
    'Humidity:',
  ];
  final List<String> _icons = const [
    'assets/images/common_weather_icons/sun.png',
    'assets/images/common_weather_icons/sunset.png',
    'assets/images/common_weather_icons/wind_direction.png',
    'assets/images/common_weather_icons/wind.png',
    'assets/images/common_weather_icons/pressure.png',
    'assets/images/common_weather_icons/humidity.png',
  ];

  const GeneralCurrentParameters({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentWeather = context.watch<DataProvider>().getForecast.current!;
    double width = (MediaQuery.of(context).size.width - 32) / 2;
    List<String> values = [
      ' ${DateFormat('h:mm a').format(DateTime.fromMillisecondsSinceEpoch(currentWeather.sunrise! * 1000))}',
      ' ${DateFormat('h:mm a').format(DateTime.fromMillisecondsSinceEpoch(currentWeather.sunset! * 1000))}',
      ' ${WindDirection.chooseWindDirection(currentWeather.windDeg!)}',
      ' ${currentWeather.windSpeed} ${Constants.speedMetric}',
      ' ${currentWeather.pressure} ${Constants.pressureMetric}',
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
                  width: width,
                  text: _iconsText[index],
                  icon: _icons[index],
                  value: values[index]))
        ],
      ),
    );
  }
}
