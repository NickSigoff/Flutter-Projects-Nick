import 'package:flutter/material.dart';

class HourlyForecast extends StatelessWidget {
  getCurrentHour() {
    var date = DateTime.now().toString();
    var dateParse = DateTime.parse(date);
    var formattedDate = '${dateParse.hour}';
    return formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [...List<Widget>.generate(23, (index) => HourWeatherWidget())],
      ),
    );
  }
}

class HourWeatherWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

}
