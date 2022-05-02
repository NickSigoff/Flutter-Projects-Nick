import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:weather_app/utils/constants.dart';

import '../models/weather_forecast.dart';
//https://api.openweathermap.org/data/2.5/onecall?lat=33.44&lon=-94.04&exclude=alerts,minutely&appid=8f497a8cda33335076d8575eb89a68a8

//https://api.openweathermap.org/data/2.5/weather?q=London&appid=8f497a8cda33335076d8575eb89a68a8
class WeatherApi {
  Future<WeatherForecast> getWeatherForecastWithCoordinates(
      {required double lat, required double lon}) async {
    var parameters = {
      'lat': '$lat',
      'lon': '$lon',
      'exclude': Constants.weatherExclude,
      'appid': Constants.weatherAppId,
      'units': 'metric',
    };

    var uri = Uri.https(
        Constants.weatherDomainName, Constants.weatherForecastPath, parameters);
    var response = await http.get(uri);

    if (response.statusCode == 200) {
      return WeatherForecast.fromJson(json.decode(response.body));
    } else {
      throw Exception('Something is wrong');
    }
  }
}
