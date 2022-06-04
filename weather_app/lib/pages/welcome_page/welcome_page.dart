import 'package:flutter/material.dart';
import 'package:weather_app/data/data_provider.dart';
import 'package:weather_app/pages/main_page/main_page.dart';
import 'package:weather_app/utils/main_colors.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final ratioImageHeight = 0.3;

  final ratioImageWidth = 0.7;

  final TextStyle boldStyle = const TextStyle(
      color: Colors.black,
      fontSize: 32,
      fontWeight: FontWeight.w700);

  final TextStyle regularStyle = const TextStyle(
      color: Colors.black,
      fontSize: 24,
      fontWeight: FontWeight.w400);

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    double imageHeight = MediaQuery.of(context).size.height * ratioImageHeight;
    double imageWidth = MediaQuery.of(context).size.width * ratioImageWidth;

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              MainColors.backgroundDark,
              MainColors.backgroundLight,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: imageHeight,
              width: imageWidth,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/start_icon.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Text('Weather', style: boldStyle),
            Text('Forecast', style: regularStyle),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: CircularProgressIndicator(),
            ),
            const Text('Determining your location',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w400)),
          ],
        ),
      ),
    );
  }

  void getLocation() async {
    DataProvider dataProvider = DataProvider();
    dataProvider.fetchDataAndPushRoute(
        context, MainPage(dataProvider: dataProvider));
  }
}
