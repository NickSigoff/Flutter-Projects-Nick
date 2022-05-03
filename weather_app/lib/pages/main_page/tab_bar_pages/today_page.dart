import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_forecast.dart';

import '../widgets/current_date_widget.dart';
import '../widgets/daily_forecast_widget/daily_forecast_widget.dart';
import '../widgets/general_current_parameters_widget.dart';
import '../widgets/general_temp_widget.dart';
import '../widgets/hourly_forecast_widget/hourly_forecast_widget.dart';

class TodayPage extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;

  const TodayPage({Key? key, required this.snapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CurrentDateWidget(snapshot: snapshot),
        GeneralTempWidget(snapshot: snapshot),
        GeneralCurrentParameters(snapshot: snapshot),
        HourlyForecast(snapshot: snapshot),
        DailyForecast(snapshot: snapshot),
      ],
    );
  }
}
