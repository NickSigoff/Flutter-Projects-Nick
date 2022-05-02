import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../models/weather_forecast.dart';
import '../../../utils/main_colors.dart';

class CurrentDateWidget extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;

  CurrentDateWidget({Key? key, required this.snapshot})
      : super(key: key); // 8:18pm

  getCurrentDate() {
    var date = DateTime.fromMillisecondsSinceEpoch(
        snapshot.data!.hourly![0].dt! * 1000);
    return DateFormat('EEEE, d MMM, yyyy').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Container(
        alignment: Alignment.center,
        width: 150,
        height: 30,
        decoration: BoxDecoration(
          color: MainColors.currentDateWidgetColor,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Text(
          getCurrentDate(),
          style: const TextStyle(
            color: MainColors.dateTextColor,
            fontSize: 12,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
