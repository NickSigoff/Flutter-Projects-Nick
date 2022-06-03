import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;


import '../models/weather_forecast.dart';
import '../utils/constants.dart';
import '../utils/location.dart';
//https://api.openweathermap.org/data/2.5/onecall?lat=33.44&lon=-94.04&exclude=alerts,minutely&appid=8f497a8cda33335076d8575eb89a68a8

class WeatherApi {
  Future<WeatherForecast> fetchWeatherForecastWithCoordinates(
      {double? lat, double? lon}) async {
    Location location = Location();
    LocationPermission permission = await Geolocator.requestPermission();
    print(permission.name);

    if (lat == null || lon == null) {
      await location.getCurrentLocation();
    }

    var parameters = {
      'lat': lat ?? location.lat.toString(),
      'lon': lon ?? location.lon.toString(),
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
