import 'package:flutter/material.dart';
import 'package:weather_test/models/weather_forecast.dart';
import 'package:weather_test/utils/constants.dart';
import 'package:weather_test/utils/main_gradients.dart';
import 'package:weather_test/utils/wind_direction.dart';

import '../../../global_widgets/gradient_text.dart';
import '../../../utils/main_text_styles.dart';

/// the main weather parameters displayed on the screen of the current weather
/// in the city
class MainWeatherParametersWidget extends StatelessWidget {
  final Main? mainWeather;
  final String? description;
  final Wind? wind;

  const MainWeatherParametersWidget(
      {Key? key,
      required this.mainWeather,
      required this.description,
      required this.wind})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String temp = '';
    String feelsLike = '';
    if (mainWeather != null) {
      temp = mainWeather!.temp == null
          ? ''
          : mainWeather!.temp!.round().toString();
      feelsLike = mainWeather!.feelsLike == null
          ? ''
          : mainWeather!.feelsLike!.round().toString();
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      height: 400.0,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GradientText('$temp${Constants.degreeSymbol}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 180,
                      fontWeight: FontWeight.w800,
                    ),
                    gradient: MainGradients.textGradient),
                Text(
                  description ?? '',
                  style: MainTextStyles.smallInscriptionsLight,
                ),
                RichText(
                  text: TextSpan(
                      text: 'Feels like ',
                      style: MainTextStyles.smallInscriptionsDark,
                      children: [
                        TextSpan(
                          text: '$feelsLike ${Constants.degreeSymbol}',
                          style: MainTextStyles.smallInscriptionsLight,
                        ),
                      ]),
                ),
                RichText(
                  text: TextSpan(
                      text: 'Wind: ',
                      style: MainTextStyles.smallInscriptionsDark,
                      children: [
                        TextSpan(
                          text: '${wind?.speed}',
                          style: MainTextStyles.smallInscriptionsLight,
                        ),
                      ]),
                ),
                RichText(
                  text: TextSpan(
                      text: 'Wind direction: ',
                      style: MainTextStyles.smallInscriptionsDark,
                      children: [
                        TextSpan(
                          text:
                              WindDirection().chooseWindDirection(wind?.deg),
                          style: MainTextStyles.smallInscriptionsLight,
                        ),
                      ]),
                ),
                RichText(
                  text: TextSpan(
                      text: 'Humidity: ',
                      style: MainTextStyles.smallInscriptionsDark,
                      children: [
                        TextSpan(
                          text: '${mainWeather?.humidity}',
                          style: MainTextStyles.smallInscriptionsLight,
                        ),
                      ]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
