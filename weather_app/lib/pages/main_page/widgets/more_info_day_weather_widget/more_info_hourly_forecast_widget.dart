import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_forecast.dart';
import 'package:weather_app/utils/constants.dart';
import 'package:weather_app/utils/main_colors.dart';
import 'package:weather_app/utils/main_styles.dart';

class MoreInfoHourlyWeatherWidget extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;
  final int index;

  const MoreInfoHourlyWeatherWidget({Key? key, required this.snapshot, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var hourlyWeather = snapshot.data!.hourly!;
    return SizedBox(
      height: 100,
      width: MediaQuery.of(context).size.width,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) =>
            MoreInfoHourWeatherWidget(
                dateTime: DateTime.fromMillisecondsSinceEpoch(
                    hourlyWeather[index].dt! * 1000 +
                        snapshot.data!.timezoneOffset! * 1000),
                temperature: hourlyWeather[index].temp!,
                icon: hourlyWeather[index].getHourlyIconUrl()),
        itemCount: hourlyWeather.length,
        separatorBuilder: (BuildContext context, int index) => const SizedBox(
          width: 16,
        ),
      ),
    );
  }
}

class MoreInfoHourWeatherWidget extends StatelessWidget {
  final String icon;
  final double temperature;
  final DateTime dateTime;

  const MoreInfoHourWeatherWidget(
      {Key? key,
      required this.dateTime,
      required this.temperature,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 50,
      decoration: BoxDecoration(
          color: MainColors.backgroundMainPageLight,
          borderRadius: BorderRadius.circular(30.0)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            '${dateTime.hour}:00',
            style: MainStyles.smallInscriptionsLight,
          ),
          Image.network(
            icon + Constants.imagesExtension,
            scale: 1.4,
          ),
          Text(
            '${temperature.toStringAsFixed(0)}${Constants.degreeMetric}',
            style: MainStyles.smallInscriptionsLight,
          ),
        ],
      ),
    );
  }
}
