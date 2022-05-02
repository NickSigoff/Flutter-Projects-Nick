import 'package:flutter/material.dart';
import 'package:weather_app/utils/main_colors.dart';

class TabButton extends StatelessWidget {
  final double width;
  final String text;
  final int selectedPage;
  final int pageNumber;
  final Function onTap;

  const TabButton(
      {Key? key,
        required this.onTap,
        required this.width,
        required this.text,
        required this.pageNumber,
        required this.selectedPage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: 50,
            width: width,
            child: Text(
              text,
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  color: selectedPage == pageNumber
                      ? MainColors.selectedTextMainPage
                      : MainColors.unSelectedTextMainPage),
            ),
          ),
          Container(
            color: selectedPage == pageNumber
                ? MainColors.selectedTextMainPage //MainColors.background
                : Colors.transparent,
            height: 2,
            width: 30,
          ),
        ],
      ),
    );
  }
}