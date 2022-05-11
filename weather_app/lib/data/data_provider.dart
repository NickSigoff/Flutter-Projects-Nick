import 'package:flutter/cupertino.dart';

import '../api/weather_api.dart';
import '../models/weather_forecast.dart';

class DataProvider with ChangeNotifier {
   WeatherForecast forecast = WeatherForecast();

  void setForecast(WeatherForecast value) {
    forecast = value;
  }

  WeatherForecast get getForecast => forecast;

  void fetchData() async {
    forecast = await WeatherApi().fetchWeatherForecastWithCoordinates();

  }
  void notify(){
    notifyListeners();
  }
}