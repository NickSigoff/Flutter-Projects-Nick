import 'package:flutter/material.dart';
import 'package:weather_app/utils/main_colors.dart';
import 'package:weather_app/utils/main_styles.dart';

import '../../../utils/constants.dart';

class HourWeatherWidget extends StatelessWidget {
  final String icon;
  final double temperature;
  final DateTime dateTime;

  const HourWeatherWidget(
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
          color: MainColors.backgroundMainPageDark,
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
