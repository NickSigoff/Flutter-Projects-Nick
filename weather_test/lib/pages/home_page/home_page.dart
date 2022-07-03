import 'package:flutter/material.dart';
import 'package:weather_test/models/weather_forecast.dart';
import 'package:weather_test/pages/daily_forecast/daily_forecast.dart';
import 'package:weather_test/pages/home_page/widgets/main_weather_parameters_widget.dart';
import 'package:weather_test/utils/main_text_styles.dart';

import '../../global_widgets/gradient_text.dart';
import '../../utils/main_gradients.dart';

class HomePage extends StatelessWidget {
  final WeatherForecast? weatherForecast;

  const HomePage({Key? key, this.weatherForecast}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return weatherForecast == null
        ? Scaffold(
            appBar: AppBar(),
            body: Container(
              decoration: const BoxDecoration(
                gradient: MainGradients.backgroundGradient,
              ),
              child: Center(
                child: Text(
                  'Error by fetching data! Check your internet connection',
                  textAlign: TextAlign.center,
                  style: MainTextStyles.topTextTextStyle
                      .copyWith(color: Colors.white),
                ),
              ),
            ),
          )
        : Scaffold(
            appBar: AppBar(
              title:
                  Text('Current weather', style: MainTextStyles.dailyDetails),
              centerTitle: true,
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DailyForecast(
                              weatherForecast: weatherForecast!)));
                    },
                    icon: const Icon(Icons.arrow_forward)),
              ],
            ),
            body: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(32.0),
                decoration: const BoxDecoration(
                  gradient: MainGradients.backgroundGradient,
                ),
                child: Column(
                  children: [
                    _buildCityNameWidget(),
                    MainWeatherParametersWidget(
                      mainWeather: weatherForecast!.list!.first.main,
                      description: weatherForecast!
                          .list!.first.weather!.first.description,
                      wind: weatherForecast!.list!.first.wind,
                    ),
                  ],
                ),
              ),
            ),
          );
  }

  Widget _buildCityNameWidget() {
    if (weatherForecast!.city != null) {
      return GradientText(
          '${weatherForecast!.city!.name ?? ''}, ${weatherForecast!.city!.country ?? ''}',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 50,
            fontWeight: FontWeight.w400,
          ),
          gradient: MainGradients.textGradient);
    } else {
      return const Text('');
    }
  }
}
