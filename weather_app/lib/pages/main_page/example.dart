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
  WeatherForecast weatherForecast = WeatherForecast();


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //getData();
    //print(weatherForecast.timezone);
    return FutureProvider<WeatherForecast>(
      lazy: false,
      initialData: WeatherForecast(),
      create: (BuildContext context) async {
        print(weatherForecast.timezone);
        weatherForecast =
            await WeatherApi().fetchWeatherForecastWithCoordinates();
        print(weatherForecast.timezone);
        return weatherForecast;
      },
      child: MaterialApp(home: HomeP()),
    );
  }

//   void getData() async{
//     weatherForecast = await WeatherApi().fetchWeatherForecastWithCoordinates(lat: 50.0, lon: 50.0);
//   }
// }
}

class HomeP extends StatelessWidget {


  HomeP({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return context.watch<WeatherForecast>().timezone != null ? Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: TextData(),
      ),
      body: BodyWidget(),
    ) : Center(child: CircularProgressIndicator());
  }
}

class BodyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(context.watch<WeatherForecast>().timezone!,
            style: TextStyle(color: Colors.orange)));
  }
}

class TextData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      context.watch<WeatherForecast>().timezone!,
      style: TextStyle(color: Colors.orange),
    );
  }
}

// class _HomeState extends State<Home> {
//   WeatherPresenter? weatherPresenter;
//
//   @override
//   void initState() {
//     weatherPresenter!.getWeather();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Provider(
//       create: (context)=>WeatherPresenter()..getWeather(),
//       child: ChangeNotifierProvider.value(
//           value: weatherPresenter!.weatherForecast, child: StlsW()),
//     );
//   }
// }
//
// class StlsW extends StatelessWidget {
//   const StlsW({Key? key}) : super(key: key);
//
//   // void onTap(BuildContext context){
//   //   context.read<WeatherPresenter>().getWeather();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Text(context.watch<WeatherForecast>().toString()),
//     );
//   }
// }
//
class WeatherPresenter {
  ValueNotifier<WeatherForecast?> weatherForecast = ValueNotifier(null);

  void getWeather({lat, lon}) async {
    weatherForecast.value =
        await WeatherApi().fetchWeatherForecastWithCoordinates();
  }
}
