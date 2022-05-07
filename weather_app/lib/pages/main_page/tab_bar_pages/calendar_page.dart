import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_forecast.dart';
import 'package:weather_app/utils/main_gradients.dart';

class CalendarPage extends StatelessWidget {

  const CalendarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: MainGradients.backgroundMainPageGradient,
      child: const Center(
        child: Text('Calendar', style: TextStyle(color: Colors.white),),
      ),
    );
  }
}
