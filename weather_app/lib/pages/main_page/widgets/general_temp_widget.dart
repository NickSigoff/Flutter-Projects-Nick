import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_forecast.dart';
import 'package:weather_app/utils/main_styles.dart';

import '../../../global_widgets/gradient_text.dart';
import '../../../utils/constants.dart';

class GeneralTempWidget extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;

  const GeneralTempWidget({Key? key, required this.snapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var currentWeather = snapshot.data!.current!;
    final String temperature =
        '${currentWeather.temp!.toStringAsFixed(0)}${Constants.degreeMetric}';
    final String description = '${currentWeather.weather![0].main} ';
    final String feelsLike =
        '${currentWeather.feelsLike!.toStringAsFixed(0)}${Constants.degreeMetric}';

    // todo how to do checking null value for the whole object?
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 150,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Expanded(
            child: Image.network(
              snapshot.data!.getCurrentIconUrl() + Constants.imagesExtension,
              scale: 0.5,
            ),
          ),
          Expanded(
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                GradientText(
                  temperature,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 72,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'Poppins',
                  ),
                  gradient: const LinearGradient(
                    colors: [Color(0xffcccdd5), Color(0xff545760)],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: RichText(
                    text: TextSpan(
                        text: description,
                        style: MainStyles.smallInscriptionsLight,
                        children: [
                          TextSpan(
                            text: 'Feels like ',
                            style: MainStyles.smallInscriptionsDark,
                          ),
                          TextSpan(
                            text: feelsLike,
                            style: MainStyles.smallInscriptionsLight,
                          ),
                        ]),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
