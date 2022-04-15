import 'package:flutter/material.dart';

import '../../../utils/main_colors.dart';

class ButtonCardLineWidgetMainPage extends StatelessWidget {
  const ButtonCardLineWidgetMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          ButtonCardWidget(
              icon: Icon(
                Icons.fastfood_outlined,
                size: 45,
              )),
          ButtonCardWidget(
              icon: Icon(
                Icons.shopping_cart_outlined,
                size: 45,
              )),
          ButtonCardWidget(
              icon: Icon(
                Icons.hotel_outlined,
                size: 45,
              )),
          ButtonCardWidget(
              icon: Icon(
                Icons.calendar_today,
                size: 45,
              )),
        ],
      ),
    );
  }
}

class ButtonCardWidget extends StatelessWidget {
  final Icon icon;

  const ButtonCardWidget({required this.icon, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 6,
          right: 6,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(36),
            child: Container(
              width: 36,
              height: 36,
              color: MainColors.background,
            ),
          ),
        ),
        Container(
          width: 68,
          height: 68,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: MainColors.horizontalLine)),
          child: icon,
        ),
      ],
    );
  }
}