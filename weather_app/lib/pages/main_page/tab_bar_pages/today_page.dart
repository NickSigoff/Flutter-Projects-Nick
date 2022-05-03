import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_forecast.dart';
import 'package:weather_app/pages/main_page/widgets/main_hourly_forecast/main_hourly_forecast_widget.dart';

import '../widgets/current_date_widget.dart';
import '../widgets/daily_forecast_widget/daily_forecast_widget.dart';
import '../widgets/current_parameters_widget/general_current_parameters_widget.dart';
import '../widgets/general_temp_widget.dart';

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
        MainHourlyForecast(snapshot: snapshot),
        DailyForecast(snapshot: snapshot),
      ],
    );
  }
}
