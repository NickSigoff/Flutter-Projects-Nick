import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:weather_app/pages/main_page/widgets/daily_details_widgets/daily_list_view_day_widget.dart';

import '../../../../models/weather_forecast.dart';

class DailyListView extends StatelessWidget {
  final Function onTap;
  final int selectedPage;

  const DailyListView({
    Key? key,
    required this.onTap,
    required this.selectedPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final forecast = context.watch<WeatherForecast>().daily!;
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: forecast.length,
        itemBuilder: (context, index) => DailyListViewDayWidget(
          onTap: onTap,
          pageIndex: index,
          selectedPage: selectedPage,
        ),
      ),
    );
  }
}
