import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';


import '../../../data/data_provider.dart';
import '../../../utils/constants.dart';
import '../../../utils/main_colors.dart';
import '../../../utils/main_styles.dart';

class LessInfoDayWeatherWidget extends StatelessWidget {
  final void Function(int index) onTap;
  final int index;

  const LessInfoDayWeatherWidget({
    Key? key,
    required this.onTap,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dailyWeather =
        context.watch<DataProvider>().getForecast.daily![index];
    Image weatherImage = Image.network(
        dailyWeather.getDailyIconUrl() + Constants.imagesExtension);

    Text minTemp = Text(
        '${dailyWeather.temp!.min!.toStringAsFixed(0)}${Constants.degreeMetric}',
        style: MainStyles.smallInscriptionsLight);

    Text maxTemp = Text(
        '${dailyWeather.temp!.max!.toStringAsFixed(0)}${Constants.degreeMetric}',
        style: MainStyles.smallInscriptionsLight);

    Text date = Text(
      getDate(dailyWeather.dt!),
      style: MainStyles.smallInscriptionsLight,
      overflow: TextOverflow.ellipsis,
    );

    return GestureDetector(
      onTap: () {
        onTap(index);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(color: MainColors.unSelectedTextMainPage)),
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
                    : date,
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
      ),
    );
  }

  String getDate(int time) {
    var date = DateTime.fromMillisecondsSinceEpoch(time * 1000);
    return DateFormat('EEEE, d MMM, yyyy').format(date);
  }
}
