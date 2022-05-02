import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_forecast.dart';

import '../../../utils/main_gradients.dart';

class TomorrowPage extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;

  const TomorrowPage({Key? key, required this.snapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: MainGradients.backgroundMainPageGradient,
      child: const Center(
        child: Text('Tomorrow Page', style: TextStyle(color: Colors.white),),
      ),
    );
  }
}
