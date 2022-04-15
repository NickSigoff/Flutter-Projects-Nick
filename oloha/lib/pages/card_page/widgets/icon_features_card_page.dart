import 'package:flutter/material.dart';

import '../../../utils/restourants.dart';
import '../../global_widgets/horizontal_line_widget.dart';

class IconFeatures extends StatelessWidget {
  final Restaurant item;

  const IconFeatures({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Padding(
          padding: EdgeInsets.only(bottom: 18, top: 10),
          child: HorizontalLine(),
        ),
        InfoLineIconWidget(
            icon: Icon(Icons.coffee_outlined), text: 'Coffee / Breakfast'),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 18),
          child: HorizontalLine(),
        ),
        InfoLineIconWidget(
            icon: Icon(Icons.taxi_alert), text: 'Free bike park'),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 18),
          child: HorizontalLine(),
        ),
        InfoLineIconWidget(
            icon: Icon(Icons.delivery_dining), text: 'Delivery services'),
      ],
    );
  }
}

class InfoLineIconWidget extends StatelessWidget {
  final Icon icon;
  final String text;

  const InfoLineIconWidget({Key? key, required this.icon, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          icon,
          Text(text),
        ],
      ),
    );
  }
}
