import 'package:flutter/material.dart';

class GeneralWeatherWidget extends StatelessWidget {
  final String image = 'assets/images/weather_images/partly_cloudy.png';
  final String temperature = '33\u2103\n';
  final String weatherName = 'Party cloudy';
  final String feelsLike = '29\u2103/27\u2103 | Feels like 39\u2103';
  final String wind = 'Wind 9 KM/H WSW';

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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(image),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text: temperature,
                        style: const TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Poppins',
                        ),
                        children: [
                          TextSpan(
                            text: weatherName,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ]),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                feelsLike,
                style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'Poppins',
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              ),
              Text(
                wind,
                style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'Poppins',
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
