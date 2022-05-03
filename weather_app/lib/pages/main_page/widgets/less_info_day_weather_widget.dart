import 'package:flutter/material.dart';
import 'package:weather_app/utils/main_colors.dart';
import 'package:weather_app/utils/main_styles.dart';

class LessInfoDayWeatherWidget extends StatelessWidget {
  final Function onTap;
  final Image weatherImage;
  final Text minTemp;
  final Text maxTemp;
  final int index;
  final String date;

  const LessInfoDayWeatherWidget(
      {Key? key,
      required this.maxTemp,
      required this.onTap,
      required this.minTemp,
      required this.weatherImage,
      required this.index,
      required this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            const Expanded(
              flex: 1,
              child: Icon(
                Icons.keyboard_arrow_down,
                color: MainColors.backgroundDark,
              ),
            ),
            Expanded(
              flex: 4,
              child: index == 0
                  ? Text(
                      'Today',
                      style: MainStyles.smallInscriptionsLight,
                    )
                  : Text(
                      date,
                      style: MainStyles.smallInscriptionsLight,
                      overflow: TextOverflow.ellipsis,
                    ),
            ),
            Expanded(flex: 1, child: weatherImage),
            const Spacer(flex: 1),
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  minTemp,
                  const SizedBox(width: 16),
                  maxTemp,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
