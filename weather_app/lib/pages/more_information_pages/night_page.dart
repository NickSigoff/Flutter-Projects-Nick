import 'package:flutter/cupertino.dart';
import 'package:weather_app/pages/more_information_pages/pattern_page.dart';

class NightPage extends StatelessWidget{

  final String image = 'assets/images/welcome_images/night.png';
  final String topText = 'Detailed Hourly Forecast';
  final String bottomText = 'Get in - depth weather information';


  @override
  Widget build(BuildContext context) {
    return PatternPage(image: image, bottomText: bottomText, topText: topText);
  }

}