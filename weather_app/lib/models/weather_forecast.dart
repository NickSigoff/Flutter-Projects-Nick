import 'package:json_annotation/json_annotation.dart';

part 'weather_forecast.g.dart';

@JsonSerializable()
class WeatherForecast {
  double? lat;
  double? lon;
  String? timezone;
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
  FeelsLike? feelsLike;
  int? pressure;
  int? humidity;
  double? dewPoint;
  double? windSpeed;
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

//@JsonSerializable()
// class WeatherForecast {
//   Coord? coord;
//   List<Weather>? weather;
//   String? base;
//   Main? main;
//   int? visibility;
//   Wind? wind;
//   Clouds? clouds;
//   int? dt;
//   Sys? sys;
//   int? timezone;
//   int? id;
//   String? name;
//   int? cod;
//
//   WeatherForecast(
//       {this.coord,
//       this.weather,
//       this.base,
//       this.main,
//       this.visibility,
//       this.wind,
//       this.clouds,
//       this.dt,
//       this.sys,
//       this.timezone,
//       this.id,
//       this.name,
//       this.cod});
//
//   factory WeatherForecast.fromJson(Map<String, dynamic> json) =>
//       _$WeatherForecastFromJson(json);
//
//   Map<String, dynamic> toJson() => _$WeatherForecastToJson(this);
// }
//
// @JsonSerializable()
// class Coord {
//   double? lon;
//   double? lat;
//
//   Coord({this.lon, this.lat});
//
//   factory Coord.fromJson(Map<String, dynamic> json) => _$CoordFromJson(json);
//
//   Map<String, dynamic> toJson() => _$CoordToJson(this);
// }
//
// @JsonSerializable()
// class Weather {
//   int? id;
//   String? main;
//   String? description;
//   String? icon;
//
//   Weather({this.id, this.main, this.description, this.icon});
//
//   factory Weather.fromJson(Map<String, dynamic> json) =>
//       _$WeatherFromJson(json);
//
//   Map<String, dynamic> toJson() => _$WeatherToJson(this);
// }
//
// @JsonSerializable()
// class Main {
//   double? temp;
//   double? feelsLike;
//   double? tempMin;
//   double? tempMax;
//   int? pressure;
//   int? humidity;
//
//   Main(
//       {this.temp,
//       this.feelsLike,
//       this.tempMin,
//       this.tempMax,
//       this.pressure,
//       this.humidity});
//
//   factory Main.fromJson(Map<String, dynamic> json) => _$MainFromJson(json);
//
//   Map<String, dynamic> toJson() => _$MainToJson(this);
// }
//
// @JsonSerializable()
// class Wind {
//   double? speed;
//   int? deg;
//
//   Wind({this.speed, this.deg});
//
//   factory Wind.fromJson(Map<String, dynamic> json) => _$WindFromJson(json);
//
//   Map<String, dynamic> toJson() => _$WindToJson(this);
// }
//
// @JsonSerializable()
// class Clouds {
//   int? all;
//
//   Clouds({this.all});
//
//   factory Clouds.fromJson(Map<String, dynamic> json) => _$CloudsFromJson(json);
//
//   Map<String, dynamic> toJson() => _$CloudsToJson(this);
// }
//
// @JsonSerializable()
// class Sys {
//   int? type;
//   int? id;
//   String? country;
//   int? sunrise;
//   int? sunset;
//
//   Sys({this.type, this.id, this.country, this.sunrise, this.sunset});
//
//   factory Sys.fromJson(Map<String, dynamic> json) => _$SysFromJson(json);
//
//   Map<String, dynamic> toJson() => _$SysToJson(this);
// }
