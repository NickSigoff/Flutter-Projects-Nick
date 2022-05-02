import 'package:flutter/material.dart';
import 'package:weather_app/api/weather_api.dart';

import 'package:weather_app/pages/main_page/widgets/current_date_widget.dart';
import 'package:weather_app/pages/main_page/widgets/custom_tab_bar.dart';
import 'package:weather_app/pages/main_page/widgets/daily_forecast_widget.dart';
import 'package:weather_app/pages/main_page/widgets/general_temp_widget.dart';
import 'package:weather_app/pages/main_page/widgets/general_current_parameters_widget.dart';
import 'package:weather_app/pages/main_page/widgets/hourly_forecast_widget.dart';
import 'package:weather_app/utils/main_gradients.dart';
import 'package:weather_app/utils/main_colors.dart';

import '../../models/weather_forecast.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  late Future<WeatherForecast> forecast;
  int _selectedPage = 0;
  final double latitude = 33.44;
  final double longitude = -94.04;

  void _onTapChangePage(int pageNum) {
    setState(() {
      _selectedPage = pageNum;
    });
  }

  @override
  void initState() {
    super.initState();

    forecast =
        WeatherApi().getWeatherForecastWithCoord(lat: latitude, lon: longitude);

    forecast.then((value) => (value.timezone));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<WeatherForecast>(
        future: forecast,
        builder:
            (BuildContext context, AsyncSnapshot<WeatherForecast> snapshot) {
          return snapshot.hasData
              ? Scaffold(
            appBar: AppBar(
              titleTextStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins'),
              centerTitle: true,
              leading: const Icon(Icons.menu),
              elevation: 0,
              backgroundColor: MainColors.backgroundMainPageLight,
              title: Text(snapshot.data!.timezone!),
              //todo need check?
              actions: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Icon(Icons.more_vert),
                )
              ],
            ),
            body: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.only(bottom: 24),
                decoration: MainGradients.backgroundMainPageGradient,
                alignment: Alignment.center,
                child: Column(
                  children: [
                    CustomTabBar(
                      snapshot: snapshot,
                      onTap: _onTapChangePage,
                      selectedPage: _selectedPage,
                    ),
                    CurrentDateWidget(snapshot: snapshot),
                    GeneralTempWidget(snapshot: snapshot),
                    GeneralCurrentParameters(snapshot: snapshot),
                    HourlyForecast(snapshot: snapshot),
                    DailyForecast(snapshot: snapshot),
                  ],
                ),
              ),
            ),
          )
              : const Center(child: CircularProgressIndicator());
        });
  }
}
