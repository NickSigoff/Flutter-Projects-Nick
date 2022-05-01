import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_forecast.dart';
import 'package:weather_app/utils/main_styles.dart';

import '../../../global_widgets/GradientText.dart';

class GeneralWeatherWidget extends StatelessWidget {
  final String metric = '\u2103';
  final String degreeSymbol = '\u00B0';
  final String speedMetric = 'KM/H';

  final String image = 'assets/images/weather_images/partly_cloudy.png';

  final AsyncSnapshot<WeatherForecast> snapshot;

  const GeneralWeatherWidget({Key? key, required this.snapshot})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String temperature =
        '${snapshot.data!.current!.temp!.toStringAsPrecision(2)}$metric';
    final String description = '${snapshot.data!.current!.weather![0].main}';
    final String feelsLike =
        '${snapshot.data!.current!.feelsLike!.toStringAsPrecision(2)}$metric';
    final String windDirection =
        'Wind ${chooseWindDirection(snapshot.data!.current!.windDeg!)} ';
    final String windSpeed =
        '${snapshot.data!.current!.windSpeed} $speedMetric';

    // todo how to do checking null value for the whole object?
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
                        bottom: 4,
                        child: Text(
                          description,
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
                    text: 'Feels like ',
                    style: MainStyles.smallInscriptionsDark,
                    children: [
                      TextSpan(
                        text: feelsLike,
                        style: MainStyles.smallInscriptionsLight,
                      )
                    ]),
              ),
              RichText(
                text: TextSpan(
                    text: windDirection,
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

String chooseWindDirection(int directionDegree) {
  switch (directionDegree) {
    case 350:
    case 360:
    case 10:
      {
        return 'N';
      }
    case 20:
    case 30:
      {
        return 'N/NE';
      }
    case 40:
    case 50:
      {
        return 'NE';
      }
    case 60:
    case 70:
      {
        return 'E/NE';
      }
    case 80:
    case 90:
    case 100:
      {
        return 'E';
      }
    case 110:
    case 120:
      {
        return 'E/SE';
      }
    case 130:
    case 140:
      {
        return 'SE';
      }
    case 150:
    case 160:
      {
        return 'S/SE';
      }
    case 170:
    case 180:
    case 190:
      {
        return 'S';
      }
    case 200:
    case 210:
      {
        return 'S/SW';
      }
    case 220:
    case 230:
      {
        return 'SW';
      }
    case 240:
    case 250:
      {
        return 'W/SW';
      }
    case 260:
    case 270:
    case 280:
      {
        return 'W';
      }
    case 290:
    case 300:
      {
        return 'W/NW';
      }
    case 310:
    case 320:
      {
        return 'NW';
      }
    case 330:
    case 340:
      {
        return 'N/NW';
      }
    default:
      {
        return '';
      }
  }
}
