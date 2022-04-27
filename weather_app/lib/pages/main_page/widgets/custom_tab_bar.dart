import 'package:flutter/material.dart';

import '../../../utils/main_colors.dart';

class CustomTabBar extends StatelessWidget {
  final Function onTap;
  final int selectedPage;

  CustomTabBar({Key? key, required this.onTap, required this.selectedPage})
      : super(key: key);

  final List<String> tabBarPagesNames = ['Today', 'Tomorrow', 'Forecast'];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / tabBarPagesNames.length;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ...List<Widget>.generate(
          tabBarPagesNames.length,
          (index) => TabButton(
            pageNumber: index,
            onTap: () {
              onTap(index);
            },
            selectedPage: selectedPage,
            width: width,
            text: tabBarPagesNames[index],
          ),
        )
      ],
    );
  }
}

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
            //color: Colors.red,
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
