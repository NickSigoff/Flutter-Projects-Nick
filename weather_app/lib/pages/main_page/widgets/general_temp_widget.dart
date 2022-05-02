import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_forecast.dart';
import 'package:weather_app/utils/main_styles.dart';

import '../../../global_widgets/GradientText.dart';
import '../../../utils/constants.dart';

class GeneralTempWidget extends StatelessWidget {
  final String metric = '\u2103';
  final String degreeSymbol = '\u00B0';

  final AsyncSnapshot<WeatherForecast> snapshot;

  const GeneralTempWidget({Key? key, required this.snapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String temperature =
        '${snapshot.data!.current!.temp!.toStringAsFixed(0)}$metric';
    final String description = '${snapshot.data!.current!.weather![0].main} ';
    final String feelsLike =
        '${snapshot.data!.current!.feelsLike!.toStringAsFixed(0)}$metric';

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
              color: Colors.blue,
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
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
