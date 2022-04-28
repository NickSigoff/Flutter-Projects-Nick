import 'package:flutter/material.dart';
import 'package:weather_app/utils/main_styles.dart';

import '../../../global_widgets/GradientText.dart';

class GeneralWeatherWidget extends StatelessWidget {
  final String image = 'assets/images/weather_images/partly_cloudy.png';
  final String temperature = '33\u2103\n';
  final String weatherName = 'Party cloudy';
  final String feelsLike = '29\u2103/27\u2103 | Feels like ';
  final String feelsLikeTemperature = '39\u2103';
  final String wind = 'Wind WSW ';
  final String windSpeed = '9 KM/H';

  const GeneralWeatherWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 150,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 130,
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(image),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                const Spacer(
                  flex: 1,
                ),
                Expanded(
                  flex: 4,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      GradientText(
                        temperature,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 70,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Poppins',
                        ),
                        gradient: const LinearGradient(
                          colors: [Color(0xffcccdd5), Color(0xff545760)],
                        ),
                      ),
                      Positioned(
                        bottom: 16,
                        child: Text(
                          weatherName,
                          style: MainStyles.smallInscriptionsLight,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RichText(
                text: TextSpan(
                    text: feelsLike,
                    style: MainStyles.smallInscriptionsDark,
                    children: [
                      TextSpan(
                        text: feelsLikeTemperature,
                        style: MainStyles.smallInscriptionsLight,
                      )
                    ]),
              ),
              RichText(
                text: TextSpan(
                    text: wind,
                    style: MainStyles.smallInscriptionsDark,
                    children: [
                      TextSpan(
                        text: windSpeed,
                        style: MainStyles.smallInscriptionsLight,
                      )
                    ]),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
