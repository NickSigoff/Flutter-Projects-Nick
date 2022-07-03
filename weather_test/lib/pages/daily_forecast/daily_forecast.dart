import 'package:flutter/material.dart';
import 'package:weather_test/models/weather_forecast.dart';
import 'package:weather_test/utils/main_gradients.dart';

import '../../utils/main_text_styles.dart';

class DailyForecast extends StatelessWidget {
  final WeatherForecast weatherForecast;

  const DailyForecast({Key? key, required this.weatherForecast})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Main> weatherList = _buildWeatherList(weatherForecast);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Daily Forecast',
          style: MainTextStyles.dailyDetails,
        ),
        centerTitle: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(top: 16.0, right: 16.0, left: 16.0),
        decoration: const BoxDecoration(
          gradient: MainGradients.backgroundGradient,
        ),
        child: ListView.builder(
          itemCount: weatherList.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: _buildDayForecast(weatherList[index]),
          ),
        ),
      ),
    );
  }

  Widget _buildDayForecast(Main weatherForecast) {
    return Container(
      width: double.infinity,
      height: 250.0,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.2),
        borderRadius: BorderRadius.circular(32.0),
      ),
      child: Column(
        children: [
          Image.network(
              'http://openweathermap.org/img/wn/${weatherForecast.icon}.png', scale: 0.8,),
          RichText(
            text: TextSpan(
                text: 'Date: ',
                style: MainTextStyles.smallInscriptionsDark,
                children: [
                  TextSpan(
                    text: weatherForecast.dtTxt!.substring(0, 11),
                    style: MainTextStyles.smallInscriptionsLight,
                  ),
                ]),
          ),
          RichText(
            text: TextSpan(
                text: 'Temp: ',
                style: MainTextStyles.smallInscriptionsDark,
                children: [
                  TextSpan(
                    text: '${weatherForecast.temp}',
                    style: MainTextStyles.smallInscriptionsLight,
                  ),
                ]),
          ),
          RichText(
            text: TextSpan(
                text: 'Feels like: ',
                style: MainTextStyles.smallInscriptionsDark,
                children: [
                  TextSpan(
                    text: '${weatherForecast.feelsLike}',
                    style: MainTextStyles.smallInscriptionsLight,
                  ),
                ]),
          ),
          RichText(
            text: TextSpan(
                text: 'Humidity: ',
                style: MainTextStyles.smallInscriptionsDark,
                children: [
                  TextSpan(
                    text: '${weatherForecast.humidity}',
                    style: MainTextStyles.smallInscriptionsLight,
                  ),
                ]),
          ),
        ],
      ),
    );
  }

  List<Main> _buildWeatherList(WeatherForecast weatherForecast) {
    List<Main> result = [];
    for (int i = 1; i < 4; i++) {
      Main weather = weatherForecast.list![i * 8].main!;
      weather.dtTxt = weatherForecast.list![i * 8].dtTxt!;
      weather.icon = weatherForecast.list![i * 8].weather![0].icon;
      result.add(weather);
    }
    result.sort((a, b) => a.temp!.compareTo(b.temp!));
    return result;
  }
}
