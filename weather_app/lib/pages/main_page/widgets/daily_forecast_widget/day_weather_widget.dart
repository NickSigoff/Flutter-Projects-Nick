import 'package:flutter/material.dart';

import 'package:weather_app/pages/main_page/widgets/less_info_day_weather_widget.dart';
import 'package:weather_app/pages/main_page/widgets/more_info_day_weather_widget/more_info_day_weather_widget.dart';

class DayWeather extends StatelessWidget {
  final int index;
  final void Function(int index) setOpenedDay;
  final bool showMore;

  const DayWeather(
      {required this.index,
      required this.setOpenedDay,
      this.showMore = false,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return showMore
        ? MoreInfoDayWeatherWidget(
            onTap: setOpenedDay,
            index: index,
          )
        : LessInfoDayWeatherWidget(
            onTap: setOpenedDay,
            index: index,
          );
  }
}
