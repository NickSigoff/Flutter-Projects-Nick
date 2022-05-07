import 'package:flutter/material.dart';
import 'package:weather_app/api/weather_api.dart';
import 'package:weather_app/models/weather_forecast.dart';

class WeatherForecastDataProvider {
  ValueNotifier<WeatherForecast?> weatherForecast = ValueNotifier(null);

  Future<WeatherForecast> getWeatherApi() async {
    return await WeatherApi().fetchWeatherForecastWithCoordinates();
  }
}
