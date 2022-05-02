import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_forecast.dart';
import 'package:weather_app/utils/main_gradients.dart';

class ForecastPage extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;

  const ForecastPage({Key? key, required this.snapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: MainGradients.backgroundMainPageGradient,
      child: const Center(
        child: Text('Forecast Page', style: TextStyle(color: Colors.white),),
      ),
    );
  }
}
