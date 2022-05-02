import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_forecast.dart';
import '../../../utils/main_styles.dart';
import '../../../utils/wind_direction.dart';

class GeneralParameters extends StatelessWidget {
  final String speedMetric = 'KM/H';

  final List<String> iconsText = [
    'Sunrise',
    'Sunset:',
    'Wind direction:',
    'Wind speed',
    'Pressure:',
    'Humidity:',
  ];
  final List<String> icons = [
    'assets/images/common_weather_icons/sun.png',
    'assets/images/common_weather_icons/sunset.png',
    'assets/images/common_weather_icons/wind_direction.png',
    'assets/images/common_weather_icons/wind.png',
    'assets/images/common_weather_icons/pressure.png',
    'assets/images/common_weather_icons/humidity.png',
  ];

  final AsyncSnapshot<WeatherForecast> snapshot;

  GeneralParameters({Key? key, required this.snapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> values = [
      ' ${DateTime.fromMillisecondsSinceEpoch(snapshot.data!.current!.sunrise! * 1000).hour}:${DateTime.fromMillisecondsSinceEpoch(snapshot.data!.current!.sunrise! * 1000).minute}',
      ' ${DateTime.fromMillisecondsSinceEpoch(snapshot.data!.current!.sunset! * 1000).hour}:${DateTime.fromMillisecondsSinceEpoch(snapshot.data!.current!.sunset! * 1000).minute}',
      ' ${WindDirection.chooseWindDirection(snapshot.data!.current!.windDeg!)}',
      ' ${snapshot.data!.current!.windSpeed} $speedMetric',
      ' ${snapshot.data!.current!.pressure!}',
      ' ${snapshot.data!.current!.humidity}%',
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
      child: Wrap(
        alignment: WrapAlignment.center,
        children: [
          ...List<Widget>.generate(
              values.length,
              (index) => Item(
                  text: iconsText[index],
                  icon: icons[index],
                  value: values[index]))
        ],
      ),
    );
  }
}

class Item extends StatelessWidget {
  final String text;
  final String icon;
  final String value;

  const Item(
      {Key? key, required this.text, required this.icon, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = (MediaQuery.of(context).size.width - 32) / 2;

    return SizedBox(
      height: 40,
      width: width,
      child: Row(
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(icon),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: RichText(
              text: TextSpan(
                  text: text,
                  style: MainStyles.smallInscriptionsDark,
                  children: [
                    TextSpan(
                      text: value,
                      style: MainStyles.smallInscriptionsLight,
                    )
                  ]),
            ),
          )
        ],
      ),
    );
  }
}
