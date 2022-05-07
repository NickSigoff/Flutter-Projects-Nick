import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../api/weather_api.dart';
import '../../models/weather_forecast.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  WeatherPresenter? weatherPresenter;

  @override
  void initState() {
    weatherPresenter!.getWeather();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context)=>WeatherPresenter()..getWeather(),
      child: ChangeNotifierProvider.value(
          value: weatherPresenter!.weatherForecast, child: StlsW()),
    );
  }
}

class StlsW extends StatelessWidget {
  const StlsW({Key? key}) : super(key: key);
  void onTap(BuildContext context){
    context.read<WeatherPresenter>().getWeather();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(context.watch<WeatherForecast>().toString()),
    );
  }
}

class WeatherPresenter {
  ValueNotifier<WeatherForecast?> weatherForecast = ValueNotifier(null);

  void getWeather({lat, lon}) async {
    weatherForecast.value =
    await WeatherApi().fetchWeatherForecastWithCoordinates();
  }
}
