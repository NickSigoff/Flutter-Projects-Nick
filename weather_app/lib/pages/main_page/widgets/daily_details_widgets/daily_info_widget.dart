import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/data/data_provider.dart';
import 'package:weather_app/pages/main_page/widgets/daily_details_widgets/information_row_widget.dart';
import 'package:weather_app/utils/constants.dart';
import 'package:weather_app/utils/main_styles.dart';
import 'package:weather_app/utils/wind_direction.dart';

import '../../../../utils/main_gradients.dart';

class DailyInfoWidget extends StatelessWidget {
  final int index;

  const DailyInfoWidget({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> icons = const [
      'assets/images/common_weather_icons/min_temp.png',
      'assets/images/common_weather_icons/max_temp.png',
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
    List<String> parameters = const [
      'Min temp',
      'Max temp',
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
    final dailyWeather =
        context.watch<DataProvider>().getForecast.daily![index];
    List<String> values = [
      '${dailyWeather.temp!.min}${Constants.degreeMetric}',
      '${dailyWeather.temp!.max}${Constants.degreeMetric}',
      '${dailyWeather.temp!.day}${Constants.degreeMetric}',
      '${dailyWeather.temp!.night}${Constants.degreeMetric}',
      '${dailyWeather.feelsLike!.day}${Constants.degreeMetric}',
      '${dailyWeather.windSpeed}${Constants.speedMetric}',
      (WindDirection.chooseWindDirection(dailyWeather.windDeg!)),
      '${dailyWeather.pressure}${Constants.pressureMetric}',
      '${dailyWeather.humidity}%',
      '${dailyWeather.uvi}',
      '${dailyWeather.clouds}%',
    ];

    return Container(
      decoration: MainGradients.backgroundMainPageGradient,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CachedNetworkImage(
              imageUrl: dailyWeather.getDailyIconUrl() + Constants.imagesExtension,
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              Text(
                '${dailyWeather.temp!.day!.toStringAsFixed(0)}${Constants.degreeMetric}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          Text(
              '${dailyWeather.weather![0].main}, ${dailyWeather.weather![0].description}',
              style: MainStyles.dailyDetails),
          const SizedBox(
            height: 16.0,
          ),
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
