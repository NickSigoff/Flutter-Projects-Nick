import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:weather_app/utils/constants.dart';
import 'package:weather_app/utils/location.dart';

import '../models/weather_forecast.dart';
//https://api.openweathermap.org/data/2.5/onecall?lat=33.44&lon=-94.04&exclude=alerts,minutely&appid=8f497a8cda33335076d8575eb89a68a8

//https://api.openweathermap.org/data/2.5/weather?q=London&appid=8f497a8cda33335076d8575eb89a68a8
class WeatherApi {
  Future<WeatherForecast> getWeatherForecastWithCoordinates() async {
    //todo getting current location here?
    Location location = Location();
    //LocationPermission permission = await Geolocator.requestPermission();

    await location.getCurrentLocation();

    var parameters = {
      'lat': location.lat.toString(),
      'lon': location.lon.toString(),
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
      throw Exception('Something is wrong. Status code ${response.statusCode}');
    }
  }
}
