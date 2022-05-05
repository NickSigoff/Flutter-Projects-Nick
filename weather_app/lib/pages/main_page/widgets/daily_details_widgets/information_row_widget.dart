import 'package:flutter/material.dart';
import 'package:weather_app/utils/main_colors.dart';
import 'package:weather_app/utils/main_styles.dart';

class InformationRow extends StatelessWidget {
  final String icon;
  final String text;
  final String value;

  const InformationRow({
    Key? key,
    required this.icon,
    required this.value,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(icon),
              Text(
                text,
                style: MainStyles.dailyDetails,
              ),
              const Spacer(),
              Text(
                value,
                style: MainStyles.dailyDetails,
              ),
            ],
          ),
          const Divider(
            thickness: 1,
            color: MainColors.unSelectedTextMainPage,
          ),
        ],
      ),
    );
  }
}
