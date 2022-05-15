import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/utils/constants.dart';
import 'package:weather_app/utils/main_colors.dart';
import 'package:weather_app/utils/main_gradients.dart';
import 'package:weather_app/utils/main_styles.dart';

import '../../../data/data_provider.dart';

class DrawerMainPageWidget extends StatelessWidget {
  const DrawerMainPageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var weatherForecast = context.watch<DataProvider>().getForecast;
    return Drawer(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
        decoration: MainGradients.drawerBackgroundGradient,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                _buildAvatarWidget(),
                const SizedBox(width: 11.0),
                Text('Sign in', style: MainStyles.drawerMain),
              ],
            ),
            const Divider(
              height: 32.0,
              thickness: 1.0,
              color: MainColors.unSelectedTextMainPage,
            ),
            Row(
              children: [
                Text('Location', style: MainStyles.drawerMain),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Container(
                    height: 16,
                    width: 1,
                    color: MainColors.unSelectedTextMainPage,
                  ),
                ),
                Text('Edit', style: MainStyles.drawerEdit),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Icon(Icons.location_on_rounded, color: Colors.white),
                RichText(
                  text: TextSpan(
                      text: '${weatherForecast.timezone}\n',
                      style: MainStyles.smallInscriptionsLight,
                      children: [
                        TextSpan(
                            text:
                                '${weatherForecast.current!.temp!.toStringAsFixed(0)}${Constants.degreeMetric}, ${weatherForecast.current!.weather![0].main}',
                            style: MainStyles.smallInscriptionsDark)
                      ]),
                )
              ],
            ),
            const Divider(
              height: 32.0,
              thickness: 1.0,
              color: MainColors.unSelectedTextMainPage,
            ),
            Text('Tools', style: MainStyles.smallInscriptionsDark),
            ..._buildTollsRows(),
          ],
        ),
      ),
    );
  }

  Widget _buildAvatarWidget() {
    return Container(
      width: 36.0,
      height: 36.0,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(36.0)),
      child: const Icon(
        Icons.person,
        color: Colors.black,
      ),
    );
  }

  List<Widget> _buildTollsRows() {
    List<Widget> result = [];
    const Map<String, IconData> toolsMap = {
      'Notifications': Icons.notifications,
      'Settings': Icons.settings,
      'Sed feedback': Icons.feedback,
      'Rate this app': Icons.star,
      'Share your weather': Icons.share,
    };
    toolsMap.forEach((key, value) {
      result.add(Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            Icon(value, color: Colors.white),
            const SizedBox(width: 16.0),
            Text(key, style: MainStyles.drawerMain),
          ],
        ),
      ));
    });
    return result;
  }
}
