import 'package:flutter/material.dart';
import 'package:weather_test/models/weather_forecast.dart';

import '../../utils/constants.dart';

class HomePage extends StatelessWidget {
  final WeatherForecast weatherForecast;

  const HomePage({Key? key, required this.weatherForecast}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            _buildCityNameWidget(),
            _buildMainWeatherWidget(),
          ],
        ),
      ),
    );
  }

  Widget _buildCityNameWidget() {
    if (weatherForecast.city != null) {
      return Text(
        '${weatherForecast.city!.name ?? ''}, ${weatherForecast.city!.country ?? ''}',
        style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
      );
    } else {
      return const Text('');
    }
  }

  Widget _buildMainWeatherWidget() {
    if (weatherForecast.list != null && weatherForecast.list![0].main != null) {
      return Column(
        children: [
          Text(
            '${weatherForecast.list![0].main!.temp == null ? '' : weatherForecast.list![0].main!.temp!.round()} ${Constants.degreeSymbol}',
            style: const TextStyle(
              fontSize: 180,
              fontWeight: FontWeight.w400,
            ),
          ),

        ],
      );
    } else {
      return const Text('');
    }
  }
}
