import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:weather_app/pages/main_page/tab_bar_pages/calendar_page.dart';
import 'package:weather_app/pages/main_page/tab_bar_pages/today_page.dart';
import 'package:weather_app/pages/main_page/tab_bar_pages/daily_details_page.dart';

import 'package:weather_app/pages/main_page/widgets/tab_bar_widget/tab_bar_widget.dart';
import 'package:weather_app/utils/main_gradients.dart';
import 'package:weather_app/utils/main_colors.dart';

import '../../models/weather_forecast.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedPage = 0;
  late WeatherForecast forecast;

  void _onTapChangePage(int pageNum) {
    setState(() {
      _selectedPage = pageNum;
    });
  }

  @override
  Widget build(BuildContext context) {
    forecast = ModalRoute.of(context)!.settings.arguments as WeatherForecast;

    return Provider(
      create: (BuildContext context) => forecast,
      child: Scaffold(
        appBar: AppBar(
          titleTextStyle: const TextStyle(
              fontSize: 14, fontWeight: FontWeight.w500, fontFamily: 'Poppins'),
          centerTitle: true,
          leading: const Icon(Icons.menu),
          elevation: 0,
          backgroundColor: MainColors.backgroundMainPageLight,
          title: Text(forecast.timezone!),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GestureDetector(
                child: const Icon(Icons.place),
                onTap: () {
                  setState(() {
                    //forecast = WeatherApi().fetchWeatherForecastWithCoordinates();
                  });
                },
              ),
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
                TabBarWidget(
                  onTap: _onTapChangePage,
                  selectedPage: _selectedPage,
                ),
                chooseTabBarPage(_selectedPage),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget chooseTabBarPage(int selectedPage) {
    switch (selectedPage) {
      case 0:
        return const TodayPage();
      case 1:
        return const DailyDetailsPage();
      case 2:
        return const CalendarPage();
      default:
        return Container();
    }
  }
}
