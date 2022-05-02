abstract class Constants {
  //https://api.openweathermap.org/data/2.5/onecall?lat=33.44&lon=-94.04&exclude=alerts,minutely&appid=8f497a8cda33335076d8575eb89a68a8
  //https://api.openweathermap.org/data/2.5/weather?q=London&appid=8f497a8cda33335076d8575eb89a68a8
  static const String weatherAppId = '8f497a8cda33335076d8575eb89a68a8';

  static const String weatherStart = 'https://';
  static const String weatherDomainName = 'api.openweathermap.org';
  static const String weatherExclude = 'alerts,minutely';
  static const String weatherForecastPath = '/data/2.5/onecall';
  static const String weatherImagesPath = 'https://openweathermap.org/img/wn/';

  static const String imagesExtension = '.png';
  static const String degreeMetric = '\u2103';
  static const String speedMetric = 'KM/H';
  static const String pressureMetric = 'mm Hg';

  static const String degreeSymbol = '\u00B0';
}
