import 'package:flutter/material.dart';

import '../widgets/current_date_widget.dart';
import '../widgets/daily_forecast_widget/daily_forecast_widget.dart';
import '../widgets/general_current_parameters_widget.dart';
import '../widgets/general_temp_widget.dart';
import '../widgets/hourly_forecast_widget/hourly_forecast_widget.dart';

class TodayPage extends StatelessWidget {
  const TodayPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children:  const [
        CurrentDateWidget(),
        GeneralTempWidget(),
        GeneralCurrentParameters(),
        HourlyForecast(),
        DailyForecast(),
      ],
    );
  }
}
