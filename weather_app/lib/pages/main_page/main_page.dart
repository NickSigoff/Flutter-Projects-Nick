import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:weather_app/pages/main_page/tab_bar_pages/today_page.dart';
import 'package:weather_app/pages/main_page/tab_bar_pages/daily_details_page.dart';
import 'package:weather_app/pages/main_page/widgets/drawer_main_page_widget.dart';

import 'package:weather_app/pages/main_page/widgets/tab_bar_widget/tab_bar_widget.dart';
import 'package:weather_app/utils/main_gradients.dart';
import 'package:weather_app/utils/main_colors.dart';

import '../../api/weather_api.dart';
import '../../data/data_provider.dart';
import '../../models/weather_forecast.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedPage = 0;
  late WeatherForecast forecast;
  DataProvider dataProvider = DataProvider();

  void _onTapChangePage(int pageNum) {
    setState(() {
      _selectedPage = pageNum;
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    forecast = ModalRoute.of(context)!.settings.arguments as WeatherForecast;
    dataProvider.forecast = forecast;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DataProvider>(
      create: (BuildContext context) => dataProvider,
      child: Scaffold(
        appBar: AppBar(
          titleTextStyle: const TextStyle(
              fontSize: 14, fontWeight: FontWeight.w500, fontFamily: 'Poppins'),
          centerTitle: true,
          elevation: 0,
          backgroundColor: MainColors.backgroundMainPageLight,
          title: Text(dataProvider.getForecast.timezone!),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GestureDetector(
                  child: const Icon(Icons.place),
                  onTap: () async {
                    dataProvider.forecast = await WeatherApi()
                        .fetchWeatherForecastWithCoordinates();
                    dataProvider.notify();
                    setState(() {});
                  }),
            )
          ],
        ),
        drawer: const DrawerMainPageWidget(),
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
      default:
        return Container();
    }
  }

  Future<WeatherForecast> getWeather() async {
    return await WeatherApi().fetchWeatherForecastWithCoordinates();
  }
}
