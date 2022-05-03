import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/models/weather_forecast.dart';
import 'package:weather_app/pages/main_page/widgets/less_info_day_weather_widget.dart';
import 'package:weather_app/pages/main_page/widgets/more_info_day_weather_widget/more_info_day_weather_widget.dart';
import 'package:weather_app/utils/constants.dart';
import 'package:weather_app/utils/main_styles.dart';

class DayWeather extends StatefulWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;
  final int index;

  const DayWeather({required this.index, required this.snapshot, Key? key})
      : super(key: key);

  @override
  State<DayWeather> createState() => _DayWeatherState();
}

class _DayWeatherState extends State<DayWeather> {
  bool showMore = false;

  String getDate(int index) {
    var date = DateTime.fromMillisecondsSinceEpoch(
        widget.snapshot.data!.daily![index].dt! * 1000 +
            widget.snapshot.data!.timezoneOffset! * 1000);
    return DateFormat('EEEE, d MMM, yyyy').format(date);
  }

  void onTapArrow() {
    setState(() {
      showMore = !showMore;
    });
  }

  @override
  Widget build(BuildContext context) {
    String date = getDate(widget.index);
    var dailyWeather = widget.snapshot.data!.daily![widget.index];

    Image weatherImage = Image.network(
        dailyWeather.getDailyIconUrl() + Constants.imagesExtension);

    Text minTemp = Text(
        '${dailyWeather.temp!.min!.toStringAsFixed(0)}${Constants.degreeMetric}',
        style: MainStyles.smallInscriptionsLight);

    Text maxTemp = Text(
        '${dailyWeather.temp!.max!.toStringAsFixed(0)}${Constants.degreeMetric}',
        style: MainStyles.smallInscriptionsLight);

    return showMore
        ? MoreInfoDayWeatherWidget(
            snapshot: widget.snapshot,
            onTap: onTapArrow,
            date: date,
            index: widget.index,
            weatherImage: weatherImage,
            minTemp: minTemp,
            maxTemp: maxTemp)
        : LessInfoDayWeatherWidget(
            maxTemp: maxTemp,
            onTap: onTapArrow,
            minTemp: minTemp,
            weatherImage: weatherImage,
            index: widget.index,
            date: date);
  }
}
