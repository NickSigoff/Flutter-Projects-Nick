import 'package:flutter/material.dart';

import 'package:oloha/pages/main_page/widgets/avatars_line_main_page_widget.dart';
import 'package:oloha/pages/main_page/widgets/button_card_widget_main_page.dart';
import 'package:oloha/pages/main_page/widgets/city_country_ weather_widget.dart';
import 'package:oloha/pages/global_widgets/horizontal_line_widget.dart';
import 'package:oloha/pages/main_page/widgets/restaurants_list_main_page_widget.dart';
import 'package:oloha/utils/main_colors.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: const EdgeInsets.only(top: 50),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.89,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              CityCountryWeatherWidgetMainPage(),
              Padding(
                padding:
                    EdgeInsets.symmetric(vertical: 30),
                child: AvatarLineWidgetMainPage(),
              ),
              HorizontalLine(),
              RestaurantsListWidgetMainPage(),
              HorizontalLine(),
              ButtonCardLineWidgetMainPage(),
              HorizontalLine(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 80,
        child: BottomNavigationBar(
          iconSize: 30,
          elevation: 20,
          unselectedItemColor: MainColors.horizontalLine,
          selectedItemColor: Colors.black,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.map_outlined,
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.map_outlined,
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.calendar_today_outlined,
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person_add,
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person_pin,
              ),
              label: "",
            ),
          ],
        ),
      ),
    );
  }
}
