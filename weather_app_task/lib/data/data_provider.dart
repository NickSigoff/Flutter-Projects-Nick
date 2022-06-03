import 'package:flutter/material.dart';

import '../api/weather_api.dart';
import '../models/weather_forecast.dart';

class DataProvider with ChangeNotifier {
  WeatherForecast _forecast = WeatherForecast();

  set forecast(WeatherForecast value) {
    _forecast = value;
    notifyListeners();
  }

  WeatherForecast get getForecast => _forecast;

  void fetchData([VoidCallback? function]) async {
    _forecast = await WeatherApi().fetchWeatherForecastWithCoordinates();
    if (function != null) {
      function();
    }
    notifyListeners();
  }

  void fetchDataAndPushRoute(BuildContext context, var route) async {
    _forecast = await WeatherApi().fetchWeatherForecastWithCoordinates();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => route),
    );
  }
}
