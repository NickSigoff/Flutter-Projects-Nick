import 'package:flutter/material.dart';
import 'package:weather_app/utils/main_styles.dart';

class CurrentParameter extends StatelessWidget {
  final String text;
  final String icon;
  final String value;
  final double width;

  const CurrentParameter(
      {Key? key,
      required this.text,
      required this.icon,
      required this.value,
      required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: width,
      child: Row(
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(icon),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: RichText(
              overflow: TextOverflow.visible,
              text: TextSpan(
                  text: text,
                  style: MainStyles.smallInscriptionsDark,
                  children: [
                    TextSpan(
                      text: value,
                      style: MainStyles.smallInscriptionsLight,
                    )
                  ]),
            ),
          )
        ],
      ),
    );
  }
}
