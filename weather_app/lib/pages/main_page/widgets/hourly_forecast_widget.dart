import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/models/weather_forecast.dart';
import 'package:weather_app/utils/main_styles.dart';

import '../../../utils/constants.dart';
import '../../../utils/main_colors.dart';

class HourlyForecast extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;

  const HourlyForecast({Key? key, required this.snapshot}) : super(key: key);

  List<int> makeListHours() {
    List<int> result = [];
    var date = DateTime.now();
    var currentHour = date.hour;

    while (currentHour < 23) {
      result.add(++currentHour);
    }
    for (int i = 0; i < date.hour; i++) {
      result.add(i);
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    var date = DateTime.fromMillisecondsSinceEpoch(
        snapshot.data!.hourly![0].dt! * 1000 +
            snapshot.data!.timezoneOffset! * 1000);
    print(date);
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
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) =>
                    HourWeatherWidget(
                        dateTime: DateTime.fromMillisecondsSinceEpoch(
                            snapshot.data!.hourly![index].dt! * 1000),
                        temperature: snapshot.data!.hourly![index].temp!,
                        icon: snapshot.data!.hourly![index].getHourlyIconUrl()),
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
  final String icon;
  final double temperature;
  final DateTime dateTime;

  const HourWeatherWidget(
      {Key? key,
      required this.dateTime,
      required this.temperature,
      required this.icon})
      : super(key: key);

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
            '${dateTime.hour}:00',
            style: MainStyles.smallInscriptionsLight,
          ),
          Image.network(icon + Constants.imagesExtension, scale: 1.4,),
          Text(
            '${temperature.toStringAsFixed(0)}\u2103',
            style: MainStyles.smallInscriptionsLight,
          ),
        ],
      ),
    );
  }
}
