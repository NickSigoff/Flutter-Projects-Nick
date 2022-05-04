import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_forecast.dart';
import 'package:weather_app/pages/main_page/widgets/less_info_day_weather_widget.dart';
import 'package:weather_app/pages/main_page/widgets/more_info_day_weather_widget/more_info_day_weather_widget.dart';

class DayWeather extends StatefulWidget {
  final Daily dailyWeather;
  final int index;

  const DayWeather({required this.dailyWeather, required this.index, Key? key})
      : super(key: key);

  @override
  State<DayWeather> createState() => _DayWeatherState();
}

class _DayWeatherState extends State<DayWeather> {
  bool showMore = false;

  void onTapArrow() {
    setState(() {
      showMore = !showMore;
    });
  }

  @override
  Widget build(BuildContext context) {
    return showMore
        ? MoreInfoDayWeatherWidget(
            dailyWeather: widget.dailyWeather,
            onTap: onTapArrow,
            index: widget.index,
          )
        : LessInfoDayWeatherWidget(
            dailyWeather: widget.dailyWeather,
            onTap: onTapArrow,
            index: widget.index,
          );
  }
}
