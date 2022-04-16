import 'package:flutter/material.dart';

import '../../../utils/main_colors.dart';
import '../../../utils/restourants.dart';

class CustomTabBar extends StatelessWidget {
  final Restaurant item;
  final Function onTap;
  final int selectedPage;

  const CustomTabBar(
      {Key? key,
      required this.item,
      required this.onTap,
      required this.selectedPage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 4;
    return SizedBox(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TabButton(
                width: width,
                selectedPage: selectedPage,
                pageNumber: 0,
                onTap: () {
                  onTap(0);
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: width,
                  //color: Colors.red,
                  child: const Text(
                    'Overview',
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Gilroy-regular',
                        color: Colors.black),
                  ),
                ),
              ),
              TabButton(
                width: width,
                selectedPage: selectedPage,
                pageNumber: 1,
                onTap: () {
                  onTap(1);
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: width,
                  // color: Colors.blue,
                  child: const Text(
                    'Photo',
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Gilroy-regular',
                        color: Colors.black),
                  ),
                ),
              ),
              TabButton(
                width: width,
                selectedPage: selectedPage,
                pageNumber: 2,
                onTap: () {
                  onTap(2);
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: width,
                  // color: Colors.yellow,
                  child: const Text(
                    'Review',
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Gilroy-regular',
                        color: Colors.black),
                  ),
                ),
              ),
              TabButton(
                width: width,
                selectedPage: selectedPage,
                pageNumber: 3,
                onTap: () {
                  onTap(3);
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: width,
                  // color: Colors.green,
                  child: const Text(
                    'Community',
                    softWrap: false,
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Gilroy-regular',
                        color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: 1,
            color: MainColors.horizontalLine,
          ),
        ],
      ),
    );
  }
}

class TabButton extends StatelessWidget {
  final double width;
  final Widget child;
  final int selectedPage;
  final int pageNumber;
  final Function onTap;

  const TabButton(
      {Key? key,
      required this.onTap,
      required this.width,
      required this.child,
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
            child: child,
          ),
          Container(
            color: selectedPage == pageNumber
                ? MainColors.background
                : Colors.transparent,
            height: 4,
            width: width,
          ),
        ],
      ),
    );
  }
}
