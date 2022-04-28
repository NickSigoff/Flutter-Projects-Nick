import 'package:flutter/material.dart';
import '../../../utils/main_styles.dart';

class GeneralParameters extends StatelessWidget {
  final List<String> iconsText = [
    'Precipitation:',
    'Wind:',
    'Humidity:',
    'Sunset:'
  ];
  final List<String> icons = [
    'assets/images/common_weather_icons/precepiation.png',
    'assets/images/common_weather_icons/wind.png',
    'assets/images/common_weather_icons/humidity.png',
    'assets/images/common_weather_icons/sunset.png',
  ];

  final List<String> values = [
    ' 21%',
    ' 10 km/h',
    ' 59%',
    ' 29%',
  ];

  GeneralParameters({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
      child: Wrap(
        alignment: WrapAlignment.center,
        children: [
          ...List<Widget>.generate(
              4,
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
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage(icon),
              fit: BoxFit.fill,
            )),
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
