import 'package:flutter/material.dart';
import 'package:oloha/utils/main_colors.dart';

class CityCountryWeatherWidgetMainPage extends StatelessWidget {
  const CityCountryWeatherWidgetMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Hanoi, Vietnam',
                style: TextStyle(fontFamily: 'Gilroy-semibold', fontSize: 20),
              ),
              Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(right: 9),
                    child: Icon(
                      Icons.wb_cloudy_outlined,
                      color: MainColors.hintColor,
                    ),
                  ),
                  Text(
                    '17 \u2103',
                    style: TextStyle(
                      fontFamily: 'Gilroy-regular',
                      fontSize: 16,
                      color: MainColors.hintColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Icon(
            Icons.search,
            size: 30,
          ),
        ],
      ),
    );
  }
}
