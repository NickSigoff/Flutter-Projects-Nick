import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

//https://api.openweathermap.org/data/2.5/forecast?q=London&appid=8f497a8cda33335076d8575eb89a68a8

import '../models/weather_forecast.dart';
import '../utils/constants.dart';

class WeatherApi {
  Future<WeatherForecast> fetchWeatherForecastWithCity(String city) async {
    var parameters = {
      'q': city,
      'appid': Constants.weatherAppId,
      'units': 'metric',
    };
    var uri = Uri.https(
        Constants.weatherDomainName, Constants.weatherForecastPath, parameters);
    try {
      var response = await http.get(uri);
      if (response.statusCode == 200) {
        return WeatherForecast.fromJson(json.decode(response.body));
      } else {
        throw const FormatException('');
      }
    } on FormatException catch (_) {
      throw const FormatException('');
    } catch (e) {
      throw const HttpException('');
    }
  }
}
