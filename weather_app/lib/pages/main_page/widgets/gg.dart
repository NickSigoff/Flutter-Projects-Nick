import 'package:flutter/material.dart';

class IconsInfo extends StatelessWidget{
  final List<String> iconsText = ['Precipitation:', 'Wind:', 'Humidity:', 'Sunset:'];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Wrap(

        alignment: WrapAlignment.center,
        children: [
          ...List<Widget>.generate(4, (index) => Item(text: iconsText[index]))
        ],

      ),
    );
  }

}

class Item extends StatelessWidget{

  final String text;

  Item({required this.text});
  @override
  Widget build(BuildContext context) {
    double width = (MediaQuery.of(context).size.width - 32) / 2;

    return Container(
      height: 30,
      width: width,
      child: Row(
        children: [
          Icon(Icons.cloud),
          Text(text)
        ],
      ),

    );
  }

}