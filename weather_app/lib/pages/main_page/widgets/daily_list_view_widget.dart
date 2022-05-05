import 'package:flutter/material.dart';

import 'package:weather_app/pages/main_page/widgets/daily_list_view_day_widget.dart';

import '../../../models/weather_forecast.dart';

class DailyListView extends StatelessWidget {
  final WeatherForecast weatherData;
  final Function onTap;
  final int selectedPage;

  const DailyListView({
    Key? key,
    required this.weatherData,
    required this.onTap,
    required this.selectedPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: weatherData.daily!.length,
        itemBuilder: (context, index) => DailyListViewDayWidget(
          dailyTime: weatherData.daily![index].dt!,
          onTap: onTap,
          pageIndex: index,
          selectedPage: selectedPage,
        ),
      ),
    );
  }
}
