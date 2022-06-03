import 'package:json_annotation/json_annotation.dart';

import '../utils/constants.dart';

part 'weather_forecast.g.dart';

@JsonSerializable()
class WeatherForecast {
  double? lat;
  double? lon;
  String? timezone;
  @JsonKey(name: 'timezone_offset')
  int? timezoneOffset;
  Current? current;
  List<Hourly>? hourly;
  List<Daily>? daily;

  WeatherForecast(
      {this.lat,
      this.lon,
      this.timezone,
      this.timezoneOffset,
      this.current,
      this.hourly,
      this.daily});

  factory WeatherForecast.fromJson(Map<String, dynamic> json) =>
      _$WeatherForecastFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherForecastToJson(this);
}

@JsonSerializable()
class Current {
  int? dt;
  int? sunrise;
  int? sunset;
  double? temp;
  @JsonKey(name: 'feels_like')
  double? feelsLike;
  int? pressure;
  int? humidity;
  double? dewPoint;
  double? uvi;
  int? clouds;
  int? visibility;
  @JsonKey(name: 'wind_speed')
  double? windSpeed;
  @JsonKey(name: 'wind_deg')
  int? windDeg;
  List<Weather>? weather;

  String getCurrentIconUrl() {
   return Constants.weatherImagesPath + weather![0].icon!;
  }

  Current(
      {this.dt,
      this.sunrise,
      this.sunset,
      this.temp,
      this.feelsLike,
      this.pressure,
      this.humidity,
      this.dewPoint,
      this.uvi,
      this.clouds,
      this.visibility,
      this.windSpeed,
      this.windDeg,
      this.weather});

  factory Current.fromJson(Map<String, dynamic> json) =>
      _$CurrentFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentToJson(this);
}

@JsonSerializable()
class Weather {
  int? id;
  String? main;
  String? description;
  String? icon;

  Weather({this.id, this.main, this.description, this.icon});

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}

@JsonSerializable()
class Hourly {
  int? dt;
  double? temp;
  double? feelsLike;
  int? pressure;
  int? humidity;
  double? dewPoint;
  double? uvi;
  int? clouds;
  int? visibility;
  double? windSpeed;
  int? windDeg;
  double? windGust;
  List<Weather>? weather;
  double? pop;
  Rain? rain;

  Hourly(
      {this.dt,
      this.temp,
      this.feelsLike,
      this.pressure,
      this.humidity,
      this.dewPoint,
      this.uvi,
      this.clouds,
      this.visibility,
      this.windSpeed,
      this.windDeg,
      this.windGust,
      this.weather,
      this.pop,
      this.rain});

  factory Hourly.fromJson(Map<String, dynamic> json) => _$HourlyFromJson(json);

  Map<String, dynamic> toJson() => _$HourlyToJson(this);

  String getHourlyIconUrl() {
   return Constants.weatherImagesPath + weather![0].icon!;
  }
}

@JsonSerializable()
class Rain {
  double? d1h;

  Rain({this.d1h});

  factory Rain.fromJson(Map<String, dynamic> json) => _$RainFromJson(json);

  Map<String, dynamic> toJson() => _$RainToJson(this);
}

@JsonSerializable()
class Daily {
  int? dt;
  int? sunrise;
  int? sunset;
  int? moonrise;
  int? moonset;
  double? moonPhase;
  Temp? temp;
  @JsonKey(name: 'feels_like')
  FeelsLike? feelsLike;
  int? pressure;
  int? humidity;
  double? dewPoint;
  @JsonKey(name: 'wind_speed')
  double? windSpeed;
  @JsonKey(name: 'wind_deg')
  int? windDeg;
  double? windGust;
  List<Weather>? weather;
  int? clouds;
  double? pop;
  double? uvi;
  double? rain;

  Daily(
      {this.dt,
      this.sunrise,
      this.sunset,
      this.moonrise,
      this.moonset,
      this.moonPhase,
      this.temp,
      this.feelsLike,
      this.pressure,
      this.humidity,
      this.dewPoint,
      this.windSpeed,
      this.windDeg,
      this.windGust,
      this.weather,
      this.clouds,
      this.pop,
      this.uvi,
      this.rain});

  factory Daily.fromJson(Map<String, dynamic> json) => _$DailyFromJson(json);

  Map<String, dynamic> toJson() => _$DailyToJson(this);

  String getDailyIconUrl() {
   return Constants.weatherImagesPath + weather![0].icon!;
  }
}

@JsonSerializable()
class Temp {
  double? day;
  double? min;
  double? max;
  double? night;
  double? eve;
  double? morn;

  Temp({this.day, this.min, this.max, this.night, this.eve, this.morn});

  factory Temp.fromJson(Map<String, dynamic> json) => _$TempFromJson(json);

  Map<String, dynamic> toJson() => _$TempToJson(this);
}

@JsonSerializable()
class FeelsLike {
  double? day;
  double? night;
  double? eve;
  double? morn;

  FeelsLike({this.day, this.night, this.eve, this.morn});

  factory FeelsLike.fromJson(Map<String, dynamic> json) =>
      _$FeelsLikeFromJson(json);

  Map<String, dynamic> toJson() => _$FeelsLikeToJson(this);
}
