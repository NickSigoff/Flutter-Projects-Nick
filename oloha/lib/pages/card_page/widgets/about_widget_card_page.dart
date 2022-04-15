import 'package:flutter/material.dart';

import '../../../utils/restourants.dart';

class AboutWidgetCardPage extends StatelessWidget {
  final Restaurant item;

  const AboutWidgetCardPage({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 14.0,
      ),
      child: RichText(
        text: TextSpan(
            text: 'About\n\n',
            style: const TextStyle(
              fontSize: 18,
              fontFamily: 'Gilroy-semibold',
              color: Colors.black,
            ),
            children: [
              TextSpan(
                text: item.about,
                style: const TextStyle(
                  fontSize: 15,
                  fontFamily: 'Gilriy-regular',
                  color: Color(0xff696974),
                ),
              )
            ]),
      ),
    );
  }
}
