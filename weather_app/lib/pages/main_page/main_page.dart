import 'package:flutter/material.dart';
import 'package:weather_app/pages/main_page/widgets/current_date_widget_main_page.dart';
import 'package:weather_app/pages/main_page/widgets/custom_tab_bar.dart';
import 'package:weather_app/pages/main_page/widgets/daily_forecast.dart';
import 'package:weather_app/pages/main_page/widgets/general_weather_widget.dart';
import 'package:weather_app/pages/main_page/widgets/general_parameters_widget.dart';
import 'package:weather_app/pages/main_page/widgets/hourly_forecast_widget.dart';
import 'package:weather_app/utils/main_colors.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedPage = 0;

  void _onTapChangePage(int pageNum) {
    setState(() {
      _selectedPage = pageNum;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleTextStyle: const TextStyle(
            fontSize: 14, fontWeight: FontWeight.w500, fontFamily: 'Poppins'),
        centerTitle: true,
        leading: const Icon(Icons.menu),
        elevation: 0,
        backgroundColor: MainColors.backgroundMainPageLight,
        title: const Text('Your city, Your country'),
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
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                MainColors.backgroundMainPageLight,
                MainColors.backgroundMainPageDark,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          alignment: Alignment.center,
          child: Column(
            children: [
              CustomTabBar(
                onTap: _onTapChangePage,
                selectedPage: _selectedPage,
              ),
              CurrentDateWidget(),
              const GeneralWeatherWidget(),
              // Divider(
              //   thickness: 1,
              //   color: Colors.red,
              // ),
              GeneralParameters(),
              const HourlyForecast(),
              const DailyForecast(),
            ],
          ),
        ),
      ),
    );
  }
}
