import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/utils/main_styles.dart';

import '../../../data/data_provider.dart';
import '../../../global_widgets/gradient_text.dart';
import '../../../utils/constants.dart';

class GeneralTempWidget extends StatelessWidget {
  const GeneralTempWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentWeather = context.watch<DataProvider>().getForecast.current!;
    final String temperature =
        '${currentWeather.temp!.toStringAsFixed(0)}${Constants.degreeMetric}';
    final String description = '${currentWeather.weather![0].main} ';
    final String feelsLike =
        '${currentWeather.feelsLike!.toStringAsFixed(0)}${Constants.degreeMetric}';

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 150,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Expanded(
            child: Image.network(
              currentWeather.getCurrentIconUrl() + Constants.imagesExtension,
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
