import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_forecast.dart';
import 'package:weather_app/utils/main_styles.dart';

import '../../../utils/main_colors.dart';

class HourlyForecast extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast>snapshot;

  const HourlyForecast({Key? key, required this.snapshot}) : super(key: key);


  List<int> makeListHours() {
    List<int> result = [];
    var date = DateTime.now();
    var currentHour = date.hour;

    while (currentHour < 23) {
      result.add(++currentHour);
    }
    for(int i = 0; i < date.hour; i++) {
      result.add(i);
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    List<int> hours = makeListHours();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Text(
              'Hourly Forecast',
              style: MainStyles.bottomTextTextStyle,
            ),
          ),
          SizedBox(
            height: 100,
            width: MediaQuery.of(context).size.width,
            child: ListView.separated(
                //padding: EdgeInsets.symmetric(horizontal: 16),
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) =>
                    HourWeatherWidget(hour: hours[index]),
                itemCount: hours.length,
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(
                      width: 14,
                    )),
          ),
        ],
      ),
    );
  }
}

class HourWeatherWidget extends StatelessWidget {
  final int hour;

  const HourWeatherWidget({Key? key, required this.hour}) : super(key: key);

  //HourWeatherWidget({required this.hour});
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
            '$hour:00',
            style: MainStyles.smallInscriptionsLight,
          ),
          const Icon(
            Icons.sunny,
            color: Colors.orange,
          ),
          Text(
            '26\u2103',
            style: MainStyles.smallInscriptionsLight,
          ),
        ],
      ),
    );
  }
}
